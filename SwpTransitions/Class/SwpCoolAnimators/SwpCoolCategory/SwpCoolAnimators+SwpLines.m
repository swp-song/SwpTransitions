//
//  SwpCoolAnimators+SwpLines.m
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpLines.h"

#define HLINEHEIGHT 4.0


@implementation SwpCoolAnimators (SwpLines)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 跳转转场，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection {
    [self _animateTransition:transitionContext duration:self.transitionsToDuration flag:YES lineDirection:lineDirection];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 关闭转场，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection {
    [self _animateTransition:transitionContext duration:self.transitionsBackDuration flag:NO lineDirection:lineDirection];
}




/**
 *  @author swp_song
 *
 *  @brief  _animateTransition:duration:flag:lineDirection: ( 线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  duration            duration
 *
 *  @param  flag                flag
 *
 *  @param  lineDirection       lineDirection
 */
- (void)_animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext duration:(NSTimeInterval)duration flag:(BOOL)flag lineDirection:(SwpCoolLineDirection)lineDirection {
    
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *toView        = toVC.view;
    UIView           *containerView = [transitionContext containerView];
    [containerView insertSubview:toView atIndex:0];
    NSArray *outgoingLineViews      = [self _lineViews:fromVC.view intoSlicesOfDis:HLINEHEIGHT Offset:fromVC.view.frame.origin.y containerView:containerView lineDirection:lineDirection];
    NSArray *incomingLineViews      = [self _lineViews:toView intoSlicesOfDis:HLINEHEIGHT Offset:toView.frame.origin.y containerView:containerView lineDirection:lineDirection];
    CGFloat toViewStart             = lineDirection ? toView.frame.origin.y : toView.frame.origin.x;
    BOOL presenting                 = flag;
    lineDirection ? [self _repositionViewSlices:incomingLineViews moveFirstFrameUp:NO] : [self _repositionViewSlices:incomingLineViews moveLeft:!presenting];
    fromVC.view.hidden              = YES;
    toView.hidden                   = YES;
    [UIView animateWithDuration:duration - 0.01 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        lineDirection ? [self _repositionViewSlices:outgoingLineViews moveFirstFrameUp:YES] : [self _repositionViewSlices:outgoingLineViews moveLeft:presenting];
        [self _resetViewSlices:incomingLineViews toOrigin:toViewStart lineDirection:lineDirection];
        
    } completion:^(BOOL finished) {
        
        fromVC.view.hidden  = NO;
        toView.hidden       = NO;
        [toView setNeedsUpdateConstraints];
        for (UIView *v in incomingLineViews) {
            [v removeFromSuperview];
        }
        for (UIView *v in outgoingLineViews) {
            [v removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}



- (NSArray<UIView *> *)_lineViews:(UIView *)view intoSlicesOfDis:(float)dis Offset:(float)yOffset containerView:(UIView *)containerView lineDirection:(SwpCoolLineDirection)lineDirection {
    
    CGFloat         width       = lineDirection ? CGRectGetHeight(view.frame) : CGRectGetWidth(view.frame);
    CGFloat         height      = !lineDirection ? CGRectGetHeight(view.frame) : CGRectGetWidth(view.frame);
    UIImage         *img        = [self _imageFromsnapshotView:view];
    NSMutableArray  *lineViews  = [NSMutableArray array];
    
    for (int i = 0; i < height; i += dis) {
        CGRect subrect                  = lineDirection ? CGRectMake(i, 0, dis, width) : CGRectMake(0, i, width, dis);
        UIView *subsnapshot             = [UIView new];
        subsnapshot.layer.contents      = (__bridge id)img.CGImage;
        subsnapshot.layer.contentsRect  = lineDirection ? CGRectMake((float)i / view.frame.size.width, 0.0,  dis / view.frame.size.width, 1.0) : CGRectMake(0, (float)i / view.frame.size.height, 1.0, dis / view.frame.size.height);
        
        subrect.origin.x                +=  yOffset;
        subsnapshot.frame               =   subrect;
        [lineViews addObject:subsnapshot];
        [containerView addSubview:subsnapshot];
    }
    return lineViews;
}

- (UIImage *)_imageFromsnapshotView:(UIView *)view {
    CALayer *layer       = view.layer;
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [layer renderInContext:context];
    UIImage      *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



-(void)_repositionViewSlices:(NSArray *)views moveLeft:(BOOL)left {
    CGRect frame;
    float width;
    for (UIView *line in views) {
        frame           = line.frame;
        width           = CGRectGetWidth(frame) * [self _random:1.0 min:8.0];
        frame.origin.x += (left)?-width:width;
        line.frame      = frame;
    }
}

-(void)_repositionViewSlices:(NSArray *)views moveFirstFrameUp:(BOOL)startUp {
    
    BOOL up = startUp;
    CGRect frame;
    float height;
    for (UIView *line in views) {
        frame           = line.frame;
        height          = CGRectGetHeight(frame) * [self _random:1.0 min:4.0];
        frame.origin.y += (up)?-height:height;
        line.frame      = frame;
        up = !up;
    }
}

-(void)_resetViewSlices:(NSArray *)views toOrigin:(CGFloat)o lineDirection:(SwpCoolLineDirection)lineDirection {
    
    CGRect frame;
    for (UIView *line in views) {
        frame = line.frame;
        if (lineDirection) {
            frame.origin.y = o;
        }else{
            frame.origin.x = o;
        }
        line.frame = frame;
    }
}

- (CGFloat)_random:(CGFloat)max min:(CGFloat)min {
    return ((CGFloat)arc4random() / 0x100000000) * (max - min) + min;
}

@end
