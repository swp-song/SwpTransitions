//
//  SwpDrawerAnimators+SwpSideslip.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimators.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimators (SwpSideslip)


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
- (UIView *)swpSideslipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext swpDrawerAnimator:(SwpDrawerAnimatorDirection)swpDrawerAnimator distance:(CGFloat)distance_ vertical:(BOOL)vertical scaleRatio:(CGFloat)scaleRatio;


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
- (void)swpSideslipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext toFromTempView:(UIView *)toFromTempView gestureView:(UIView *)gestureView;

@end
NS_ASSUME_NONNULL_END
