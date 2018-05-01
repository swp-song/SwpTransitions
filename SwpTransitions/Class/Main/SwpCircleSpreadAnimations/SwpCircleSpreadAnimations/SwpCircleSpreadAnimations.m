//
//  SwpCircleSpreadAnimations.m
//  swp_song
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCircleSpreadAnimations.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpCircleSpreadAnimationsHeader.h"
/* ---------------------- Tool       ---------------------- */

@interface SwpCircleSpreadAnimations () 

@end

@implementation SwpCircleSpreadAnimations

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsToAnimation:transitionContext];
    [self swpCircleSpreadToAnimation:transitionContext center:_center radius:_radius];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsBackAnimation:    ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsBackAnimation:transitionContext];
    [self swpCircleSpreadBackAnimation:transitionContext center:_center radius:_radius];
}


/**
 *  @author swp_song
 *
 *  @brief  init    ( Override Init )
 *
 *  @return SwpCircleSpreadAnimations
 */
- (instancetype)init {
    if (self = [super init]) {
        _center = CGPointMake(20, 20);
        _radius = 0.01;
        self->_isInteractive = YES;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithCenter:radius:  ( 快速初始化 )
 *
 *  @param  center      center ( 扩散开始中心 )
 *
 *  @param  radius      radius ( 扩散开始的半径 )
 *
 *  @return SwpCircleSpreadAnimations
 */
- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius {
    return SwpCircleSpreadAnimations.new.center(center).radius(radius);
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadAnimation    ( 快速初始化 )
 *
 *  @param  center  center   ( 开始扩散中心点 )
 *
 *  @param  radius  radius   ( 开始扩散半径 )
 *
 *  @return SwpCircleSpreadAnimations
 */
+ (instancetype)swpCircleSpreadAnimation:(CGPoint)center radius:(CGFloat)radius {
    return [[self.class alloc] initWithCenter:center radius:radius];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadAnimation    ( 快速初始化 )
 */
+ (SwpCircleSpreadAnimations * _Nonnull (^)(CGPoint, CGFloat))swpCircleSpreadAnimation {
    return ^(CGPoint center, CGFloat radius) {
        return [self.class swpCircleSpreadAnimation:center radius:radius];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  center  ( 设置扩散中心点 )
 */
- (SwpCircleSpreadAnimations * _Nonnull (^)(CGPoint))center {
    return ^(CGPoint center) {
        self->_center = center;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  radius  ( 设置扩散半径 )
 */
- (SwpCircleSpreadAnimations * _Nonnull (^)(CGFloat))radius {
    return ^(CGFloat radius) {
        self->_radius = radius;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  radius  ( 获取，扩散中心点 )
 *
 *  @return CGPoint
 */
- (CGPoint)aCenter {
    return _center;
}

/**
 *  @author swp_song
 *
 *  @brief  radius  ( 获取，扩散半径 )
 *
 *  @return CGFloat
 */
- (CGFloat)aRadius {
    return _radius;
}



@end
