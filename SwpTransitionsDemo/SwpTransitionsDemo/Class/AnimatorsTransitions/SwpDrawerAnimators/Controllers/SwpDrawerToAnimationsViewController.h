//
//  SwpDrawerToAnimationsViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolToAnimationsViewController.h"

@class SwpDrawerModel;

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerToAnimationsViewController : SwpCoolToAnimationsViewController

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimators  ( 数据 )
 */
- (SwpDrawerToAnimationsViewController * _Nonnull (^)(SwpDrawerModel * _Nonnull))model;

@end

NS_ASSUME_NONNULL_END
