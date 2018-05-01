//
//  SwpCircleSpreadAnimations.h
//  swp_song
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCircleSpreadAnimations : SwpTransitions
{
    @protected
    ///  中心扩散
    CGPoint         _center;
    ///  扩散半径
    CGFloat         _radius;
    
    UIBezierPath    *_path;
    
    UIView          *_containerView;
    
    CAShapeLayer    *_maskLayer;
    
}

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadAnimation    ( 快速初始化 )
 *
 *  @param  center  center   ( 开始扩散中心点 )
 *
 *  @param  radius  radius   ( 开始扩散半径 )
 *
 *  @return SwpCircleSpreadAnimations
 */
+ (instancetype)swpCircleSpreadAnimation:(CGPoint)center radius:(CGFloat)radius;

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadAnimation    ( 快速初始化 )
 */
+ (SwpCircleSpreadAnimations * _Nonnull (^)(CGPoint, CGFloat))swpCircleSpreadAnimation;

/**
 *  @author swp_song
 *
 *  @brief  center  ( 设置扩散中心点 )
 */
- (SwpCircleSpreadAnimations * _Nonnull (^)(CGPoint))center;


/**
 *  @author swp_song
 *
 *  @brief  radius  ( 设置扩散半径 )
 */
- (SwpCircleSpreadAnimations * _Nonnull (^)(CGFloat))radius;


/**
 *  @author swp_song
 *
 *  @brief  radius  ( 获取，扩散中心点 )
 *
 *  @return CGPoint
 */
- (CGPoint)aCenter;

/**
 *  @author swp_song
 *
 *  @brief  radius  ( 获取，扩散半径 )
 *
 *  @return CGFloat
 */
- (CGFloat)aRadius;


@end
NS_ASSUME_NONNULL_END
