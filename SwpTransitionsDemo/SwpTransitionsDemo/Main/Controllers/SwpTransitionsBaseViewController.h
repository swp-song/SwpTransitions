//
//  SwpTransitionsBaseViewController.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//


#import <UIKit/UIKit.h>

#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwpTransitionsBaseViewController : UIViewController

/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(UIImage *))image;

/**
 *  @author swp_song
 *
 *  @brief  imageName   ( 设置背景图片 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(NSString *))imageName;

/**
 *  @author swp_song
 *
 *  @brief  buttonTitle ( 设置按钮文字 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(NSString *))buttonTitle;

/**
 *  @author swp_song
 *
 *  @brief  buttonClickEvent:   ( BaseViewController 回调方法，点击按钮调用 )
 *
 *  @param  buttonClickEvent    buttonClickEvent
 */
- (void)buttonClickEvent:(void (^ _Nullable)(UIButton * _Nonnull button))buttonClickEvent;

/**
 *  @author swp_song
 *
 *  @brief  buttonClickEventChain:  ( BaseViewController 回调方法，点击按钮调用 )
 */
- (__kindof SwpTransitionsBaseViewController * _Nonnull (^)(void (^ _Nonnull)(UIButton * _Nonnull)))buttonClickEventChain;

@end
NS_ASSUME_NONNULL_END
