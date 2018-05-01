//
//  SwpCoolToAnimationsViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolToAnimationsViewController.h"

/* ---------------------- Tool       ---------------------- */
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpCoolBackAnimationsViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpCoolToAnimationsViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) NSInteger transitionsType_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolToAnimationsViewController


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
        [strongSelf jumpSwpCoolBackAnimationsViewController:strongSelf.transitionsType_ isPush:isClickSwitch];
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
 *  @brief  jumpSwpCoolBackAnimationsViewController:push:   (  )
 *
 *  @param transitionsType  transitionsType
 *
 *  @param isPush           isPush
 */
- (void)jumpSwpCoolBackAnimationsViewController:(NSInteger)transitionsType isPush:(BOOL)isPush {
    
    SwpCoolBackAnimationsViewController *swpCoolBackAnimationsViewController = [SwpCoolBackAnimationsViewController new].isPush(isPush);
    SwpCoolAnimations *swpCoolAnimations = SwpCoolAnimations.swpCoolAnimationsInitWithOption(transitionsType).toDuration(0.5).backDuration(1);
    
    if (isPush) {
        [self.navigationController swpPushViewController:swpCoolBackAnimationsViewController animated:swpCoolAnimations];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpCoolBackAnimationsViewController animated:swpCoolAnimations];
    }
    
}

/**
 *  @author swp_song
 *
 *  @brief  transitionsType ( 跳转动画枚举 )
 */
- (SwpCoolToAnimationsViewController * _Nonnull (^)(NSInteger))transitionsType {
    
    return ^(NSInteger transitionsType) {
        self.transitionsType_ = transitionsType;
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
