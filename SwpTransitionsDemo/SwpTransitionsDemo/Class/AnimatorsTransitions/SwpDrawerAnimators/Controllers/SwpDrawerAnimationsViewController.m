//
//  SwpDrawerAnimationsViewController.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimationsViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <SwpTransitions/SwpTransitionsHeader.h>
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpDrawerModel.h"
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpTransitionsTableView.h"
/* ---------------------- View       ---------------------- */

/* ---------------------- Controller ---------------------- */
#import "SwpDrawerToAnimationsViewController.h"
/* ---------------------- Controller ---------------------- */

@interface SwpDrawerAnimationsViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
@property (nonatomic, strong) SwpTransitionsTableView *swpTransitionsTableView;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, copy) NSArray *datas_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpDrawerAnimationsViewController

#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    
    NSLog(@"swpTransitionsInfo    = %@", [SwpTransitionsInfo swpTransitionsInfo]);
    NSLog(@"swpTransitionsVersion = %@", [SwpTransitionsInfo swpTransitionsVersion]);
    
    [super viewDidLoad];

    [self setUI];
    
    [self setData];
    
    [self swpCoolAnimatorsViewControllerBlock];
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
    
    self.swpTransitionsTableView.datas(self.datas_);
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
    
    [self.view addSubview:self.swpTransitionsTableView];
}

/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.swpTransitionsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsViewControllerBlock ( SwpCoolAnimatorsViewController Block )
 */
- (void)swpCoolAnimatorsViewControllerBlock {
    
    [self swpTransitionsTableViewBlock:self.swpTransitionsTableView];
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsTableViewBlock ( SwpTransitionsTableView Block )
 *
 *  @param  swpTransitionsTableView swpTransitionsTableView
 */
- (void)swpTransitionsTableViewBlock:(SwpTransitionsTableView *)swpTransitionsTableView {
    
    __weak typeof(self) weakSelf = self;
    swpTransitionsTableView.swpTransitionsTableViewClickCellEventChain(^(SwpTransitionsTableView *swpTransitionsTableView, NSIndexPath *indexPath, SwpDrawerModel *model){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        SwpDrawerToAnimationsViewController *swpDrawerToAnimationsViewController =
        [SwpDrawerToAnimationsViewController new]
        .model(model);
        [strongSelf.navigationController pushViewController:swpDrawerToAnimationsViewController animated:YES];
    });
}


#pragma mark - Init UI Methods
- (SwpTransitionsTableView *)swpTransitionsTableView {
    
    return !_swpTransitionsTableView ? _swpTransitionsTableView = ({
        SwpTransitionsTableView *swpTransitionsTableView = [SwpTransitionsTableView new];
        swpTransitionsTableView;
    }) : _swpTransitionsTableView;
}


#pragma mark - Init Data Methods
- (NSArray *)datas_ {
    return !_datas_ ? _datas_ = ({
        [SwpDrawerModel swpDrawerWithDictionarys:[NSArray arrayWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpDrawerModel" ofType:@"plist"]]];
    }) : _datas_;
    
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
