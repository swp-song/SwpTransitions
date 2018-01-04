//
//  SwpTransitionObject.h
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SwpAnimationTransitionConfig)(id<UIViewControllerContextTransitioning> _Nonnull transitionContext);

NS_ASSUME_NONNULL_BEGIN

@interface SwpTransitionObject : NSObject  <UIViewControllerAnimatedTransitioning>

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionObject:animationBlock: ( 快速初始化 )
 *
 *  @param  duration    duration
 *
 *  @param  config      config
 *
 *  @return NSObject
 */
+ (instancetype)swpTransitionObject:(NSTimeInterval)duration animationBlock:(SwpAnimationTransitionConfig _Nullable)config;

/**
 *  @author swp_song
 *
 *  @brief  initWithDuration:animationBlock:    ( 快速初始化 )
 *
 *  @param  duration    duration
 *
 *  @param  config      config
 *
 *  @return NSObject
 */
- (instancetype)initWithDuration:(NSTimeInterval)duration animationBlock:(SwpAnimationTransitionConfig _Nullable)config;


@end
NS_ASSUME_NONNULL_END
