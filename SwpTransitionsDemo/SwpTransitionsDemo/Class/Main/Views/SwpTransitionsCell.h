//
//  SwpTransitionsCell.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpTransitionsModel;

NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsCell : UITableViewCell

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsCellWithTableView:forCellReuseIdentifier: ( 快速初始化一个 Cell )
 *
 *  @param  tableView   tableView
 *
 *  @param  identifier  identifier
 *
 *  @return UITableViewCell
 */
+ (instancetype)swpTransitionsCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsCellInit  ( 快速初始化一个 Cell )
 */
+ (__kindof SwpTransitionsCell * _Nonnull (^)(UITableView * _Nonnull, NSString * _Nonnull))swpTransitionsCellInit;


/**
 *  @author swp_song
 *
 *  @brief  transitions ( 设置数据 )
 */
- (SwpTransitionsCell * _Nonnull (^)(SwpTransitionsModel * _Nonnull))swpTransitions;

@end
NS_ASSUME_NONNULL_END
