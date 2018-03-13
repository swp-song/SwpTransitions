//
//  SwpCoolAnimatorsBackViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/30.
//Copyright © 2017年 swp_song. All rights reserved.
//


#import "SwpTransitionsBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimatorsBackViewController : SwpTransitionsBaseViewController


/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (SwpCoolAnimatorsBackViewController * _Nonnull (^)(BOOL))isPush;

@end
NS_ASSUME_NONNULL_END
