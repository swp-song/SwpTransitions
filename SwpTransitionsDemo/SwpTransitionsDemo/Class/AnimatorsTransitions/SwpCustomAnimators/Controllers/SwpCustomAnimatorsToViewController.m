
//
//  SwpCustomAnimatorsToViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/4/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCustomAnimatorsToViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionsHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpCustomAnimatorsBackViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpCustomAnimatorsToViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */
@end

@implementation SwpCustomAnimatorsToViewController


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
    .buttonClickEventChain(^(UIButton *button){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf pushSwpCustomAnimatorsBackViewController:strongSelf.navigationSwitch.on];
    });
    
    
    
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
 *  @brief  pushSwpCustomAnimatorsBackViewController:   (  )
 *
 *  @param isPush           isPush
 */
- (void)pushSwpCustomAnimatorsBackViewController:(BOOL)isPush {
    
    SwpCustomAnimatorsBackViewController *swpCustomAnimatorsBackViewController = [SwpCustomAnimatorsBackViewController new].isPush(isPush);
    
    SwpCustomAnimations *swpCustomAnimations = SwpCustomAnimations.new;
    
    swpCustomAnimations
    //  跳转转场开始执行
    .swpCustomToAnimation(^(id<UIViewControllerContextTransitioning> transitionContext) {
//        SwpCoolAnimators.swpCoolLinesToAnimation(transitionContext, SwpCoolLineDirectionVertical);
//        SwpCoolAnimators.swpCoolCenterPageFlipToAnimation(transitionContext, SwpCoolCenterPageFlipEdgeTop);
//        SwpCoolAnimators.swpCoolCenterPageFlipToAnimation(transitionContext, SwpCoolCenterPageFlipEdgeBottom);
//        SwpCoolAnimators.swpCoolDebrisToAnimation(transitionContext);
//        SwpCoolAnimators.swpCoolOrigamiToAnimation(transitionContext, SwpCoolOrigamiLeft);
//        SwpCoolAnimators.swpCoolPortalToAnimation(transitionContext);
        SwpCoolAnimations.swpCoolScanningToAnimation(transitionContext, SwpCoolScanningEdgeTop);
    })
    
    //  返回转场开始执行
    
    .swpCustomBackAnimation(^(id<UIViewControllerContextTransitioning> transitionContext) {
//        SwpCoolAnimators.swpCoolLinesToAnimation(transitionContext, SwpCoolLineDirectionHorizontal);
//        SwpCoolAnimators.swpCoolCenterPageFlipToAnimation(transitionContext, SwpCoolCenterPageFlipEdgeLeft);
//        SwpCoolAnimators.swpCoolCenterPageFlipToAnimation(transitionContext, SwpCoolCenterPageFlipEdgeRight);
//        SwpCoolAnimators.swpCoolDebrisBackAnimation(transitionContext);
//        SwpCoolAnimators.swpCoolOrigamiBackAnimation(transitionContext, SwpCoolOrigamiRight);
//        SwpCoolAnimators.swpCoolPortalBackAnimation(transitionContext);
        SwpCoolAnimations.swpCoolScanningBackAnimation(transitionContext, SwpCoolScanningEdgeLeft).toDuration(0.5);
    });
    
    
    if (isPush) {
        [self.navigationController swpPushViewController:swpCustomAnimatorsBackViewController animated:swpCustomAnimations];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpCustomAnimatorsBackViewController animated:swpCustomAnimations];
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
