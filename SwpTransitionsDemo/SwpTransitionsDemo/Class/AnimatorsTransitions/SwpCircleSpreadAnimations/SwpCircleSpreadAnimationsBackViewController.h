//
//  SwpCircleSpreadAnimationsBackViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpCircleSpreadAnimationsBackViewController : UIViewController
{
    BOOL _isPush;
}


/**
 *  @author swp_song
 *
 *  @brief  isPush  ( 是否是 push )
 */
- (SwpCircleSpreadAnimationsBackViewController * _Nonnull (^)(BOOL))isPush;
@end

NS_ASSUME_NONNULL_END
