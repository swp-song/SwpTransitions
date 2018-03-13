//
//  SwpDrawerAnimators.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN


/**
 - SwpDrawerAnimatorsType
 - SwpDrawerSideslipAnimators:      抽屉，左右侧滑效果 < QQ，侧滑效果 >
 - SwpDrawerSlideEjectAnimators:    抽屉，弹出效果     < 淘宝，选择商品效果 >
 */
typedef NS_ENUM(NSInteger, SwpDrawerAnimatorType) {
    SwpDrawerSideslipAnimator = 0,
    SwpDrawerSlideEjectAnimator,
};

/**
 - SwpDrawerAnimatorDirection
 - SwpDrawerAnimatorDirectionTop:       抽屉效果，上
 - SwpDrawerAnimatorDirectionLeft:      抽屉效果，左
 - SwpDrawerAnimatorDirectionBottom:    抽屉效果，下
 - SwpDrawerAnimatorDirectionRight:     抽屉效果，右
 */
typedef NS_ENUM(NSUInteger, SwpDrawerAnimatorDirection) {
    SwpDrawerAnimatorDirectionTop,
    SwpDrawerAnimatorDirectionLeft,
    SwpDrawerAnimatorDirectionBottom,
    SwpDrawerAnimatorDirectionRight,
};

@interface SwpDrawerAnimators : SwpTransitions

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorWithAnimatorType:dnimatorDirection:screenSize: ( 快速初始化 )
 *
 *  @param  drawerAnimator      ( 抽屉动画类型 )
 *
 *  @param  dnimatorDirection   ( 动画方向 )
 *
 *  @param  size                 ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimators
 */
+ (instancetype)swpDrawerAnimatorWithAnimatorType:(SwpDrawerAnimatorType)drawerAnimator dnimatorDirection:(SwpDrawerAnimatorDirection)dnimatorDirection screenSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorInit:  ( 快速初始化 )
 */
+ (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorType, SwpDrawerAnimatorDirection, CGFloat))swpDrawerAnimatorInit;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimator   ( 设置动画效果 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorType))swpDrawerAnimator;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorDirection  ( 设置动画方向 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorDirection))swpDrawerAnimatorDirection;
/**
 *  @author swp_song
 *
 *  @brief  slideEjectAnimatorScaleRatio    ( 抽屉，弹出侧滑效果，背景缩放比例，比例默认为 0.85 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(CGFloat))slideEjectAnimatorScaleRatio;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorScreenSizes    ( 设置显示在屏幕中的尺寸 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(CGFloat))swpDrawerAnimatorScreenSizes;


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorEnableClickGestureEvent:   ( SwpDrawerAnimators, 回调方法，点击 toView 调用 )
 *
 *  @param  swpDrawerAnimatorEnableClickGesture swpDrawerAnimatorEnableClickGesture
 */
- (void)swpDrawerAnimatorEnableClickGestureEvent:(dispatch_block_t _Nullable)swpDrawerAnimatorEnableClickGesture;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorEnableClickGestureEvent    ( SwpDrawerAnimators, 回调方法，点击 toView 调用 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(dispatch_block_t _Nullable))swpDrawerAnimatorEnableClickGestureEvent;

@end
NS_ASSUME_NONNULL_END
