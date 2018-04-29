//
//  UIViewController+SwpTransitions.h
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpTransitions;

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (SwpTransitions)


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsPresentViewController:animated:completion:    ( 执行专场动画 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 */
- (void)swpTransitionsPresentViewController:(UIViewController *)viewController animated:(SwpTransitions * _Nullable)animated;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsPresentViewController:animated:completion:    ( 执行专场动画 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 *
 *  @param  completion      completion
 */
- (void)swpTransitionsPresentViewController:(UIViewController *)viewController animated:(SwpTransitions * _Nullable)animated completion:(void (^ _Nullable)(void))completion;


@end
NS_ASSUME_NONNULL_END
