//
//  SwpDrawerAnimators+SwpSlideEject.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimators+SwpSlideEject.h"

#import "UIView+SwpAnimatorsSnapshot.h"

@implementation SwpDrawerAnimators (SwpSlideEject)

/**
 *  @author swp_song
 *
 *  @brief  swpSlideEjectToAnimation:swpDrawerAnimator:distance:direction:vertical:stepOneScale:stepTwoScale:   ( 跳转转场，抽屉侧滑动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  swpDrawerAnimator   swpDrawerAnimator
 *
 *  @param  distance_           distance_
 *
 *  @param  vertical            vertical
 *
 *  @param  stepOneScale        stepOneScale
 *
 *  @param  stepTwoScale        stepTwoScale
 *
 *  @return UIView
 */
- (UIView *)swpSlideEjectToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext swpDrawerAnimator:(SwpDrawerAnimatorDirection)swpDrawerAnimator distance:(CGFloat)distance_ vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale stepTwoScale:(CGFloat)stepTwoScale {
    
    
    UIViewController *fromVC                = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC                  = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView         = [transitionContext containerView];
    UIView           *fromTempView          = [UIView new];
    fromTempView.swpAnimatorsContentImage   = fromVC.view.swpAnimatorsSnapshotImage;
    fromTempView.frame                      = fromVC.view.frame;
    CGFloat distance                        = [self _slideEjectMoveMaxDistance:containerView direction:swpDrawerAnimator distance:distance_];
    CGFloat parallaxDistance                = 0.0f;
    fromTempView.layer.zPosition            = -1000;
    [containerView addSubview:fromTempView];
    [containerView addSubview:toVC.view];
    
    NSInteger   symbol          = swpDrawerAnimator == SwpDrawerAnimatorDirectionLeft || swpDrawerAnimator == SwpDrawerAnimatorDirectionTop ? -1 : 1;
    CGFloat     toViewStartx    = vertical ? 0 : (containerView.frame.size.width - fabs(parallaxDistance)) * symbol;
    CGFloat     toViewStartY    = vertical ? (containerView.frame.size.height - fabs(parallaxDistance)) * symbol : 0;
    toVC.view.frame             = CGRectOffset(containerView.bounds,toViewStartx, toViewStartY);
    fromVC.view.hidden          = YES;
    CGAffineTransform transform = vertical ? CGAffineTransformMakeTranslation(0, -(distance - parallaxDistance)) : CGAffineTransformMakeTranslation(-(distance - parallaxDistance), 0);
    [UIView animateKeyframesWithDuration:self.transitionsToDuration delay:0.0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.35 animations:^{
            fromTempView.layer.transform = [self _swpSlideEjectStepOneTransform:distance vertical:vertical stepOneScale:stepOneScale];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            fromTempView.layer.transform = [self _swpSlideEjectStepTwoTransformWithView:fromTempView direction:swpDrawerAnimator vertical:vertical stepOneScale:stepOneScale stepTwoScale:stepTwoScale];
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
 *  @brief  swpSlideEjectBackAnimation:toFromTempView:gestureView:direction:vertical:stepOneScale:  ( 关闭转场，抽屉弹出动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  toFromTempView      toFromTempView
 *
 *  @param  gestureView         gestureView
 *
 *  @param  direction           direction
 *
 *  @param  vertical            vertical
 *
 *  @param  stepOneScale        stepOneScale
 */
- (void)swpSlideEjectBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext toFromTempView:(UIView *)toFromTempView gestureView:(UIView *)gestureView direction:(SwpDrawerAnimatorDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale {
 
    
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView = [transitionContext containerView];
    
    [containerView insertSubview:toVC.view atIndex:0];
    
    [UIView animateKeyframesWithDuration:self.transitionsBackDuration delay:0.0 options:0 animations:^{
       
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.35 animations:^{
            toFromTempView.layer.transform = [self _swpSlideEjectStepOneTransform:direction vertical:vertical stepOneScale:stepOneScale];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.35 relativeDuration:0.65 animations:^{
            toFromTempView.layer.transform = CATransform3DIdentity;
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
 *  @brief  _slideEjectMoveMaxDistance:direction:distance:  ( 计算移动距离 )
 *
 *  @param  containerView   containerView
 *
 *  @param  direction       direction
 *
 *  @param  distance        distance
 *
 *  @return CGFloat
 */
- (CGFloat)_slideEjectMoveMaxDistance:(UIView *)containerView direction:(SwpDrawerAnimatorDirection)direction distance:(CGFloat)distance {
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



/**
 *  @author swp_song
 *
 *  @brief  _swpSlideEjectStepOneTransform:vertical:stepOneScale:   ( 计算 Step One Transform )
 *
 *  @param  direction       direction
 *
 *  @param  vertical        vertical
 *
 *  @param  stepOneScale    stepOneScale
 *
 *  @return CATransform3D
 */
- (CATransform3D)_swpSlideEjectStepOneTransform:(SwpDrawerAnimatorDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale {
    CGFloat       rotationRatio = 1 + (0.95 - stepOneScale) * 3.0f;
    CATransform3D transform3D   = CATransform3DIdentity;
    transform3D.m34             = 1.0 / -900;
    transform3D                 = CATransform3DScale(transform3D, stepOneScale, stepOneScale, 1);
    NSInteger symbol            = direction == SwpDrawerAnimatorDirectionLeft || direction == SwpDrawerAnimatorDirectionBottom ? 1 : -1;
    transform3D                 = CATransform3DRotate(transform3D, 15.0f * M_PI / 180.0f * rotationRatio * symbol, vertical, !vertical, 0);
    return transform3D;
}


/**
 *  @author swp_song
 *
 *  @brief  _swpSlideEjectStepTwoTransformWithView:direction:vertical:stepOneScale:stepTwoScale:   ( 计算 Step Two Transform )
 *
 *  @param  view            view
 *
 *  @param  vertical        vertical
 *
 *  @param  stepOneScale    stepOneScale
 *
 *  @param  stepTwoScale    stepTwoScale
 *
 *  @return CATransform3D
 */
- (CATransform3D)_swpSlideEjectStepTwoTransformWithView:(UIView*)view direction:(SwpDrawerAnimatorDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale stepTwoScale:(CGFloat)stepTwoScale {
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34     = [self _swpSlideEjectStepOneTransform:direction vertical:vertical stepOneScale:stepOneScale].m34;
    NSInteger   symbol  = direction == SwpDrawerAnimatorDirectionRight || direction == SwpDrawerAnimatorDirectionBottom ? -1 : 1;
    CGFloat     x       = vertical ?  0: view.frame.size.width * 0.08 * symbol;
    CGFloat     y       = vertical ?  view.frame.size.height * 0.08 * symbol: 0;
    transform3D         = CATransform3DTranslate(transform3D, x, y, 0);
    transform3D         = CATransform3DScale(transform3D, stepTwoScale, stepTwoScale, 1);
    return transform3D;
}



@end
