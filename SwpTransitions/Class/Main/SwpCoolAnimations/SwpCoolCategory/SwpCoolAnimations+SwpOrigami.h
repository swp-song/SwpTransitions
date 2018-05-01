//
//  SwpCoolAnimations+SwpOrigami.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN



/*
 - SwpCoolOrigamiEdge
 - SwpCoolOrigamiLeft:  折纸动画效果，左
 - SwpCoolOrigamiRight: 折纸动画效果，左
 */
typedef NS_ENUM(NSInteger, SwpCoolOrigamiEdge) {
    
    ///  折纸动画效果，左
    SwpCoolOrigamiLeft = 0,
    ///  折纸动画效果，右
    SwpCoolOrigamiRight,
};
@interface SwpCoolAnimations (SwpOrigami)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:edge:count: ( 跳转，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolOrigamiToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolOrigamiEdge)edge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:edge:count: ( 返回，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolOrigamiBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolOrigamiEdge)edge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiToAnimation   ( 跳转，折纸效果动画 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolOrigamiEdge))swpCoolOrigamiToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation ( 返回，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolOrigamiEdge))swpCoolOrigamiBackAnimation;

@end
NS_ASSUME_NONNULL_END
