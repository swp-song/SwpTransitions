//
//  SwpCoolAnimations+SwpOrigami.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpOrigami.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */


@implementation SwpCoolAnimations (SwpOrigami)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:edge:  ( 跳转，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 *
 *  @param  count               count
 */
- (void)swpCoolOrigamiToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolOrigamiEdge)edge {
    _OrigamiAnimation(transitionContext, edge, _toDuration, _swpOrigamiCount);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:edge:   ( 返回，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 *
 *  @param  count               count
 */
- (void)swpCoolOrigamiBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolOrigamiEdge)edge {
    _OrigamiAnimation(transitionContext, edge, _backDuration, _swpOrigamiCount);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiToAnimation   ( 跳转，折纸效果动画 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolOrigamiEdge))swpCoolOrigamiToAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolOrigamiEdge edge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolOrigamiToAnimation:transitionContext edge:edge];
        return swpCoolAnimators;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation ( 返回，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolOrigamiEdge))swpCoolOrigamiBackAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolOrigamiEdge edge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolOrigamiBackAnimation:transitionContext edge:edge];
        return swpCoolAnimators;
    };
}


#pragma mark - Private Methods

FOUNDATION_STATIC_INLINE void _OrigamiAnimation(id<UIViewControllerContextTransitioning> transitionContext, SwpCoolOrigamiEdge edge, NSTimeInterval duration, NSInteger count) {
    
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *toView        = toVC.view;
    UIView           *fromView      = fromVC.view;
    UIView           *containerView = [transitionContext containerView];
    toView.frame                    = [transitionContext finalFrameForViewController:toVC];
    toView.frame                    = CGRectOffset(toView.frame, toView.frame.size.width, 0);
    [containerView addSubview:toView];
    
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = -0.005;
    containerView.layer.sublayerTransform = transform;
    CGSize size                     = toView.frame.size;
    float foldWidth                 = size.width * 0.5 / (float)count ;
    NSMutableArray *fromViewFolds   = [NSMutableArray new];
    NSMutableArray *toViewFolds     = [NSMutableArray new];
    
    UIImage         *fromImage      = fromView.swpAnimatorsSnapshotImage;
    UIImage         *toImage        = toView.swpAnimatorsSnapshotImage;
    
    for (int i=0; i<count; i++){
        
        float offset = (float)i * foldWidth * 2;
        UIView *leftFromViewFold            = _CreateSnapshot(fromView, offset, SwpCoolOrigamiRight, fromImage, count);
        leftFromViewFold.layer.position     = CGPointMake(offset, size.height/2);
        [fromViewFolds addObject:leftFromViewFold];
        
        [leftFromViewFold.subviews[1] setAlpha:0.0];
        UIView *rightFromViewFold           = _CreateSnapshot(fromView, offset + foldWidth, SwpCoolOrigamiLeft, fromImage, count);
        rightFromViewFold.layer.position    = CGPointMake(offset + foldWidth * 2, size.height / 2);
        [fromViewFolds addObject:rightFromViewFold];
        
        [rightFromViewFold.subviews[1] setAlpha:0.0];
        UIView *leftToViewFold              = _CreateSnapshot(toView, offset, SwpCoolOrigamiRight, toImage, count);
        leftToViewFold.layer.position       = CGPointMake(edge == SwpCoolOrigamiRight ? size.width : 0.0, size.height / 2);
        leftToViewFold.layer.transform      = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 0.0);
        [toViewFolds addObject:leftToViewFold];
        
        UIView *rightToViewFold             = _CreateSnapshot(toView, offset + foldWidth, SwpCoolOrigamiLeft, toImage, count);
        rightToViewFold.layer.position      = CGPointMake(edge == SwpCoolOrigamiRight ? size.width : 0.0, size.height / 2);
        rightToViewFold.layer.transform     = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
        [toViewFolds addObject:rightToViewFold];
    }
    
    fromView.frame = CGRectOffset(fromView.frame, fromView.frame.size.width, 0);
    
    [UIView animateWithDuration:duration animations:^{
        
        for (int i=0; i<count; i++) {
            float offset                    = (float)i * foldWidth * 2;
            UIView *leftFromView            = fromViewFolds[i * 2];
            leftFromView.layer.position     = CGPointMake(edge == SwpCoolOrigamiRight ? 0.0 : size.width, size.height / 2);
            leftFromView.layer.transform    = CATransform3DRotate(transform, M_PI_2, 0.0, 1.0, 0);
            
            [leftFromView.subviews[1] setAlpha:1.0];
            UIView *rightFromView           = fromViewFolds[ i * 2 + 1];
            rightFromView.layer.position    = CGPointMake(edge == SwpCoolOrigamiRight ? 0.0 : size.width, size.height / 2);
            rightFromView.layer.transform   = CATransform3DRotate(transform, -M_PI_2, 0.0, 1.0, 0);
            
            [rightFromView.subviews[1] setAlpha:1.0];
            UIView* leftToView              = toViewFolds[i*2];
            leftToView.layer.position       = CGPointMake(offset, size.height/2);
            leftToView.layer.transform      = CATransform3DIdentity;
            
            [leftToView.subviews[1] setAlpha:0.0];
            UIView* rightToView             = toViewFolds[i*2+1];
            rightToView.layer.position      = CGPointMake(offset + foldWidth * 2, size.height/2);
            rightToView.layer.transform     = CATransform3DIdentity;
            [rightToView.subviews[1] setAlpha:0.0];
        }
        
    }  completion:^(BOOL finished) {
        for (UIView *view in toViewFolds) {
            [view removeFromSuperview];
        }
        for (UIView *view in fromViewFolds) {
            [view removeFromSuperview];
        }
        
        BOOL transitionFinished = ![transitionContext transitionWasCancelled];
        if (transitionFinished) {
            toView.frame    = containerView.bounds;
            fromView.frame   = containerView.bounds;
        }
        else {
            fromView.frame  = containerView.bounds;
        }
        [transitionContext completeTransition:transitionFinished];
    }];
    
}

