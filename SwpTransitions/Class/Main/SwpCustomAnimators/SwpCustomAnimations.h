//
//  SwpCustomAnimators.h
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
 *  @brief  SwpCustomAnimatorsBlock ( SwpCustomAnimators 转场回调参数 )
 *
 *  @param  transitionContext   transitionContext
 */
typedef void(^SwpCustomAnimatorsBlock)(id<UIViewControllerContextTransitioning> transitionContext);

@interface SwpCustomAnimators : SwpTransitions

/**
 *  @author swp_song
 *
 *  @brief  swpCustomToAnimators    ( SwpCustomAnimators 回调方法，转场开始执行 )
 */
- (SwpCustomAnimators * _Nonnull (^)(SwpCustomAnimatorsBlock))swpCustomToAnimators;

/**
 *  @author swp_song
 *
 *  @brief  swpCustomBackAnimation  ( SwpCustomAnimators 回调方法，控制器返回调用 )
 */
- (SwpCustomAnimators * _Nonnull (^)(SwpCustomAnimatorsBlock _Nullable))swpCustomBackAnimation;

@end
NS_ASSUME_NONNULL_END
