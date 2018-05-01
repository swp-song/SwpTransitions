//
//  SwpCoolAnimations+SwpPageFlip.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"



NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimations (SwpPageFlip)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolPageFlipToAnimation: ( 跳转，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolPageFlipBackAnimation:   ( 返回，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
NS_ASSUME_NONNULL_END
