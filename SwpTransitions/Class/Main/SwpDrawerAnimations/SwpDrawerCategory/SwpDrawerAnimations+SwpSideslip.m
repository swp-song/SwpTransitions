//
//  SwpDrawerAnimations+SwpSideslip.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimations+SwpSideslip.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */

@implementation SwpDrawerAnimations (SwpSideslip)

#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpSideslipToAnimation:direction:aDistance:vertical:scaleRatio: ( 跳转，抽屉左右侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  direction           direction
 *
 *  @param  aDistance           aDistance
 *
 *  @param  vertical            vertical
 *
 *  @param  scaleRatio          scaleRatio
 *
 *  @return UIView
 */
- (UIView *)swpSideslipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext direction:(SwpDrawerAnimationsDirection)direction aDistance:(CGFloat)aDistance vertical:(BOOL)vertical scaleRatio:(CGFloat)scaleRatio {
    return _SideslipToAnimation(transitionContext, _toDuration, direction, aDistance, vertical, scaleRatio);
}

/**
 *  @author swp_song
 *
 *  @brief  swpSideslipBackAnimation:tempView:gestureView:  ( 返回，抽屉左右侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  tempView            tempView
 *
 *  @param  gestureView         gestureView
 */
- (void)swpSideslipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext tempView:(UIView *)tempView gestureView:(UIView *)gestureView {
    _SideslipBackAnimation(transitionContext, _backDuration, tempView, gestureView);
}

#pragma mark - Private Methods
/* 跳转，抽屉左右侧滑动画效果 */
FOUNDATION_STATIC_INLINE UIView * _SideslipToAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration, SwpDrawerAnimationsDirection direction, CGFloat aDistance, BOOL vertical, CGFloat scaleRatio) {
    
    UIViewController *fromVC            = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC              = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView     = [transitionContext containerView];
    UIView           *tempView          = [UIView new];
    tempView.swpAnimatorsContentImage   = fromVC.view.swpAnimatorsSnapshotImage;
    tempView.frame                      = fromVC.view.frame;
    CGFloat distance                    = _SideslipMoveMaxDistance(containerView, direction, aDistance);
    
    CGFloat parallaxDistance            = 0.0f;
    parallaxDistance                    = distance * 0.5;
    [containerView addSubview:tempView];
    [containerView insertSubview:toVC.view belowSubview:tempView];
    
    
    NSInteger   symbol          = direction == SwpDrawerAnimationsDirectionLeft || direction == SwpDrawerAnimationsDirectionTop ? -1 : 1;
    CGFloat     toViewStartx    = vertical ? 0 : (containerView.frame.size.width - fabs(parallaxDistance)) * symbol;
    CGFloat     toViewStartY    = vertical ? (containerView.frame.size.height - fabs(parallaxDistance)) * symbol : 0;
    toVC.view.frame             = CGRectOffset(containerView.bounds,toViewStartx, toViewStartY);
    fromVC.view.hidden          = YES;
    CGAffineTransform transform = vertical ? CGAffineTransformMakeTranslation(0, -(distance - parallaxDistance)) : CGAffineTransformMakeTranslation(-(distance - parallaxDistance), 0);
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            tempView.transform = vertical ? CGAffineTransformMakeTranslation(0, -distance) : CGAffineTransformMakeTranslation(-distance, 0);
            tempView.transform = CGAffineTransformScale(tempView.transform, scaleRatio, scaleRatio);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            toVC.view.transform = transform;
        }];
        
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [tempView removeFromSuperview];
            fromVC.view.hidden = NO;
        }else{
            fromVC.view.userInteractionEnabled = NO;
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    return tempView;
}




/* 返回，抽屉左右侧滑动画效果 */
FOUNDATION_STATIC_INLINE void _SideslipBackAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration, UIView *tempView, UIView *gestureView) {
    UIViewController    *fromVC         = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC           = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *containerView  = [transitionContext containerView];
    
    [containerView insertSubview:toVC.view atIndex:0];
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            tempView.transform = CGAffineTransformIdentity;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            fromVC.view.transform = CGAffineTransformIdentity;
        }];
    } completion:^(BOOL finished) {
        if (![transitionContext transitionWasCancelled]) {
            toVC.view.userInteractionEnabled = YES;
            toVC.view.hidden = NO;
            [tempView removeFromSuperview];
            [gestureView removeFromSuperview];
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

/*  计算移动距离 */
 FOUNDATION_STATIC_INLINE CGFloat _SideslipMoveMaxDistance(UIView *containerView, SwpDrawerAnimationsDirection direction, CGFloat distance) {
    
     CGFloat aDistance = 0.0f;
     switch (direction) {
         case SwpDrawerAnimationsDirectionTop: {
             aDistance = distance ? -distance : -containerView.frame.size.height;
             break;
         }
        
         case SwpDrawerAnimationsDirectionLeft: {
             aDistance = distance ? -distance : -containerView.frame.size.width;
             break;
         }
             
         case SwpDrawerAnimationsDirectionBottom: {
             aDistance = distance ? distance : containerView.frame.size.height;
             break;
         }
             
         case SwpDrawerAnimationsDirectionRight: {
             aDistance = distance ? distance : containerView.frame.size.width;
             break;
         }
     }
     return aDistance;
    
}
@end
