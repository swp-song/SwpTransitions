//
//  UIView+SwpViewTools.h
//  swp_song
//
//  Created by swp_song on 2017/10/25.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (SwpViewTools)

/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImageChain  ( view 生成 image )
 */
- (UIImage * _Nonnull (^)(void))swpViewToolsSnapshotImageChain;


/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImage   ( view 生成 image )
 *
 *  @return UIImage
 */
- (UIImage *)swpViewToolsSnapshotImage;

@end
NS_ASSUME_NONNULL_END
