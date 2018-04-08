//
//  SwpCoolAnimators+SwpPortal.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimators (SwpPortal)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolSwpPortalToAnimation:    ( 跳转转场，门户效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolSwpPortalToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolSwpPortalBackAnimation:  ( 关闭转场，门户效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolSwpPortalBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
NS_ASSUME_NONNULL_END
