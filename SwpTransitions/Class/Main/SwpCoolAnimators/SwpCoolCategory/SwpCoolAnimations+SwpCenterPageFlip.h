//
//  SwpCoolAnimators+SwpCenterPageFlip.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN


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
 *  @brief  swpCoolCenterPageFlipAnimation:pageFlipEdge:    ( 跳转，居中翻页效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */
- (void)swpCoolCenterPageFlipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)pageFlipEdge;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation:pageFlipEdge:    ( 返回，居中翻页效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */
- (void)swpCoolCenterPageFlipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)pageFlipEdge;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipToAnimation    ( 跳转，居中翻页动画效果 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation  ( 返回，居中翻页动画效果 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipBackAnimation;

@end
NS_ASSUME_NONNULL_END
