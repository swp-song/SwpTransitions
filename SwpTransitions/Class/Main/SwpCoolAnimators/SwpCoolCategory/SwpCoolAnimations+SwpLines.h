//
//  SwpCoolAnimations+SwpLines.h
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, SwpCoolLineDirection) {
    SwpCoolLineDirectionHorizontal = 0,
    SwpCoolLineDirectionVertical,
};
@interface SwpCoolAnimations (SwpLines)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 跳转，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 返回，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation   ( 跳转，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolLineDirection))swpCoolLinesToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation   ( 返回，线性动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolLineDirection))swpCoolLinesBackAnimation;


@end
NS_ASSUME_NONNULL_END
