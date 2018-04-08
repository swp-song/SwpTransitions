//
//  SwpTransitionsTableView.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionsTableView.h"

/* ---------------------- Tool       ---------------------- */
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpTransitionsCell.h"
/* ---------------------- View       ---------------------- */

@interface SwpTransitionsTableView () <UITableViewDataSource, UITableViewDelegate>

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 数据源 */
@property (nonatomic, copy) NSArray *datas_;

@property (nonatomic, copy, setter = swpTransitionsTableViewClickCellEvent:) void(^swpTransitionsTableViewClickCellEvent)(SwpTransitionsTableView *, NSIndexPath *, id);
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpTransitionsTableView


/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:style:    ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @param  style   style
 *
 *  @return TransitionsTableView
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:SwpTransitionsCell.class forCellReuseIdentifier:NSStringFromClass(SwpTransitionsCell.class)];
        self.dataSource      = self;
        self.delegate        = self;
        self.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
#pragma mark - UITableView DataSoure Methods
/**
 *  @author swp_song
 *
 *  @brief  numberOfSectionsInTableView:    ( tableView 数据源方法 设置 tableView 分组个数 )
 *
 *  @param  tableView  tableView
 *
 *  @return NSInteger
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    
    return 1;
}

/**
 *  @author swp_song
 *
 *  @brief  tableView:numberOfRowsInSection:    ( tableView 数据源方法 设置 tableView 分组中cell显示的个数 )
 *
 *  @param  tableView   tableView
 *
 *  @param  section     section
 *
 *  @return NSInteger
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas_.count;
}

/**
 *  @author swp_song
 *
 *  @brief  tableView:cellForRowAtIndexPath:    ( tableView 数据源方法设置 tableView 分组中cell显示的数据 | 样式)
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 *
 *  @return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return SwpTransitionsCell.swpTransitionsCellInit(tableView, NSStringFromClass(SwpTransitionsCell.class)).swpTransitions(self.datas_[indexPath.row]);
}


#pragma mark - UITableView Delegate Methods

/**
 *  @author swp_song
 *
 *  @brief  tableView:didSelectRowAtIndexPath:  ( UITableView 代理方法，点击每个 cell 调用 )
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.swpTransitionsTableViewClickCellEvent) self.swpTransitionsTableViewClickCellEvent(self, indexPath, self.datas_[indexPath.row]);
}


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据 )
 */
- (SwpTransitionsTableView * _Nonnull (^)(NSArray * _Nonnull))datas {
    
    return ^(NSArray *datas) {
        if (!datas.count) return self;
        self.datas_ = datas;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsTableViewClickCellEvent:  ( TransitionsTableView 回调方法，点击 cell 调用 )
 *
 *  @param  swpTransitionsTableViewClickCellEvent   swpTransitionsTableViewClickCellEvent
 */
- (void)swpTransitionsTableViewClickCellEvent:(void (^)(SwpTransitionsTableView * _Nonnull, NSIndexPath * _Nonnull, id _Nonnull))swpTransitionsTableViewClickCellEvent {
    _swpTransitionsTableViewClickCellEvent = swpTransitionsTableViewClickCellEvent;
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsTableViewClickCellEventChain ( TransitionsTableView 回调方法，点击 cell 调用 )
 */
- (SwpTransitionsTableView * _Nonnull (^)(void (^ _Nonnull)(SwpTransitionsTableView * _Nonnull, NSIndexPath * _Nonnull, id _Nonnull)))swpTransitionsTableViewClickCellEventChain {
    return ^(void(^swpTransitionsTableViewClickCellEvent)(SwpTransitionsTableView *, NSIndexPath *, SwpTransitionsModel *)) {
        [self swpTransitionsTableViewClickCellEvent:swpTransitionsTableViewClickCellEvent];
        return self;
    };
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
