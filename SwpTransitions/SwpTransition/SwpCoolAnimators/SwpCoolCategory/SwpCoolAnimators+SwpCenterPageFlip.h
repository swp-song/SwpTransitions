//
//  SwpCoolAnimators+SwpCenterPageFlip.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN

/**
 - SwpCoolCenterPageFlipEdgeTop:
 - SwpCoolCenterPageFlipEdgeLeft:
 - SwpCoolCenterPageFlipEdgeBottom:
 - SwpCoolCenterPageFlipEdgeRight:
 */
typedef NS_ENUM(NSUInteger, SwpCoolCenterPageFlipEdge) {
    SwpCoolCenterPageFlipEdgeTop,
    SwpCoolCenterPageFlipEdgeLeft,
    SwpCoolCenterPageFlipEdgeBottom,
    SwpCoolCenterPageFlipEdgeRight,
};


@interface SwpCoolAnimators (SwpCenterPageFlip)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipAnimation:pageFlipEdge:    ( 居中翻页转场 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */

- (void)swpCoolCenterPageFlipAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)pageFlipEdge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation:pageFlipEdge:    ( 居中翻页关闭 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */
- (void)swpCoolCenterPageFlipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)centerPageFlipEdge;

@end
NS_ASSUME_NONNULL_END
