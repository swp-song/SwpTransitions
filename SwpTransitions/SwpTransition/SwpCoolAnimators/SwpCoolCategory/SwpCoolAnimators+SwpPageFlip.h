//
//  SwpCoolAnimators+SwpPageFlip.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimators (SwpPageFlip)
/**
 *  @author swp_song
 *
 *  @brief  swpCoolPageFlipToAnimators: ( 跳转转场，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipToAnimators:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpAnimatorCoolPageFlipBackAnimation: ( 关闭转场，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipBackAnimators:(id<UIViewControllerContextTransitioning>)transitionContext;


@end
NS_ASSUME_NONNULL_END
