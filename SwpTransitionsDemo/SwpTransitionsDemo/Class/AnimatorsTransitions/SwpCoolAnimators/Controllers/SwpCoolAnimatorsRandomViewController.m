

//
//  SwpCoolAnimatorsRandomViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/3.
//Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimatorsRandomViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionsHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpCoolAnimatorsBackViewController.h"
/* ---------------------- Controller ---------------------- */


@interface SwpCoolAnimatorsRandomViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolAnimatorsRandomViewController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {

    
    __weak typeof(self) weakSelf = self;
    self
    .buttonTitle(@"点击跳转")
    .imageName(@"animators_transitions_1")
    .buttonClickEventChain(^(UIButton *button){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf jumpSwpCoolAnimatorsBackViewController:strongSelf.navigationSwitch.on];
    });
    
    
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navigationSwitch];
    [self.navigationSwitch addTarget:self action:@selector(navigationSwitch:) forControlEvents:UIControlEventTouchUpInside];
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
 *  @brief  navigationSwitch:   ( 按钮绑定方法 )
 *
 *  @param  switch_ switch_
 */
- (void)navigationSwitch:(UISwitch *)switch_ {
    
}

/**
 *  @author swp_song
 *
 *  @brief  jumpSwpCoolAnimatorsBackViewController: (  )
 *
 *  @param isPush           isPush
 */
- (void)jumpSwpCoolAnimatorsBackViewController:(BOOL)isPush {
    
    SwpCoolAnimatorsBackViewController *swpCoolAnimatorsBackViewController = [SwpCoolAnimatorsBackViewController new].isPush(isPush);
    SwpCoolAnimators *swpCoolAnimator = SwpCoolAnimators.swpCoolAnimatorInitRandom();
    
    if (isPush) {
        [self.navigationController swpPushViewController:swpCoolAnimatorsBackViewController animated:swpCoolAnimator];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpCoolAnimatorsBackViewController animated:swpCoolAnimator];
    }
}


- (UISwitch *)navigationSwitch {
    
    return !_navigationSwitch ? _navigationSwitch = ({
        UISwitch *switch_ = [UISwitch new];
        switch_;
    }) : _navigationSwitch;
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
