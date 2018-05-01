//
//  SwpCustomAnimations.h
//  swp_song
//
//  Created by swp_song on 2018/4/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  @author swp_song
 *
 *  @brief  SwpCustomAnimationsBlock ( SwpCustomAnimations 转场回调参数 )
 *
 *  @param  transitionContext   transitionContext
 */
typedef void(^SwpCustomAnimationsBlock)(id<UIViewControllerContextTransitioning> transitionContext);

@interface SwpCustomAnimations : SwpTransitions

/**
 *  @author swp_song
 *
 *  @brief  swpCustomToAnimation    ( SwpCustomAnimations 回调方法，控制器跳转调用 )
 */
- (SwpCustomAnimations * _Nonnull (^)(SwpCustomAnimationsBlock _Nullable))swpCustomToAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpCustomBackAnimation  ( SwpCustomAnimations 回调方法，控制器返回调用 )
 */
- (SwpCustomAnimations * _Nonnull (^)(SwpCustomAnimationsBlock _Nullable))swpCustomBackAnimation;

@end
NS_ASSUME_NONNULL_END
