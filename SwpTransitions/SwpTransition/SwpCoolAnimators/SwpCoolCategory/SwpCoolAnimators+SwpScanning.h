//
//  SwpCoolAnimators+SwpScanning.h
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

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

@interface SwpCoolAnimators (SwpScanning)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 跳转转场，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  scanningEdge        scanningEdge
 */
- (void)swpCoolScanningToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext scanningEdge:(SwpCoolScanningEdge)scanningEdge;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 关闭转场，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  scanningEdge        scanningEdge
 */
- (void)swpCoolScanningBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext scanningEdge:(SwpCoolScanningEdge)scanningEdge;

@end
NS_ASSUME_NONNULL_END
