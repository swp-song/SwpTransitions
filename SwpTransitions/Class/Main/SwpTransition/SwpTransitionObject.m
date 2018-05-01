//
//  SwpTransitionObject.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionObject.h"


@interface SwpTransitionObject () 


#pragma mark - Data Propertys
/* ---------------------- Data Property ---------------------- */
/* 转场时长 */
@property (nonatomic, assign) NSTimeInterval duration;
/* 转场回调 */
@property (nonatomic, copy  ) SwpAnimationTransitionConfig config;
/* ---------------------- Data Property ---------------------- */

@end

@implementation SwpTransitionObject


#pragma mark - <UIViewControllerAnimatedTransitioning>

/**
 *  @author swp_song
 *
 *  @brief  transitionDuration: ( UIViewController 代理方法, 设置转场动画时长 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}


/**
 *  @author swp_song
 *
 *  @brief  animateTransition:  ( UIViewController 代理方法, 实现专场动画 )
 *
 *  @param  transitionContext    transitionContext
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.config) self.config(transitionContext);
}

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
+ (instancetype)swpTransitionObject:(NSTimeInterval)duration animationBlock:(SwpAnimationTransitionConfig)config {
    return [[self alloc] initWithDuration:duration animationBlock:config];
}

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
- (instancetype)initWithDuration:(NSTimeInterval)duration animationBlock:(SwpAnimationTransitionConfig)config {
    
    if (self = [super init]) {
        self.duration  = duration;
        self.config    = config;
    }
    return self;
}

@end

