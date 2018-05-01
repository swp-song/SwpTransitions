//
//  SwpTransitionsAnimationsViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//


#import <UIKit/UIKit.h>

#import <SwpTransitions/SwpTransitionsHeader.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SwpTransitionsAnimationsViewControllerClickButtonEvent)(UIButton *button, BOOL isClickSwitch);

@interface SwpTransitionsAnimationsViewController : UIViewController


/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(UIImage *))image;

/**
 *  @author swp_song
 *
 *  @brief  imageName   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(NSString *))imageName;

/**
 *  @author swp_song
 *
 *  @brief  buttonTitle ( 设置按钮文字 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull (^)(NSString *))buttonTitle;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsAnimationsViewControllerClickButtonEvent: ( SwpTransitionsAnimationsViewController 回调方法，点击按钮调用 )
 *
 *  @param  clickButtonEvent    clickButtonEvent
 */
- (void)swpTransitionsAnimationsViewControllerClickButtonEvent:(SwpTransitionsAnimationsViewControllerClickButtonEvent)clickButtonEvent;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsAnimationsViewControllerClickButtonEvent  ( SwpTransitionsAnimationsViewController 回调方法，点击按钮调用 )
 */
- (__kindof SwpTransitionsAnimationsViewController * _Nonnull(^)(SwpTransitionsAnimationsViewControllerClickButtonEvent))swpTransitionsAnimationsViewControllerClickButtonEvent;


@end

NS_ASSUME_NONNULL_END
