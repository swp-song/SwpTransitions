//
//  UINavigationController+SwpTransitions.h
//  swp_song
//
//  Created by swp_song on 2018/1/4.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpTransitions;

NS_ASSUME_NONNULL_BEGIN
@interface UINavigationController (SwpTransitions)


/**
 *  @author swp_song
 *
 *  @brief  swpPushViewController:animated: ( 跳转方法 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 */
- (void)swpPushViewController:(UIViewController *)viewController animated:(SwpTransitions *)animated;


@end
NS_ASSUME_NONNULL_END
