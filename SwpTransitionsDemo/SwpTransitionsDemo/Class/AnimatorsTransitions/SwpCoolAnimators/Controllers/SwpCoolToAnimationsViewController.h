//
//  SwpCoolToAnimationsViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//


#import "SwpTransitionsToAnimationsViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface SwpCoolToAnimationsViewController : SwpTransitionsToAnimationsViewController


/**
 *  @author swp_song
 *
 *  @brief  transitionsType ( 跳转动画枚举 )
 */
- (SwpCoolToAnimationsViewController * _Nonnull (^)(NSInteger))transitionsType;

@end
NS_ASSUME_NONNULL_END
