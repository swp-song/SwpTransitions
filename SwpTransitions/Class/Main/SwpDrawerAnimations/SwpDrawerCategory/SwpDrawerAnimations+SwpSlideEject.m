//
//  SwpDrawerAnimations+SwpSlideEject.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimations+SwpSlideEject.h"


/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */


@implementation SwpDrawerAnimations (SwpSlideEject)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpSlideEjectToAnimation:direction:distance:aDistance:vertical:stepOneScale:stepTwoScale:   ( 跳转，抽屉侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  direction           direction
 *
 *  @param  aDistance           aDistance
 *
 *  @param  vertical            vertical
 *
 *  @param  stepOneScale        stepOneScale
 *
 *  @param  stepTwoScale        stepTwoScale
 *
 *  @return UIView
 */
- (UIView *)swpSlideEjectToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext direction:(SwpDrawerAnimationsDirection)direction aDistance:(CGFloat)aDistance vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale stepTwoScale:(CGFloat)stepTwoScale {
    return SlideEjectToAnimation(transitionContext, _toDuration, direction, aDistance, vertical, stepOneScale, stepTwoScale);
}

/**
 *  @author swp_song
 *
 *  @brief  swpSlideEjectBackAnimation:tempView:gestureView:direction:vertical:stepOneScale:    ( 返回，抽屉弹出动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  tempView            tempView
 *
 *  @param  gestureView         gestureView
 *
 *  @param  direction           direction
 *
 *  @param  vertical            vertical
 *
 *  @param  stepOneScale        stepOneScale
 */
- (void)swpSlideEjectBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext tempView:(UIView *)tempView gestureView:(UIView *)gestureView direction:(SwpDrawerAnimationsDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale {
    SlideEjectBackAnimation(transitionContext, _backDuration, tempView, gestureView, direction, vertical, stepOneScale);
}

#pragma mark - Private Methods
FOUNDATION_STATIC_INLINE UIView * SlideEjectToAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration, SwpDrawerAnimationsDirection direction, CGFloat aDistance, BOOL vertical, CGFloat stepOneScale, CGFloat stepTwoScale) {
    
    UIViewController *fromVC                = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC                  = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView         = [transitionContext containerView];
    UIView           *tempView              = [UIView new];
    tempView.swpAnimatorsContentImage   = fromVC.view.swpAnimatorsSnapshotImage;
    tempView.frame                      = fromVC.view.frame;
    CGFloat distance                    = _SlideEjectMoveMaxDistance(containerView, direction, aDistance);
    
    CGFloat parallaxDistance            = 0.0f;
    tempView.layer.zPosition            = -1000;
    [containerView addSubview:tempView];
    [containerView addSubview:toVC.view];
    
    NSInteger   symbol          = direction == SwpDrawerAnimationDirectionLeft || direction == SwpDrawerAnimationDirectionTop ? -1 : 1;
    CGFloat     toViewStartx    = vertical ? 0 : (containerView.frame.size.width - fabs(parallaxDistance)) * symbol;
    CGFloat     toViewStartY    = vertical ? (containerView.frame.size.height - fabs(parallaxDistance)) * symbol : 0;
    toVC.view.frame             = CGRectOffset(containerView.bounds,toViewStartx, toViewStartY);
    fromVC.view.hidden          = YES;
    CGAffineTransform transform = vertical ? CGAffineTransformMakeTranslation(0, -(distance - parallaxDistance)) : CGAffineTransformMakeTranslation(-(distance - parallaxDistance), 0);
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.35 animations:^{
            tempView.layer.transform = _SlideEjectStepOneTransform(distance, vertical, stepOneScale);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            tempView.layer.transform = _SlideEjectStepTwoTransform(tempView, direction, vertical, stepOneScale, stepTwoScale);
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


/* 返回，抽屉弹出动画效果 */
FOUNDATION_STATIC_INLINE void SlideEjectBackAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration, UIView *tempView, UIView *gestureView, SwpDrawerAnimationsDirection direction, BOOL vertical, CGFloat stepOneScale) {
 
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView = [transitionContext containerView];
    
    [containerView insertSubview:toVC.view atIndex:0];
    
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.35 animations:^{
            tempView.layer.transform = _SlideEjectStepOneTransform(direction, vertical, stepOneScale);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            tempView.layer.transform = CATransform3DIdentity;
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
FOUNDATION_STATIC_INLINE CGFloat _SlideEjectMoveMaxDistance(UIView *containerView, SwpDrawerAnimationsDirection direction, CGFloat distance) {
    CGFloat aDistance = 0.0f;
    
    switch (direction) {
        case SwpDrawerAnimationDirectionTop: {
            aDistance = distance ? -distance : -containerView.frame.size.height;
            break;
        }
      
        case SwpDrawerAnimationDirectionLeft: {
            aDistance = distance ? -distance : -containerView.frame.size.width;
            break;
        }
            
            
        case SwpDrawerAnimationDirectionBottom: {
            aDistance = distance ? distance : containerView.frame.size.height;
            break;
        }
            
        case SwpDrawerAnimationDirectionRight: {
            aDistance = distance ? distance : containerView.frame.size.width;
            break;
        }
            
    }
    return aDistance;
}

/* 计算 Step Two Transform */
FOUNDATION_STATIC_INLINE CATransform3D _SlideEjectStepTwoTransform(UIView *view, SwpDrawerAnimationsDirection direction, BOOL vertical, CGFloat stepOneScale, CGFloat stepTwoScale) {
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34     = _SlideEjectStepOneTransform(direction, vertical, stepOneScale).m34;
    NSInteger   symbol  = direction == SwpDrawerAnimationDirectionRight || direction == SwpDrawerAnimationDirectionBottom ? -1 : 1;
    CGFloat     x       = vertical ?  0: view.frame.size.width * 0.08 * symbol;
    CGFloat     y       = vertical ?  view.frame.size.height * 0.08 * symbol: 0;
    transform3D         = CATransform3DTranslate(transform3D, x, y, 0);
    transform3D         = CATransform3DScale(transform3D, stepTwoScale, stepTwoScale, 1);
    return transform3D;
}


/* 计算 Step One Transform */
FOUNDATION_STATIC_INLINE CATransform3D _SlideEjectStepOneTransform(SwpDrawerAnimationsDirection direction, BOOL vertical, CGFloat stepOneScale) {
    CGFloat       rotationRatio = 1 + (0.95 - stepOneScale) * 3.0f;
    CATransform3D transform3D   = CATransform3DIdentity;
    transform3D.m34             = 1.0 / -900;
    transform3D                 = CATransform3DScale(transform3D, stepOneScale, stepOneScale, 1);
    NSInteger symbol            = direction == SwpDrawerAnimationDirectionLeft || direction == SwpDrawerAnimationDirectionBottom ? 1 : -1;
    transform3D                 = CATransform3DRotate(transform3D, 15.0f * M_PI / 180.0f * rotationRatio * symbol, vertical, !vertical, 0);
    return transform3D;
}


@end
