//
//  UIViewController+SwpTransitions.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "UIViewController+SwpTransitions.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpTransitions.h"
#import <objc/runtime.h>
/* ---------------------- Tool       ---------------------- */

@implementation UIViewController (SwpTransitions)



/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsPresentViewController:animated:completion:    ( 执行专场动画 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 *
 *  @param  completion      completion
 */
- (void)swpTransitionsPresentViewController:(UIViewController *)viewController animated:(SwpTransitions * _Nullable)animated completion:(void (^)(void))completion {
    [self _transitionsPresentViewController:viewController animated:animated completion:completion];
}



/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsPresentViewController:animated:completion:    ( 执行专场动画 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 */
- (void)swpTransitionsPresentViewController:(UIViewController *)viewController animated:(SwpTransitions * _Nullable)animated {
    [self swpTransitionsPresentViewController:viewController animated:animated completion:nil];
}



/**
 *  @author swp_song
 *
 *  @brief  _transitionsPresentViewController:animated:completion:  ( 执行专场动画 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 *
 *  @param  completion      completion
 *
 *  @return UIViewController
 */
- (instancetype)_transitionsPresentViewController:(UIViewController *)viewController animated:(SwpTransitions * _Nullable)animated completion:(void (^ _Nullable)(void))completion {
    if (!viewController) return self;
    if (!animated) animated = [SwpTransitions new];
    viewController.transitioningDelegate = animated;
    objc_setAssociatedObject(viewController, &kSwpTransitionsKey, animated, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self presentViewController:viewController animated:YES completion:completion];
    return self;
}


@end
