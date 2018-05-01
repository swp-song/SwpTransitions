//
//  SwpTransitionsBackAnimationsViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//


#import "SwpTransitionsAnimationsViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsBackAnimationsViewController : SwpTransitionsAnimationsViewController

/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (__kindof SwpTransitionsBackAnimationsViewController * _Nonnull (^)(BOOL))isPush;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsBackAnimationsViewController  ( 关闭控制器 )
 */
- (void)swpTransitionsBackAnimationsViewController;

@end
NS_ASSUME_NONNULL_END
