
//
//  SwpTransitionsNavigationController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionsNavigationController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpCateGory/UIColor+SwpColor.h>                // Color  分类
#import <SwpCateGory/UINavigationBar+SwpNavigationBar.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */


@interface SwpTransitionsNavigationController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpTransitionsNavigationController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar.appearance.tintColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    // 导航 控制器 颜色
    self.navigationBar.swpNavigationBarSetBackgroundColorChain([[UIColor whiteColor] colorWithAlphaComponent:0.8]);
    self.navigationBar.swpNavigationBarSetBottomLineViewHiddenChain(YES);
    
}

/**
 *  @author swp_song
 *
 *  @brief  viewWillAppear: ( 将要加载出视图调用 )
 *
 *  @param  animated    animated
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidAppear:  ( 视图显示窗口时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  viewWillDisappear:  ( 视图即将消失, 被覆盖, 隐藏时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidDisappear:   ( 视图已经消失, 被覆盖, 隐藏时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  didReceiveMemoryWarning ( 内存不足时调用 )
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前控制器被销毁时调用 )
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    UIViewController *topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  rootViewControllerChain ( 快速初始化 )
 */
+ (__kindof UINavigationController * _Nonnull (^)(UIViewController * _Nonnull))rootViewControllerChain {
    return ^(UIViewController *rootViewController) {
        return [self.class swpTransitionsWithRootViewController:rootViewController];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithRootViewController: ( 快速初始化 )
 *
 *  @param  rootViewController      rootViewController
 *
 *  @return UINavigationController
 */
+ (instancetype)swpTransitionsWithRootViewController:(UIViewController *)rootViewController {
    return [[SwpTransitionsNavigationController alloc] initWithRootViewController:rootViewController];;
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
