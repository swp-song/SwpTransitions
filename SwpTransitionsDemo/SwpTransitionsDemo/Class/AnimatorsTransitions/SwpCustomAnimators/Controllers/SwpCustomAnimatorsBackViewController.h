//
//  SwpCustomAnimatorsBackViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/4/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCustomAnimatorsBackViewController : SwpTransitionsBaseViewController

/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (SwpCustomAnimatorsBackViewController * _Nonnull (^)(BOOL))isPush;

@end
NS_ASSUME_NONNULL_END
