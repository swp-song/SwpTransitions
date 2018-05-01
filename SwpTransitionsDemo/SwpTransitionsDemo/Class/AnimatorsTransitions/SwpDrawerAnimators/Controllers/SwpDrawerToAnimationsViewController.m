//
//  SwpDrawerToAnimationsViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerToAnimationsViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionsHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpDrawerModel.h"
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpDrawerBackAnimationsViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpDrawerToAnimationsViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) NSInteger transitionsType_;

@property (nonatomic, strong) SwpDrawerModel *model_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpDrawerToAnimationsViewController

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
    .imageName(@"animators_transitions_3")
    .swpTransitionsAnimationsViewControllerClickButtonEvent(^(UIButton *button, BOOL isClickSwitch) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf jumpSwpDrawerBackAnimationsViewController:strongSelf.model_ isPush:isClickSwitch];
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
 *  @brief  jumpSwpDrawerAnimatorsBackViewController:push:  (  )
 *
 *  @param model    model
 *
 *  @param isPush   isPush
 */
- (void)jumpSwpDrawerBackAnimationsViewController:(SwpDrawerModel *)model isPush:(BOOL)isPush {
    

    __weak typeof(self)weakSelf = self;
    SwpDrawerBackAnimationsViewController *swpDrawerBackAnimationsViewController = [SwpDrawerBackAnimationsViewController new].isPush(isPush);

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
        [self.navigationController swpPushViewController:swpDrawerBackAnimationsViewController animated:animator];
    } else {
        [self.navigationController swpTransitionsPresentViewController:swpDrawerBackAnimationsViewController animated:animator];
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
 *  @brief  swpDrawerAnimators  ( 数据 )
 */
- (SwpDrawerToAnimationsViewController * _Nonnull (^)(SwpDrawerModel * _Nonnull))model {
    return ^(SwpDrawerModel *model) {
        self.model_ = model;
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
