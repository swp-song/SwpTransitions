//
//  SwpCoolAnimations+SwpPortal.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimations (SwpPortal)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalToAnimation:    ( 跳转，门户动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPortalToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalBackAnimation: ( 返回，门户动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPortalBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalToAnimation    ( 跳转，门户动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolPortalToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPortalBackAnimation  ( 返回，门户动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull))swpCoolPortalBackAnimation;

@end
NS_ASSUME_NONNULL_END
