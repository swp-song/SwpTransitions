//
//  SwpCoolAnimations+SwpDebris.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimations (SwpDebris)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 跳转，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 返回，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisToAnimation    ( 跳转，碎片动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolDebrisToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation  ( 返回，碎片动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolDebrisBackAnimation;


@end
NS_ASSUME_NONNULL_END
