//
//  SwpCoolRandomAnimatorsViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolRandomAnimatorsViewController.h"

/* ---------------------- Tool       ---------------------- */
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpCoolBackAnimationsViewController.h"
/* ---------------------- Controller ---------------------- */


@interface SwpCoolRandomAnimatorsViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolRandomAnimatorsViewController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    self
    .swpTransitionsAnimationsViewControllerClickButtonEvent(^(UIButton *button, BOOL isClickSwitch) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf jumpSwpCoolBackAnimationsViewController:isClickSwitch];
    });
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
 *  @brief  jumpSwpCoolBackAnimationsViewController: (  )
 *
 *  @param isPush           isPush
 */
- (void)jumpSwpCoolBackAnimationsViewController:(BOOL)isPush {
    
    SwpCoolBackAnimationsViewController *swpCoolBackAnimationsViewController = [SwpCoolBackAnimationsViewController new].isPush(isPush);
    SwpCoolAnimations *swpCoolAnimations = SwpCoolAnimations.swpCoolAnimationsRandom();
    
    if (isPush) {
        [self.navigationController swpPushViewController:swpCoolBackAnimationsViewController animated:swpCoolAnimations];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpCoolBackAnimationsViewController animated:swpCoolAnimations];
    }
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
