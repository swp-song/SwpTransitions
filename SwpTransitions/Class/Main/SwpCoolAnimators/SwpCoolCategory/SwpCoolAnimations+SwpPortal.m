//
//  SwpCoolAnimations+SwpPortal.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpPortal.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */

@implementation SwpCoolAnimations (SwpPortal)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalToAnimation:    ( 跳转，门户动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPortalToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    _PortalToAnimation(transitionContext, _toDuration);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalBackAnimation: ( 返回，门户动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPortalBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    _PortalBackAnimation(transitionContext, _backDuration);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalToAnimation    ( 跳转，门户动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolPortalToAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolPortalToAnimation:transitionContext];
        return swpCoolAnimators;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalBackAnimation  ( 返回，门户动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolPortalBackAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolPortalBackAnimation:transitionContext];
        return swpCoolAnimators;
    };
}


#pragma mark - Private Methods

FOUNDATION_STATIC_INLINE void _PortalToAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration) {
    
    UIViewController    *fromVC             = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC               = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *toView             = toVC.view;
    UIView              *fromView           = fromVC.view;
    UIView              *containerView      = [transitionContext containerView];
    UIView              *toViewSnapshot     = [UIView new];
    toViewSnapshot.swpAnimatorsContentImage = toView.swpAnimatorsSnapshotImage;
    toViewSnapshot.frame                    = containerView.bounds;
    CATransform3D scale                     = CATransform3DIdentity;
    toViewSnapshot.layer.transform          = CATransform3DScale(scale, 0.8, 0.8, 1);
    [containerView addSubview:toViewSnapshot];
    [containerView sendSubviewToBack:toViewSnapshot];
    
    CGRect leftSnapshotRegion               = CGRectMake(0, 0, fromView.frame.size.width / 2, fromView.frame.size.height);
    UIView *leftHandView                    = [UIView new];
    leftHandView.swpAnimatorsContentImage   = fromView.swpAnimatorsSnapshotImage;
    leftHandView.layer.contentsRect         = CGRectMake(0, 0, 0.5, 1.0);
    leftHandView.frame                      = leftSnapshotRegion;
    [containerView addSubview:leftHandView];
    CGRect rightSnapshotRegion              = CGRectMake(fromView.frame.size.width / 2, 0, fromView.frame.size.width / 2, fromView.frame.size.height);
    UIView *rightHandView                   = [UIView new];
    rightHandView.swpAnimatorsContentImage  = leftHandView.swpAnimatorsContentImage;
    rightHandView.layer.contentsRect        = CGRectMake(0.5, 0, 0.5, 1.0);
    rightHandView.frame = rightSnapshotRegion;
    [containerView addSubview:rightHandView];
    fromView.hidden                         = YES;
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        leftHandView.frame      = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
        rightHandView.frame     = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
        toViewSnapshot.center   = toView.center;
        toViewSnapshot.frame    = toView.frame;
        
    } completion:^(BOOL finished) {
        
        fromView.hidden = NO;
        if ([transitionContext transitionWasCancelled]) {
            
            [containerView addSubview:fromView];
            
            _RemoveOtherViews(fromView);
            
        } else {
            
            [containerView addSubview:toView];
            _RemoveOtherViews(toView);
            
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


FOUNDATION_STATIC_INLINE void _PortalBackAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration) {
    
    UIViewController    *fromVC             = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC               = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *toView             = toVC.view;
    UIView              *fromView           = fromVC.view;
    UIView              *containerView      = [transitionContext containerView];
    [containerView addSubview:fromView];
    toView.frame                            = [transitionContext finalFrameForViewController:toVC];
    toView.frame                            = CGRectOffset(toView.frame, toView.frame.size.width, 0);
    [containerView addSubview:toView];
    CGRect leftSnapshotRegion               = CGRectMake(0, 0, toView.frame.size.width / 2, toView.frame.size.height);
    UIView *leftHandView                    = [UIView new];
    leftHandView.swpAnimatorsContentImage   = toView.swpAnimatorsSnapshotImage;
    leftHandView.layer.contentsRect         = CGRectMake(0, 0, 0.5, 1.0);
    leftHandView.frame                      = leftSnapshotRegion;
    leftHandView.frame                      = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
    [containerView addSubview:leftHandView];
    CGRect rightSnapshotRegion              = CGRectMake(toView.frame.size.width / 2, 0, toView.frame.size.width / 2, toView.frame.size.height);
    UIView *rightHandView                   = [UIView new];
    rightHandView.swpAnimatorsContentImage  = leftHandView.swpAnimatorsContentImage;
    rightHandView.layer.contentsRect        = CGRectMake(0.5, 0, 0.5, 1.0);
    rightHandView.frame                     = rightSnapshotRegion;
    rightHandView.frame                     = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
    [containerView addSubview:rightHandView];
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        leftHandView.frame          = CGRectOffset(leftHandView.frame, leftHandView.frame.size.width, 0);
        rightHandView.frame         = CGRectOffset(rightHandView.frame, - rightHandView.frame.size.width, 0);
        CATransform3D scale         = CATransform3DIdentity;
        fromView.layer.transform    = CATransform3DScale(scale, 0.8, 0.8, 1);
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            _RemoveOtherViews(fromView);
        } else {
            
            _RemoveOtherViews(toView);
            toView.frame = containerView.bounds;
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


FOUNDATION_STATIC_INLINE void _RemoveOtherViews(UIView *viewToKeep) {
    UIView *containerView = viewToKeep.superview;
    
    for (UIView *view in containerView.subviews) {
        if (view != viewToKeep) {
            [view removeFromSuperview];
        }
    }
}

@end
