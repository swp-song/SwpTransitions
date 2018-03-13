//
//  SwpDrawerAnimators+SwpSlideEject.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimators.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimators (SwpSlideEject)

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
- (UIView *)swpSlideEjectToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext swpDrawerAnimator:(SwpDrawerAnimatorDirection)swpDrawerAnimator distance:(CGFloat)distance_ vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale stepTwoScale:(CGFloat)stepTwoScale;

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
- (void)swpSlideEjectBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext toFromTempView:(UIView *)toFromTempView gestureView:(UIView *)gestureView direction:(SwpDrawerAnimatorDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale;

@end
NS_ASSUME_NONNULL_END
