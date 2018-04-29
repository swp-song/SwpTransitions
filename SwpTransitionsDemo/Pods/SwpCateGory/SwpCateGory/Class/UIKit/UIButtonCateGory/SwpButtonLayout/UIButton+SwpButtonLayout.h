//
//  UIButton+SwpButtonLayout.h
//  SwpCateGoryDemo
//
//  Created by swp_song on 2018/4/28.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SwpButtonLayoutEdge) {
    SwpButtonLayoutEdgeTop  = 0,
    SwpButtonLayoutEdgeLeft,
    SwpButtonLayoutEdgeBottom,
    SwpButtonLayoutEdgeRight,
};


@interface UIButton (SwpButtonLayout)

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout:offset: ( Set the layout of the title and image )
 *
 *  @param  edge    edge
 *
 *  @param  offset  offset
 */
- (void)swpButtonLayout:(SwpButtonLayoutEdge)edge offset:(CGFloat)offset;

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout:    ( Set the layout of the title and image )
 *
 *  @param  edge    edge
 */
- (void)swpButtonLayout:(SwpButtonLayoutEdge)edge;

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayout ( Set the layout of the title and image )
 */
- (__kindof UIButton *(^)(SwpButtonLayoutEdge edge))swpButtonLayout;

/**
 *  @author swp_song
 *
 *  @brief  swpButtonLayoutOffset   ( Set the layout of the title and image )
 */
- (__kindof UIButton *(^)(SwpButtonLayoutEdge, CGFloat))swpButtonLayoutOffset;

@end
NS_ASSUME_NONNULL_END
