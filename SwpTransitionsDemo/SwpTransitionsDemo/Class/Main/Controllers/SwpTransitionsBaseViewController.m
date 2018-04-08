//
//  SwpTransitionsBaseViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionsBaseViewController.h"

/* ---------------------- Tool       ---------------------- */
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */


@interface SwpTransitionsBaseViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) UIButton    *clickButtonEvent;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, copy) UIImage *image_;
@property (nonatomic, copy, setter = buttonClickEvent:) void(^buttonClickEvent)(UIButton *);
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpTransitionsBaseViewController


#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (!self.image_) return;
    
    [self setUI];
    
    [self setData];
    
    [self.clickButtonEvent addTarget:self action:@selector(clickButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
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
    
}

/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {

    [self.view addSubview:self.clickButtonEvent];
    
}

/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
 
    
    [self.clickButtonEvent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset([self checkIPhoneSize:812] ? 0 : 10);
        make.width.equalTo(@((self.view.frame.size.width / 2.0) - ([self checkIPhoneSize:568] ? 80 : 100)));
        make.width.equalTo(self.clickButtonEvent.mas_height).multipliedBy([self checkIPhoneSize:812] ? 2.5 : 3.0);
    }];

    [self.clickButtonEvent layoutIfNeeded];
    self.clickButtonEvent.layer.cornerRadius = self.clickButtonEvent.frame.size.height / 2.0;
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
 *  @brief  clickButtonEvent:   ( 设置背景图片 )
 *
 *  @param  button  button
 */
- (void)clickButtonEvent:(UIButton *)button {
    if (self.buttonClickEvent) self.buttonClickEvent(button);
}


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(UIImage *))image {
    
    return ^(UIImage *image) {
        self.image_ = image;
        self.view.layer.contents = (__bridge id)image.CGImage;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  imageName   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(NSString *))imageName {
    
    return ^(NSString *imageName) {
        
        if (!imageName.length) {
            self.image_ = nil;
            return self;
        }
        self.image_ = [UIImage imageNamed:[self checkIPhoneSize:812] ? [NSString stringWithFormat:@"%@_x", imageName] : imageName];
        self.view.layer.contents = (__bridge id)self.image_.CGImage;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  buttonTitle ( 设置按钮文字 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(NSString *))buttonTitle {

    return ^(NSString *buttonTitle) {
        [self.clickButtonEvent setTitle:buttonTitle forState:UIControlStateNormal];
        [self.clickButtonEvent setTitle:buttonTitle forState:UIControlStateHighlighted];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  buttonClickEvent:   ( BaseViewController 回调方法，点击按钮调用 )
 *
 *  @param  buttonClickEvent    buttonClickEvent
 */
- (void)buttonClickEvent:(void (^)(UIButton * _Nonnull))buttonClickEvent {
    _buttonClickEvent = buttonClickEvent;
}


/**
 *  @author swp_song
 *
 *  @brief  buttonClickEventChain:  ( BaseViewController 回调方法，点击按钮调用 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(void (^ _Nonnull)(UIButton * _Nonnull)))buttonClickEventChain {
    
    return ^(void(^buttonClickEvent)(UIButton *button)) {
        [self buttonClickEvent:buttonClickEvent];
        return self;
    };
}

#pragma mark - Init UI Methods
- (UIButton *)clickButtonEvent {
    
    return !_clickButtonEvent ? _clickButtonEvent = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button;
    }) : _clickButtonEvent;
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
