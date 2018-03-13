//
//  SwpDrawerAnimatorsBackViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimatorsBackViewController : SwpTransitionsBaseViewController

/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (SwpDrawerAnimatorsBackViewController * _Nonnull (^)(BOOL))isPush;

@end
NS_ASSUME_NONNULL_END
