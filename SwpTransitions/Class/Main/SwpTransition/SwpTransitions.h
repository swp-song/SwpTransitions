//
//  SwpTransitions.h
//  swp_song
//
//  Created by swp_song on 2017/12/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const kSwpTransitionsKey;

@interface SwpTransitions : NSObject <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 转场开始执行动画方法 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;
/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 转场关闭执行动画方法  )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  toDuration      ( 设置跳转，转场时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))toDuration;

/**
 *  @author swp_song
 *d
 *  @brief  toDuration  (  设置关闭，转场时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))backDuration;

/**
 *  @author swp_song
 *
 *  @brief  transitionsToDuration   ( 获取跳转，转场时间 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)transitionsToDuration;

/**
 *  @author swp_song
 *
 *  @brief  transitionsBackDuration ( 获取关闭，转场时间 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)transitionsBackDuration;


@end
NS_ASSUME_NONNULL_END
