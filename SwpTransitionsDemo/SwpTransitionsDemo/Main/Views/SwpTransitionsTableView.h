//
//  SwpTransitionsTableView.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpTransitionsModel;

NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsTableView : UITableView

/**
 *  @author swp_song
 *
 *  @brief  datas   ( 设置数据 )
 */
- (SwpTransitionsTableView * _Nonnull (^)(NSArray * _Nonnull))datas;


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsTableViewClickCellEvent:  ( TransitionsTableView 回调方法，点击 cell 调用 )
 *
 *  @param  swpTransitionsTableViewClickCellEvent   swpTransitionsTableViewClickCellEvent
 */
- (void)swpTransitionsTableViewClickCellEvent:(void (^)(SwpTransitionsTableView * _Nonnull, NSIndexPath * _Nonnull, id _Nonnull))swpTransitionsTableViewClickCellEvent;


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsTableViewClickCellEventChain ( TransitionsTableView 回调方法，点击 cell 调用 )
 */
- (SwpTransitionsTableView * _Nonnull (^)(void (^ _Nonnull)(SwpTransitionsTableView * _Nonnull, NSIndexPath * _Nonnull, id _Nonnull)))swpTransitionsTableViewClickCellEventChain;

@end
NS_ASSUME_NONNULL_END
