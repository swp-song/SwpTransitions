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
{
    @protected
    NSTimeInterval  _toDuration;
    NSTimeInterval  _backDuration;
    BOOL            _isInteractive;
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsBackAnimation:    ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  toDuration  ( 设置跳转，转场时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))toDuration;

/**
 *  @author swp_song
 *d
 *  @brief  toDuration  (  设置返回，转场时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))backDuration;

/**
 *  @author swp_song
 *
 *  @brief  aToDuration ( 获取跳转，转场时长 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)aToDuration;

/**
 *  @author swp_song
 *
 *  @brief  aBackDuration   ( 获取返回，转场时长 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)aBackDuration;

/**
 *  @author swp_song
 *
 *  @brief  interactive ( 双向交互，防止手势松开，缺少过度动画问题 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(BOOL))interactive;

@end
NS_ASSUME_NONNULL_END
