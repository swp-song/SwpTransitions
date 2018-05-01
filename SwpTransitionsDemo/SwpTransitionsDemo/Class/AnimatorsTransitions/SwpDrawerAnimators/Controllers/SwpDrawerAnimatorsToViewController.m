
//
//  SwpDrawerAnimatorsToViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimatorsToViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionsHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpDrawerAnimatorsModel.h"
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpDrawerAnimatorsBackViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpDrawerAnimatorsToViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) NSInteger transitionsType_;

@property (nonatomic, strong) SwpDrawerAnimatorsModel *model_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpDrawerAnimatorsToViewController

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
    .imageName(@"animators_transitions_3")
    .buttonClickEventChain(^(UIButton *button){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf jumpSwpDrawerAnimatorsBackViewController:strongSelf.transitionsType_ isPush:strongSelf.navigationSwitch.on model:strongSelf.model_];
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
 *  @brief  jumpSwpDrawerAnimatorsBackViewController:push:  (  )
 *
 *  @param transitionsType  transitionsType
 *
 *  @param isPush           isPush
 */
- (void)jumpSwpDrawerAnimatorsBackViewController:(NSInteger)transitionsType isPush:(BOOL)isPush model:(SwpDrawerAnimatorsModel *)model {
    

    __weak typeof(self)weakSelf = self;
    SwpDrawerAnimatorsBackViewController *swpDrawerAnimatorsBackViewController = [SwpDrawerAnimatorsBackViewController new].isPush(isPush);

    SwpDrawerAnimations *animator = SwpDrawerAnimations.new
    
    //  动画类型
    .swpDrawerAnimation(model.drawer)
    
    //  缩放比例
    .slideEjectAnimationScaleRatio(1)
    
    //  动画方向
    .swpDrawerAnimationDirection(model.direction)
    
    //  屏幕尺寸
    .swpDrawerAnimationSize(model.size.floatValue)
    
    //  启用点击事件
    .swpDrawerAnimationEnableClickGestureEvent(^(){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf viewControllerBack];
    });;

    if (isPush) {
        [self.navigationController swpPushViewController:swpDrawerAnimatorsBackViewController animated:animator];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpDrawerAnimatorsBackViewController animated:animator];
    }
    
}

- (void)viewControllerBack {
    
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  transitionsType ( 跳转动画枚举 )
 */
- (SwpDrawerAnimatorsToViewController * _Nonnull (^)(NSInteger))transitionsType {
    
    return ^(NSInteger transitionsType) {
        self.transitionsType_ = transitionsType;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimators  ( 数据 )
 */
- (SwpDrawerAnimatorsToViewController * _Nonnull (^)(SwpDrawerAnimatorsModel * _Nonnull))swpDrawerAnimators {
    return ^(SwpDrawerAnimatorsModel *model) {
        self.model_ = model;
        return self;
    };
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
