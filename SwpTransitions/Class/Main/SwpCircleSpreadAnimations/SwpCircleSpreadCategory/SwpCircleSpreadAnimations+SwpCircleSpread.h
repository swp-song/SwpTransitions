//
//  SwpCircleSpreadAnimations+SwpCircleSpread.h
//  swp_song
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCircleSpreadAnimations.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCircleSpreadAnimations (SwpCircleSpread)  <CAAnimationDelegate>

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadToAnimation:center:radius:   ( 跳转，圆圈扩散动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  center              center
 *
 *  @param  radius              radius
 */
- (void)swpCircleSpreadToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext center:(CGPoint)center radius:(CGFloat)radius;


/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadBackAnimation:center:radius: ( 快速初始化 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  center              center  ( 扩散中心点 )
 *
 *  @param  radius              radius  ( 扩散半径 )
 */
- (void)swpCircleSpreadBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext center:(CGPoint)center radius:(CGFloat)radius;


@end
NS_ASSUME_NONNULL_END
