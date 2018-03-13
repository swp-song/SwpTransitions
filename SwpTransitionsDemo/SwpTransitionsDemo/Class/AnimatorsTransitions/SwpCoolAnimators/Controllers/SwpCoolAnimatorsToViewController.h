//
//  SwpCoolAnimatorsToViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//Copyright © 2017年 swp_song. All rights reserved.
//


#import "SwpTransitionsBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimatorsToViewController : SwpTransitionsBaseViewController

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsTransitionsType ( 跳转动画枚举 )
 */
- (SwpCoolAnimatorsToViewController * _Nonnull (^)(NSInteger))swpCoolAnimatorsTransitionsType;

@end
NS_ASSUME_NONNULL_END
