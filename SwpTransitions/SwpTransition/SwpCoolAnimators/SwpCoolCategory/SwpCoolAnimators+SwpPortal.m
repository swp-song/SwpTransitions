//
//  SwpCoolAnimators+SwpPortal.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpPortal.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */

@implementation SwpCoolAnimators (SwpPortal)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolSwpPortalToAnimation:    ( 跳转转场，门户效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolSwpPortalToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
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
    
    [UIView animateWithDuration:self.transitionsToDuration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        leftHandView.frame      = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
        rightHandView.frame     = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
        toViewSnapshot.center   = toView.center;
        toViewSnapshot.frame    = toView.frame;
        
    } completion:^(BOOL finished) {

        fromView.hidden = NO;
        if ([transitionContext transitionWasCancelled]) {

            [containerView addSubview:fromView];
            [self _removeOtherViews:fromView];
            
        } else {
            
            [containerView addSubview:toView];
            [self _removeOtherViews:toView];
            
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolSwpPortalBackAnimation:  ( 关闭转场，门户效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolSwpPortalBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
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
    
    [UIView animateWithDuration:self.transitionsBackDuration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        leftHandView.frame          = CGRectOffset(leftHandView.frame, leftHandView.frame.size.width, 0);
        rightHandView.frame         = CGRectOffset(rightHandView.frame, - rightHandView.frame.size.width, 0);
        CATransform3D scale         = CATransform3DIdentity;
        fromView.layer.transform    = CATransform3DScale(scale, 0.8, 0.8, 1);
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [self _removeOtherViews:fromView];
        } else {
            
            [self _removeOtherViews:toView];
            toView.frame = containerView.bounds;
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}


- (void)_removeOtherViews:(UIView*)viewToKeep {
    UIView *containerView = viewToKeep.superview;
    
    for (UIView *view in containerView.subviews) {
        if (view != viewToKeep) {
            [view removeFromSuperview];
        }
    }
    
}

@end
