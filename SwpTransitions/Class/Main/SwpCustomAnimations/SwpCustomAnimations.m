//
//  SwpCustomAnimations.m
//  swp_song
//
//  Created by swp_song on 2018/4/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCustomAnimations.h"

@interface SwpCustomAnimations ()

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/** SwpCustomAnimators 回调方法，控制器跳转调用 */
@property (nonatomic, copy) SwpCustomAnimationsBlock toAnimation;
/** SwpCustomAnimators 回调方法，控制器返回调用 */
@property (nonatomic, copy) SwpCustomAnimationsBlock backAnimation;
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpCustomAnimations

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsToAnimation:transitionContext];
    
    if (self.toAnimation) {
        self.toAnimation(transitionContext);
        return;
    }
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
    
    if (self.backAnimation) {
        self.backAnimation(transitionContext);
        return;
    }
}


/**
 *  @author swp_song
 *
 *  @brief  swpCustomToAnimation    ( SwpCustomAnimations 回调方法，控制器跳转调用 )
 */
- (SwpCustomAnimations * _Nonnull (^)(SwpCustomAnimationsBlock))swpCustomToAnimation {
    return ^(SwpCustomAnimationsBlock toAnimation) {
        self.toAnimation = toAnimation;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCustomBackAnimation  ( SwpCustomAnimations 回调方法，控制器返回调用 )
 */
- (SwpCustomAnimations * _Nonnull (^)(SwpCustomAnimationsBlock))swpCustomBackAnimation {
    return ^(SwpCustomAnimationsBlock backAnimation) {
        self.backAnimation = backAnimation;
        return self;
    };
}


@end
