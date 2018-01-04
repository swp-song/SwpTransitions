//
//  SwpCoolAnimators+SwpDebris.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimators (SwpDebris)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 跳转转场，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 关闭转场，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;


@end
NS_ASSUME_NONNULL_END
