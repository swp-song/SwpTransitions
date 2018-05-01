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
    NSTimeInterval  _backDuration;
    NSTimeInterval  _toDuration;
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

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

@end
NS_ASSUME_NONNULL_END
