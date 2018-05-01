//
//  SwpCoolAnimations+SwpScanning.h
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN

/**
 - SwpCoolScanningEdge
 - SwpCoolScanningEdgeTop:
 - SwpCoolScanningEdgeLeft:
 - SwpCoolScanningEdgeBottom:
 - SwpCoolScanningEdgeRight:
 */
typedef NS_ENUM(NSInteger, SwpCoolScanningEdge) {
    SwpCoolScanningEdgeTop = 0,
    SwpCoolScanningEdgeLeft,
    SwpCoolScanningEdgeBottom,
    SwpCoolScanningEdgeRight,
};

@interface SwpCoolAnimations (SwpScanning)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 跳转，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolScanningToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolScanningEdge)edge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 返回，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolScanningBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolScanningEdge)edge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation  ( 跳转，扫描动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolScanningEdge))swpCoolScanningToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningBackAnimation    ( 返回，扫描动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolScanningEdge))swpCoolScanningBackAnimation;

@end
NS_ASSUME_NONNULL_END
