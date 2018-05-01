//
//  SwpCoolAnimators.h
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN

/*
 - SwpCoolAnimatorsOptions
 
 - 全屏翻页
 - SwpCoolAnimatorsOptionPageFlip:
 
 - 居中翻页
 - SwpCoolAnimatorsOptionCenterPageFlipEdgeTop:
 - SwpCoolAnimatorsOptionCenterPageFlipEdgeLeft:
 - SwpCoolAnimatorsOptionCenterPageFlipEdgeBottom:
 - SwpCoolAnimatorsOptionCenterPageFlipEdgeRight:
 
 - 门户效果
 - SwpCoolAnimatorsOptionPortal:
 
 - 折纸效果
 - SwpCoolAnimatorsOptionOrigamiLeft:
 - SwpCoolAnimatorsOptionOrigamiRight:
 
 - 碎片效果
 - SwpCoolAnimatorsOptionDebris:
 
 - 线性效果
 - SwpCoolAnimatorsOptionLinesHorizontal:
 - SwpCoolAnimatorsOptionLinesVertical:
 
 - 扫描效果
 - SwpCoolAnimatorsOptionScanningTop:
 - SwpCoolAnimatorsOptionScanningLeft:
 - SwpCoolAnimatorsOptionScanningBottom:
 - SwpCoolAnimatorsOptionScanningRight:
 */
typedef NS_ENUM(NSInteger, SwpCoolAnimationsOptions) {
    
    /// 全屏翻页
    SwpCoolAnimationOptionPageFlip = 0,
    
    /// 居中翻页
    SwpCoolAnimationOptionCenterPageFlipEdgeTop,
    SwpCoolAnimationOptionCenterPageFlipEdgeLeft,
    SwpCoolAnimationOptionCenterPageFlipEdgeBottom,
    SwpCoolAnimationOptionCenterPageFlipEdgeRight,
    
    /// 门户效果
    SwpCoolAnimationOptionPortal,
    
    /// 折纸效果
    SwpCoolAnimationOptionOrigamiLeft,
    SwpCoolAnimationOptionOrigamiRight,
    
    /// 碎片效果
    SwpCoolAnimationOptionDebris,
    
    /// 线性效果
    SwpCoolAnimationOptionLinesHorizontal,
    SwpCoolAnimationOptionLinesVertical,
    
    /// 扫描效果
    SwpCoolAnimationOptionScanningTop,
    SwpCoolAnimationOptionScanningLeft,
    SwpCoolAnimationOptionScanningBottom,
    SwpCoolAnimationOptionScanningRight,
    
};

@interface SwpCoolAnimations : SwpTransitions
{
    @private
    SwpCoolAnimationsOptions    _animatorsOption;
    NSUInteger                  _swpOrigamiCount;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithOption: ( 快速初始化 )
 *
 *  @param  option  option
 *
 *  @return SwpCoolAnimators
 */
- (instancetype)initWithOption:(SwpCoolAnimationsOptions)option;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsInitWithOption:    ( 快速初始化 )
 *
 *  @param  option  option
 *
 *  @return SwpCoolAnimators
 */
+ (instancetype)swpCoolAnimationsInitWithOption:(SwpCoolAnimationsOptions)option;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsInitWithOption ( 快速初始化 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(SwpCoolAnimationsOptions))swpCoolAnimationsInitWithOption;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsWithInit   ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimationsWithInit;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsInit   ( 快速初始化 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsInit;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsWithInitRandom ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimationsWithInitRandom;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsRandom ( 设置随机转场 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsRandom;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsOptions    ( 设置动画选项 )
 */
- (SwpCoolAnimations * _Nonnull (^)(SwpCoolAnimationsOptions))swpCoolAnimationsOptions;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsOptionRandom  ( 设置动画选项 )
 */
- (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsOptionRandom;


@end
NS_ASSUME_NONNULL_END
