//
//  UIButton+SwpButtonLayout.m
//  SwpCateGoryDemo
//
//  Created by swp_song on 2018/4/28.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "UIButton+SwpButtonLayout.h"

@implementation UIButton (SwpButtonLayout)

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout:offset: ( Set the layout of the title and image )
 *
 *  @param  edge    edge
 *
 *  @param  offset  offset
 */
- (void)swpButtonLayout:(SwpButtonLayoutEdge)edge offset:(CGFloat)offset {
    ButtonLayout(self, edge, offset);
}

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout:    ( Set the layout of the title and image )
 *
 *  @param  edge    edge
 */
- (void)swpButtonLayout:(SwpButtonLayoutEdge)edge {
    [self swpButtonLayout:edge offset:0];
}


/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout ( Set the layout of the title and image )
 */
- (__kindof UIButton *(^)(SwpButtonLayoutEdge edge))swpButtonLayout {
    
    return ^(SwpButtonLayoutEdge putEdge) {
        return self.swpButtonLayoutOffset(putEdge, 0);
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayoutOffset   ( Set the layout of the title and image )
 */
- (__kindof UIButton *(^)(SwpButtonLayoutEdge, CGFloat))swpButtonLayoutOffset {
    
    return ^(SwpButtonLayoutEdge edge, CGFloat offset) {
        return ButtonLayout(self, edge, offset);
    };
}



/**
 *  @author swp_song
 *
 *  @brief  ButtonLayout    ( Set the layout of the title and image )
 *
 *  @param  button  button
 *
 *  @param  edge    edge
 *
 *  @param  offset  offset
 *
 *  @return UIButton
 */
FOUNDATION_STATIC_INLINE UIButton * ButtonLayout(UIButton *button, SwpButtonLayoutEdge edge, CGFloat offset) {
    
    CGFloat imageWith   = button.currentImage.size.width;
    CGFloat imageHeight = button.currentImage.size.height;
    CGFloat labelWidth  = 0.0;
    CGFloat labelHeight = 0.0;
    if (UIDevice.currentDevice.systemVersion.floatValue >= 8.0) {
        labelWidth  = button.titleLabel.intrinsicContentSize.width;
        labelHeight = button.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth  = button.titleLabel.frame.size.width;
        labelHeight = button.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    //  计算 label 和 image 位置
    switch (edge) {
        case SwpButtonLayoutEdgeTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - offset, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - offset, 0);
        }
            break;
        case SwpButtonLayoutEdgeLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -offset, 0, offset);
            labelEdgeInsets = UIEdgeInsetsMake(0, offset, 0, -offset);
        }
            break;
        case SwpButtonLayoutEdgeBottom : {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - offset, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - offset, -imageWith, 0, 0);
        }
            break;
        case SwpButtonLayoutEdgeRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + offset, 0, -labelWidth - offset);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - offset, 0, imageWith + offset);
        }
            break;
        default:
            break;
    }
    
    //  赋值
    button.titleEdgeInsets = labelEdgeInsets;
    button.imageEdgeInsets = imageEdgeInsets;
    
    return button;
}



@end
