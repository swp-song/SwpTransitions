//
//  SwpCoolAnimations+SwpCenterPageFlip.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN



/*
 - SwpCoolCenterPageFlipEdge
 - SwpCoolCenterPageFlipEdgeTop:    居中翻页效果，上
 - SwpCoolCenterPageFlipEdgeLeft:   居中翻页效果，左
 - SwpCoolCenterPageFlipEdgeBottom: 居中翻页效果，下
 - SwpCoolCenterPageFlipEdgeRight:  居中翻页效果，右
 */
typedef NS_ENUM(NSUInteger, SwpCoolCenterPageFlipEdge) {
    
    /// 居中翻页效果，上
    SwpCoolCenterPageFlipEdgeTop,
    /// 居中翻页效果，左
    SwpCoolCenterPageFlipEdgeLeft,
    /// 居中翻页效果，下
    SwpCoolCenterPageFlipEdgeBottom,
    /// 居中翻页效果，右
    SwpCoolCenterPageFlipEdgeRight,
};


@interface SwpCoolAnimations (SwpCenterPageFlip)

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
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation  ( 返回，居中翻页动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipBackAnimation;

@end
NS_ASSUME_NONNULL_END
