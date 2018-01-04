//
//  SwpCoolAnimators+SwpOrigami.h
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

NS_ASSUME_NONNULL_BEGIN



/**
 - SwpCoolSwpOrigamiEdge
 - SwpCoolSwpOrigamiLeft:
 - SwpCoolSwpOrigamiRight:
 */
typedef NS_ENUM(NSInteger, SwpCoolSwpOrigamiEdge) {
    SwpCoolSwpOrigamiLeft = 0,
    SwpCoolSwpOrigamiRight,
};
@interface SwpCoolAnimators (SwpOrigami)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:origamiEdge:origamiCount:   ( 跳转转场，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  origamiEdge         origamiEdge
 *
 *  @param  origamiCount        origamiCount
 */
- (void)swpCoolOrigamiToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge origamiCount:(NSInteger)origamiCount;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:origamiEdge:origamiCount:   ( 关闭转场，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  origamiEdge         origamiEdge
 *
 *  @param  origamiCount        origamiCount
 */
- (void)swpCoolOrigamiBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge origamiCount:(NSInteger)origamiCount;

@end
NS_ASSUME_NONNULL_END
