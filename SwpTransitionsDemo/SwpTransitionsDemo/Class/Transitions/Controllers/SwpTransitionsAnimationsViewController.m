
//
//  SwpTransitionsAnimationsViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsAnimationsViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <Masonry/Masonry.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */

@interface SwpTransitionsAnimationsViewController ()


#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UISwitch *navigationSwitch;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, copy) SwpTransitionsAnimationsViewControllerClickButtonEvent clickButtonEvent;
/* ---------------------- Data Property  ---------------------- */
@end

@implementation SwpTransitionsAnimationsViewController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    
    [self setData];
    
    [self.button addTarget:self action:@selector(clickButtonEvent:) forControlEvents:(UIControlEventTouchUpInside)];
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

#pragma mark - Set Data Method
/**
 *  @author swp_song
 *
 *  @brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {
    
   
 
}

#pragma mark - Set UI Methods
/**
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}


/**
 *  @author swp_song
 *
 *  @brief  setNavigationBar    ( 设置导航栏 )
 */
- (void)setNavigationBar {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navigationSwitch];
    [self.navigationSwitch addTarget:self action:@selector(navigationSwitch:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:[self checkIPhoneSize:812] ? @"animators_transitions_1_x" : @"animators_transitions_1"].CGImage;
    
    [self.view addSubview:self.button];
}

/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(100, 40));
    }];
    
    [self.button layoutIfNeeded];
    self.button.layer.cornerRadius = self.button.frame.size.height / 2.0;
}

/**
 *  @author swp_song
 *
 *  @brief  checkIPhoneSize:    ( 验证 iPhone 尺寸 )
 *
 *  @param  size    size
 *
 *  @return BOOL
 */
- (BOOL)checkIPhoneSize:(CGFloat)size {
    
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    if (screenSize.height > screenSize.width) {
        
        if (screenSize.height == size)  {
            return YES;
        } else {
            return NO;
        }
    }
    
    if (screenSize.width > screenSize.height) {
        
        if (screenSize.width == size) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}


/**
 *  @author swp_song
 *
 *  @brief  navigationSwitch:   ( 按钮绑定方法 )
 *
 *  @param  aSwitch aSwitch
 */
- (void)navigationSwitch:(UISwitch *)aSwitch {
    
}

/**
 *  @author swp_song
 *
 *  @brief  clickButtonEvent:   ( 按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clickButtonEvent:(UIButton *)button {
    if (self.clickButtonEvent) self.clickButtonEvent(button, self.navigationSwitch.on);
}

#pragma mark - Public Methods


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(UIImage *))image {
    
    return ^(UIImage *image) {
        self.view.layer.contents = (__bridge id)image.CGImage;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  imageName   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(NSString *))imageName {
    
    return ^(NSString *imageName) {
        if (!imageName.length) {
            return self;
        }
        UIImage *image = [UIImage imageNamed:[self checkIPhoneSize:812] ? [NSString stringWithFormat:@"%@_x", imageName] : imageName];
        self.view.layer.contents = (__bridge id)image.CGImage;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  buttonTitle ( 设置按钮文字 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(NSString *))buttonTitle {
    
    return ^(NSString *buttonTitle) {
        [self.button setTitle:buttonTitle forState:UIControlStateNormal];
        [self.button setTitle:buttonTitle forState:UIControlStateHighlighted];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsAnimationsViewControllerClickButtonEvent: ( SwpTransitionsAnimationsViewController 回调方法，点击按钮调用 )
 *
 *  @param  clickButtonEvent    clickButtonEvent
 */
- (void)swpTransitionsAnimationsViewControllerClickButtonEvent:(SwpTransitionsAnimationsViewControllerClickButtonEvent)clickButtonEvent {
    _clickButtonEvent = clickButtonEvent;
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsAnimationsViewControllerClickButtonEvent  ( SwpTransitionsAnimationsViewController 回调方法，点击按钮调用 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull(^)(SwpTransitionsAnimationsViewControllerClickButtonEvent))swpTransitionsAnimationsViewControllerClickButtonEvent {
    return ^(SwpTransitionsAnimationsViewControllerClickButtonEvent clickButtonEvent) {
        [self swpTransitionsAnimationsViewControllerClickButtonEvent:clickButtonEvent];
        return self;
    };
}

#pragma mark - Init UI Methods
- (UIButton *)button {
    return !_button ? _button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:@"点我返回" forState:(UIControlStateNormal)];
        button;
    }) : _button;
}

- (UISwitch *)navigationSwitch {
    return !_navigationSwitch ? _navigationSwitch = ({
        UISwitch.new;
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
