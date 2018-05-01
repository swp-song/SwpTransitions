//
//  SwpDrawerAnimations+SwpSideslip.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimations.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimations (SwpSideslip)


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
 *  @return SwpDrawerAnimators
 */
- (UIView *)swpSideslipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext direction:(SwpDrawerAnimatorDirection)direction aDistance:(CGFloat)aDistance vertical:(BOOL)vertical scaleRatio:(CGFloat)scaleRatio;


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
- (void)swpSideslipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext tempView:(UIView *)tempView gestureView:(UIView *)gestureView;

@end
NS_ASSUME_NONNULL_END
