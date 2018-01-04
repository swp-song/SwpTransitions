//
//  UIView+SwpViewTools.m
//  swp_song
//
//  Created by swp_song on 2017/10/25.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import "UIView+SwpViewTools.h"

@implementation UIView (SwpViewTools)

/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImageChain  ( view 生成图片 )
 */
- (UIImage * _Nonnull (^)(void))swpViewToolsSnapshotImageChain {
    return ^(){
        return [self swpViewToolsSnapshotImage];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImage   ( view 生成图片 )
 *
 *  @return UIImage
 */
- (UIImage *)swpViewToolsSnapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
