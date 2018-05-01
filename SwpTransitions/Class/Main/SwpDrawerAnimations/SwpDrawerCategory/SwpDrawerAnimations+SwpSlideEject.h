//
//  SwpDrawerAnimations+SwpSlideEject.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimations.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimations (SwpSlideEject)
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
- (UIView *)swpSlideEjectToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext direction:(SwpDrawerAnimationsDirection)direction aDistance:(CGFloat)aDistance vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale stepTwoScale:(CGFloat)stepTwoScale;

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
- (void)swpSlideEjectBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext tempView:(UIView *)tempView gestureView:(UIView *)gestureView direction:(SwpDrawerAnimationsDirection)direction vertical:(BOOL)vertical stepOneScale:(CGFloat)stepOneScale;

@end
NS_ASSUME_NONNULL_END
