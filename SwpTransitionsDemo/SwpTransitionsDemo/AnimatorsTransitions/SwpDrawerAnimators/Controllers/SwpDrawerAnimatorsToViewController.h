//
//  SwpDrawerAnimatorsToViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsBaseViewController.h"

@class SwpDrawerAnimatorsModel;

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimatorsToViewController : SwpTransitionsBaseViewController

/**
 *  @author swp_song
 *
 *  @brief  transitionsType ( 跳转动画枚举 )
 */
- (SwpDrawerAnimatorsToViewController * _Nonnull (^)(NSInteger))transitionsType;


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimators  ( 数据 )
 */
- (SwpDrawerAnimatorsToViewController * _Nonnull (^)(SwpDrawerAnimatorsModel * _Nonnull))swpDrawerAnimators;

@end
NS_ASSUME_NONNULL_END
