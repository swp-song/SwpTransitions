
//
//  SwpCoolAnimatorsToViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolAnimatorsToViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpCoolAnimatorsBackViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpCoolAnimatorsToViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) NSInteger swpCoolAnimatorsTransitionsType_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolAnimatorsToViewController


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
    .buttonTitle(@"点击跳转")
    .imageName(@"animators_transitions_1")
//    .imageName(@"p1")
    .buttonClickEventChain(^(UIButton *button){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf jumpSwpCoolAnimatorsBackViewController:strongSelf.swpCoolAnimatorsTransitionsType_];
    });
    
    
    
    [super viewDidLoad];
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


/**
 *  @author swp_song
 *
 *  @brief  jumpSwpCoolAnimatorsBackViewController: (  )
 *
 *  @param  transitionsType transitionsType
 */
- (void)jumpSwpCoolAnimatorsBackViewController:(NSInteger)transitionsType {
    
    SwpCoolAnimators *swpCoolAnimator = SwpCoolAnimators.swpCoolAnimatorInitWithAnimatorsOption(transitionsType);
    [self.navigationController swpTransitionsPresentViewController:[SwpCoolAnimatorsBackViewController new] animated:swpCoolAnimator];
}

/**
 *  @author swp_song
 *
 *  @brief  transitionsType ( 跳转动画枚举 )
 */
- (SwpCoolAnimatorsToViewController * _Nonnull (^)(NSInteger))swpCoolAnimatorsTransitionsType {
    
    return ^(NSInteger swpCoolAnimatorsTransitionsType) {
        self.swpCoolAnimatorsTransitionsType_ = swpCoolAnimatorsTransitionsType;
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
