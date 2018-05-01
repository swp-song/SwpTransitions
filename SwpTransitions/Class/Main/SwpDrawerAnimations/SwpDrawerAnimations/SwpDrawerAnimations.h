//
//  SwpDrawerAnimations.h
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN


/*
 - SwpDrawerAnimationsType
 - SwpDrawerSideslipAnimation:     抽屉，左右侧滑效果 < QQ，侧滑效果 >
 - SwpDrawerSlideEjectAnimation:   抽屉，弹出效果     < 淘宝，选择商品效果 >
 */
typedef NS_ENUM(NSInteger, SwpDrawerAnimationsType) {
    
    /// 抽屉，左右侧滑效果 < QQ，侧滑效果 >
    SwpDrawerSideslipAnimation = 0,
    
    /// 抽屉，弹出效果     < 淘宝，选择商品效果 >
    SwpDrawerSlideEjectAnimation,
};

/*
 - SwpDrawerAnimationsDirection
 - SwpDrawerAnimationDirectionTop:     抽屉效果，上
 - SwpDrawerAnimationDirectionLeft:    抽屉效果，左
 - SwpDrawerAnimationDirectionBottom:  抽屉效果，下
 - SwpDrawerAnimationDirectionRight:   抽屉效果，右
 */
typedef NS_ENUM(NSUInteger, SwpDrawerAnimationsDirection) {
    
    ///  抽屉效果，上
    SwpDrawerAnimationDirectionTop,
    
    /// 抽屉效果，左
    SwpDrawerAnimationDirectionLeft,
    
    /// 抽屉效果，下
    SwpDrawerAnimationDirectionBottom,
    
    /// 抽屉效果，右
    SwpDrawerAnimationDirectionRight,
};

@interface SwpDrawerAnimations : SwpTransitions

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorWithDrawerAnimator:direction:size: ( 快速初始化 )
 *
 *  @param  drawer      ( 抽屉动画类型 )
 *
 *  @param  direction   ( 动画方向 )
 *
 *  @param  size        ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimations
 */
+ (instancetype)swpDrawerAnimatorWithDrawerAnimator:(SwpDrawerAnimationsType)drawer direction:(SwpDrawerAnimationsDirection)direction size:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationsInit:    ( 快速初始化 )
 */
+ (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsType, SwpDrawerAnimationsDirection, CGFloat))swpDrawerAnimationsInit;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimation ( 设置动画效果 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsType))swpDrawerAnimation;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationDirection ( 设置动画方向 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsDirection))swpDrawerAnimationDirection;
/**
 *  @author swp_song
 *
 *  @brief  slideEjectAnimationScaleRatio   ( 抽屉，弹出侧滑效果，背景缩放比例，比例默认为 0.85 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(CGFloat))slideEjectAnimationScaleRatio;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationSize  ( 设置显示在屏幕中的尺寸 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(CGFloat))swpDrawerAnimationSize;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationEnableClickGestureEvent:  ( SwpDrawerAnimations, 回调方法，点击 toView 调用 )
 *
 *  @param  enableClickGesture  enableClickGesture
 */
- (void)swpDrawerAnimationEnableClickGestureEvent:(dispatch_block_t)enableClickGesture;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationEnableClickGestureEvent   ( SwpDrawerAnimations, 回调方法，点击 toView 调用 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(dispatch_block_t _Nullable))swpDrawerAnimationEnableClickGestureEvent;

@end
NS_ASSUME_NONNULL_END
