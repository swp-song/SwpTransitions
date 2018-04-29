//
//  UIView+SwpAnimatorsSnapshot.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "UIView+SwpAnimatorsSnapshot.h"

@implementation UIView (SwpAnimatorsSnapshot)


/**
 *  @author swp_song
 *
 *  @brief  swpAnimatorsSnapshotImage:  ( 图片截取 )
 *
 *  @return UIImage
 */
- (UIImage *)swpAnimatorsSnapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

/**
 *  @author swp_song
 *
 *  @brief  swpAnimatorsContentImage    ( 获取 imge contents )
 *
 *  @return UIImage
 */
- (UIImage *)swpAnimatorsContentImage {
    return [UIImage imageWithCGImage:(__bridge CGImageRef)self.layer.contents];
}


/**
 *  @author swp_song
 *
 *  @brief  setSwpAnimatorsContentImage:    ( 设置 contents )
 *
 *  @param  contentImage    contentImage
 */
- (void)setSwpAnimatorsContentImage:(UIImage *)contentImage {
    self.layer.contents = (__bridge id)contentImage.CGImage;;
}

@end