FOUNDATION_STATIC_INLINE UIView * _CreateSnapshot(UIView *view, CGFloat location, SwpCoolOrigamiEdge edge, UIImage *image, NSInteger origamiCount) {
    CGSize size             = view.frame.size;
    UIView *containerView   = view.superview;
    float  foldWidth        = size.width * 0.5 / (float)origamiCount ;
    UIView *snapshotView    = [UIView new];
    CGRect snapshotRegion   = CGRectMake(location, 0.0, foldWidth, size.height);
    snapshotView.frame      = snapshotRegion;
    snapshotView.swpAnimatorsContentImage = image;
    snapshotView.layer.contentsRect = CGRectMake(location / size.width, 0.0, foldWidth / size.width, 1.0f);
    UIView* snapshotWithShadowView  = _AddShadow(snapshotView, edge);
    [containerView addSubview:snapshotWithShadowView];
    snapshotWithShadowView.layer.anchorPoint = CGPointMake(edge == SwpCoolOrigamiRight ? 0.0 : 1.0, 0.5);
    
    return snapshotWithShadowView;
}


FOUNDATION_STATIC_INLINE UIView * _AddShadow(UIView *view, SwpCoolOrigamiEdge edge) {
    
    UIView          *viewWithShadow  = [[UIView alloc] initWithFrame:view.frame];
    UIView          *shadowView      = [[UIView alloc] initWithFrame:viewWithShadow.bounds];
    CAGradientLayer *gradient        = [CAGradientLayer layer];
    gradient.frame                   = shadowView.bounds;
    gradient.colors                  = @[
                                         (id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor,
                                         (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor
                                         ];
    gradient.startPoint              = CGPointMake(edge == SwpCoolOrigamiRight ? 0.0 : 1.0, edge == SwpCoolOrigamiRight ? 0.2 : 0.0);
    gradient.endPoint                = CGPointMake(edge == SwpCoolOrigamiRight ? 1.0 : 0.0, edge == SwpCoolOrigamiRight ? 0.0 : 1.0);
    [shadowView.layer insertSublayer:gradient atIndex:1];
    view.frame                       = view.bounds;
    [viewWithShadow addSubview:view];
    [viewWithShadow addSubview:shadowView];
    return viewWithShadow;
}




@end
