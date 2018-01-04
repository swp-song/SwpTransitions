//
//  SwpCoolAnimators+SwpLines.h
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN


/**
 - SwpCoolLineDirection
 - SwpCoolLineDirectionHorizontal:
 - SwpCoolLineDirectionVertical:
 */
typedef NS_ENUM(NSInteger, SwpCoolLineDirection) {
    SwpCoolLineDirectionHorizontal = 0,
    SwpCoolLineDirectionVertical,
};
@interface SwpCoolAnimators (SwpLines)

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 跳转转场，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolLinesBackAnimation:lineDirection:    ( 关闭转场，线性动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  lineDirection       lineDirection
 */
- (void)swpCoolLinesBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext lineDirection:(SwpCoolLineDirection)lineDirection;

@end
NS_ASSUME_NONNULL_END
