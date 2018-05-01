//
//  SwpCoolAnimations+SwpLines.m
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations+SwpLines.h"

#define HLINEHEIGHT 4.0


@implementation SwpCoolAnimations (SwpLines)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 跳转，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection {
    _LinesAnimation(transitionContext, _toDuration, YES, lineDirection);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 返回，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection {
    _LinesAnimation(transitionContext, _backDuration, NO, lineDirection);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation   ( 跳转，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolLineDirection))swpCoolLinesToAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolLineDirection lineDirection) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolLinesToAnimation:transitionContext lineDirection:lineDirection];
        return swpCoolAnimators;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation   ( 返回，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolLineDirection))swpCoolLinesBackAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolLineDirection lineDirection) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolLinesBackAnimation:transitionContext lineDirection:lineDirection];
        return swpCoolAnimators;
    };
}



#pragma mark - Private Methods

FOUNDATION_STATIC_INLINE void _LinesAnimation(id<UIViewControllerContextTransitioning>transitionContext, NSTimeInterval duration, BOOL isToAnimation, SwpCoolLineDirection lineDirection) {
    
    UIViewController *fromVC    = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC      = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView              = toVC.view;
    UIView *containerView       = [transitionContext containerView];
    [containerView insertSubview:toView atIndex:0];
    
    NSArray *outgoingLineViews = _LineViews(fromVC.view, HLINEHEIGHT, fromVC.view.frame.origin.y, containerView, lineDirection);
    NSArray *incomingLineViews = _LineViews(toView, HLINEHEIGHT, toView.frame.origin.y , containerView, lineDirection);
    CGFloat toViewStart        = lineDirection ? toView.frame.origin.y : toView.frame.origin.x;
    BOOL presenting            = isToAnimation;
    
    lineDirection ? _RepositionViewSlicesMoveFirstFrameUp(incomingLineViews, NO) : _RepositionViewSlicesMoveLeft(incomingLineViews, !presenting);
    
    fromVC.view.hidden         = YES;
    toView.hidden              = YES;
    
    [UIView animateWithDuration:duration - 0.01 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        lineDirection ? _RepositionViewSlicesMoveFirstFrameUp(outgoingLineViews, YES) : _RepositionViewSlicesMoveLeft(outgoingLineViews, presenting);
        _ResetViewSlices(incomingLineViews, toViewStart, lineDirection);
    } completion:^(BOOL finished) {
        
        fromVC.view.hidden  = NO;
        toView.hidden       = NO;
        [toView setNeedsUpdateConstraints];
        for (UIView *view in incomingLineViews) {
            [view removeFromSuperview];
        }
        for (UIView *view in outgoingLineViews) {
            [view removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


FOUNDATION_STATIC_INLINE NSArray<UIView *> * _LineViews(UIView *view, CGFloat intoSlicesDis, CGFloat yOffset, UIView *containerView, SwpCoolLineDirection lineDirection) {
    
    CGFloat width = lineDirection ? CGRectGetHeight(view.frame) : CGRectGetWidth(view.frame);
    CGFloat height = !lineDirection ? CGRectGetHeight(view.frame) : CGRectGetWidth(view.frame);
    UIImage *img = _ImageFromsnapshotView(view);
    NSMutableArray *lineViews = [NSMutableArray array];
    for (int i = 0; i < height; i += intoSlicesDis) {
        CGRect subrect = lineDirection ? CGRectMake(i, 0, intoSlicesDis, width) : CGRectMake(0, i, width, intoSlicesDis);
        UIView *subsnapshot             = [UIView new];
        subsnapshot.layer.contents      = (__bridge id)img.CGImage;
        subsnapshot.layer.contentsRect  = lineDirection ? CGRectMake((float)i / view.frame.size.width, 0.0,  intoSlicesDis / view.frame.size.width, 1.0) : CGRectMake(0, (float)i / view.frame.size.height, 1.0, intoSlicesDis / view.frame.size.height);
        subrect.origin.x    +=  yOffset;
        subsnapshot.frame   =   subrect;
        [lineViews addObject:subsnapshot];
        [containerView addSubview:subsnapshot];
    }
    return lineViews;
}

FOUNDATION_STATIC_INLINE UIImage * _ImageFromsnapshotView(UIView *view) {
    CALayer *layer          = view.layer;
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, 0);
    CGContextRef context    = UIGraphicsGetCurrentContext();
    [layer renderInContext:context];
    UIImage *image          = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

FOUNDATION_STATIC_INLINE void _RepositionViewSlicesMoveLeft(NSArray *views, BOOL left) {
    CGRect frame;
    float width;
    for (UIView *line in views) {
        frame = line.frame;
        width = CGRectGetWidth(frame) * _RandomFloat(1.0, 8.0);
        frame.origin.x += (left)?-width:width;
        line.frame = frame;
    }
}

FOUNDATION_STATIC_INLINE void _RepositionViewSlicesMoveFirstFrameUp(NSArray *views, BOOL startUp) {
    BOOL up = startUp;
    CGRect frame;
    float height;
    for (UIView *line in views) {
        frame = line.frame;
        height = CGRectGetHeight(frame) * _RandomFloat(1.0, 4.0);
        frame.origin.y += (up)?-height:height;
        line.frame = frame;
        up = !up;
    }
}

FOUNDATION_STATIC_INLINE void _ResetViewSlices(NSArray *views, CGFloat toOrigin, SwpCoolLineDirection lineDirection) {
    CGRect frame;
    for (UIView *line in views) {
        frame = line.frame;
        if (lineDirection) {
            frame.origin.y = toOrigin;
        }else{
            frame.origin.x = toOrigin;
        }
        line.frame = frame;
    }
}

FOUNDATION_STATIC_INLINE float _RandomFloat(float max, float min){
    return ((float)arc4random() / 0x100000000) * (max - min) + min;
}

@end
