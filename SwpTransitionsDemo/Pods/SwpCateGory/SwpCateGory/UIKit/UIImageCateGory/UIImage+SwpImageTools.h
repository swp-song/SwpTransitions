//
//  UIImage+SwpImageTools.h
//  swp_song
//
//  Created by swp_song on 2017/10/25.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (SwpImageTools)

/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotImageChain ( view 生成 image )
 */
+ (UIImage * _Nonnull (^)(UIView * _Nonnull))swpImageToolsSnapshotImageChain;

/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotImage: ( view 生成 image )
 *
 *  @param  view    view
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageToolsSnapshotImage:(UIView *)view;

/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotFullScreenImageChain   ( 截取整个屏幕，转换成 image )
 */
+ (UIImage * _Nonnull (^)(void))swpImageToolsSnapshotFullScreenImageChain;

/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotFullScreenImage    ( 截取整个屏幕，转换成 image )
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageToolsSnapshotFullScreenImage;


@end
NS_ASSUME_NONNULL_END
