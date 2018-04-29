
//
//  SwpCoolAnimatorsBackViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolAnimatorsBackViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionHeader.h>
#import <SwpCateGory/UIBarButtonItem+SwpSetNavigationBarItem.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */


@interface SwpCoolAnimatorsBackViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) BOOL isPush_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolAnimatorsBackViewController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    
    self
    .buttonTitle(@"点击返回")
    .imageName(@"animators_transitions_2")
    .buttonClickEventChain(^(UIButton *button){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        if (strongSelf.isPush_) {
            [strongSelf.navigationController popViewControllerAnimated:YES];
        } else {
            [strongSelf dismissViewControllerAnimated:YES completion:nil];
        }
        
    });
    
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem swpSetNavigationBarItemTitle:@"push" setFontColot:[UIColor blackColor] setFontSize:15 setTag:0 setLeftBarButtonItem:NO setAarget:self setAction:@selector(clickButtonEvent1:)];
    
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


- (void)clickButtonEvent1:(UIBarButtonItem *)buttonItem {
    NSLog(@"测试使用");
//    [self.navigationController swpPushViewController:SwpCoolAnimatorsBackViewController.new animated:nil];
//    [self.navigationController pushViewController:SwpCoolAnimatorsBackViewController.new animated:YES];
}

/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (SwpCoolAnimatorsBackViewController * _Nonnull (^)(BOOL))isPush {
    
    return ^(BOOL isPush) {
        self.isPush_ = isPush;
        return self;
    };
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
