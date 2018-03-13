//
//  SwpDrawerAnimators+SwpSideslip.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimators+SwpSideslip.h"

#import "UIView+SwpAnimatorsSnapshot.h"

@implementation SwpDrawerAnimators (SwpSideslip)

/**
 *  @author swp_song
 *
 *  @brief  swpSideslipToAnimation:swpDrawerAnimator:distance:vertical:scaleRatio:  ( 跳转转场，抽屉左右侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  swpDrawerAnimator   swpDrawerAnimator
 *
 *  @param  distance_           distance_
 *
 *  @param  vertical            vertical
 *
 *  @param  scaleRatio          scaleRatio
 *
 *  @return SwpDrawerAnimators
 */
- (UIView *)swpSideslipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext swpDrawerAnimator:(SwpDrawerAnimatorDirection)swpDrawerAnimator distance:(CGFloat)distance_ vertical:(BOOL)vertical scaleRatio:(CGFloat)scaleRatio {
    
    UIViewController *fromVC                = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC                  = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView         = [transitionContext containerView];
    UIView           *fromTempView          = [UIView new];
    fromTempView.swpAnimatorsContentImage   = fromVC.view.swpAnimatorsSnapshotImage;
    fromTempView.frame                      = fromVC.view.frame;
    CGFloat distance                        = [self _swpSideslipMoveMaxDistance:containerView direction:swpDrawerAnimator distance:distance_];
    
    CGFloat parallaxDistance                = 0.0f;
    parallaxDistance                        = distance * 0.5;
    [containerView addSubview:fromTempView];
    [containerView insertSubview:toVC.view belowSubview:fromTempView];
    
    
    NSInteger   symbol          = swpDrawerAnimator == SwpDrawerAnimatorDirectionLeft || swpDrawerAnimator == SwpDrawerAnimatorDirectionTop ? -1 : 1;
    CGFloat     toViewStartx    = vertical ? 0 : (containerView.frame.size.width - fabs(parallaxDistance)) * symbol;
    CGFloat     toViewStartY    = vertical ? (containerView.frame.size.height - fabs(parallaxDistance)) * symbol : 0;
    toVC.view.frame             = CGRectOffset(containerView.bounds,toViewStartx, toViewStartY);
    fromVC.view.hidden          = YES;
    CGAffineTransform transform = vertical ? CGAffineTransformMakeTranslation(0, -(distance - parallaxDistance)) : CGAffineTransformMakeTranslation(-(distance - parallaxDistance), 0);
    [UIView animateKeyframesWithDuration:self.transitionsToDuration delay:0.0 options:0 animations:^{
        
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            fromTempView.transform = vertical ? CGAffineTransformMakeTranslation(0, -distance) : CGAffineTransformMakeTranslation(-distance, 0);
            fromTempView.transform = CGAffineTransformScale(fromTempView.transform, scaleRatio, scaleRatio);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            toVC.view.transform = transform;
        }];
        
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [fromTempView removeFromSuperview];
            fromVC.view.hidden = NO;
        }else{
            fromVC.view.userInteractionEnabled = NO;
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    return fromTempView;
}

/**
 *  @author swp_song
 *
 *  @brief  swpSideslipBackAnimation:toFromTempView:gestureView:    ( 关闭转场，抽屉左右侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  toFromTempView      toFromTempView
 *
 *  @param  gestureView         gestureView
 */
- (void)swpSideslipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext toFromTempView:(UIView *)toFromTempView gestureView:(UIView *)gestureView {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view atIndex:0];
    [UIView animateKeyframesWithDuration:self.transitionsBackDuration delay:0.0 options:0 animations:^{
       
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            toFromTempView.transform = CGAffineTransformIdentity;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            fromVC.view.transform = CGAffineTransformIdentity;
        }];
    } completion:^(BOOL finished) {
        if (![transitionContext transitionWasCancelled]) {
            toVC.view.userInteractionEnabled = YES;
            toVC.view.hidden = NO;
            [toFromTempView removeFromSuperview];
            [gestureView removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}



/**
 *  @author swp_song
 *
 *  @brief  _swpSideslipMoveMaxDistance:direction:distance: ( 计算移动距离 )
 *
 *  @param  containerView   containerView
 *
 *  @param  direction       direction
 *
 *  @param  distance        distance
 *
 *  @return CGFloat
 */
- (CGFloat)_swpSideslipMoveMaxDistance:(UIView *)containerView direction:(SwpDrawerAnimatorDirection)direction distance:(CGFloat)distance {
    CGFloat distance_ = 0.0f;
    switch (direction) {
        case SwpDrawerAnimatorDirectionTop: {
            distance_ = distance ? -distance : -containerView.frame.size.height;
            break;
        }
            
        case SwpDrawerAnimatorDirectionBottom: {
            distance_ = distance ? distance : containerView.frame.size.height;
            break;
        }
        case SwpDrawerAnimatorDirectionLeft: {
            distance_ = distance ? -distance : -containerView.frame.size.width;
            break;
        }
        case SwpDrawerAnimatorDirectionRight: {
            distance_ = distance ? distance : containerView.frame.size.width;
            break;
        }
    }
    return distance_;
}
@end
