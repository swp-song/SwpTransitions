//
//  SwpTransitionsNavigationController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsNavigationController : UINavigationController

/**
 *  @author swp_song
 *
 *  @brief  rootViewControllerChain ( 快速初始化 )
 */
+ (__kindof UINavigationController * _Nonnull (^)(UIViewController * _Nonnull))rootViewControllerChain;


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithRootViewController: ( 快速初始化 )
 *
 *  @param  rootViewController      rootViewController
 *
 *  @return UINavigationController
 */
+ (instancetype)swpTransitionsWithRootViewController:(UIViewController *)rootViewController;

@end
NS_ASSUME_NONNULL_END
