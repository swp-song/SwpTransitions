//
//  SwpCoolAnimators.h
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

NS_ASSUME_NONNULL_BEGIN

/**
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
typedef NS_ENUM(NSInteger, SwpCoolAnimatorsOptions) {
    
    SwpCoolAnimatorsOptionPageFlip = 0,
    
    SwpCoolAnimatorsOptionCenterPageFlipEdgeTop,
    SwpCoolAnimatorsOptionCenterPageFlipEdgeLeft,
    SwpCoolAnimatorsOptionCenterPageFlipEdgeBottom,
    SwpCoolAnimatorsOptionCenterPageFlipEdgeRight,
    
    SwpCoolAnimatorsOptionPortal,
    
    SwpCoolAnimatorsOptionOrigamiLeft,
    SwpCoolAnimatorsOptionOrigamiRight,
    
    SwpCoolAnimatorsOptionDebris,
    
    SwpCoolAnimatorsOptionLinesHorizontal,
    SwpCoolAnimatorsOptionLinesVertical,
    
    SwpCoolAnimatorsOptionScanningTop,
    SwpCoolAnimatorsOptionScanningLeft,
    SwpCoolAnimatorsOptionScanningBottom,
    SwpCoolAnimatorsOptionScanningRight,
    
};

@interface SwpCoolAnimation : SwpTransitions
{
    @private
    SwpCoolAnimatorsOptions _animatorsOption;
    NSUInteger              _swpOrigamiCount;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithAnimatorOption: ( 快速初始化 )
 *
 *  @param  animatorsOption animatorsOption
 *
 *  @return SwpCoolAnimators
 */
- (instancetype)initWithAnimatorOption:(SwpCoolAnimatorsOptions)animatorsOption;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsWithAnimatorsOption:    ( 快速初始化 )
 *
 *  @param  animatorsOption animatorsOption
 *
 *  @return SwpCoolAnimators
 */
+ (instancetype)swpCoolAnimatorsWithAnimatorOption:(SwpCoolAnimatorsOptions)animatorsOption;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInitWithAnimatorsOption  ( 快速初始化 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(SwpCoolAnimatorsOptions))swpCoolAnimatorInitWithAnimatorsOption;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorWithInit ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimatorWithInit;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInit ( 快速初始化 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorInit;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorWithInitRandom   ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimatorWithInitRandom;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInitRandom   ( 设置随机转场 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorInitRandom;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsOption  ( 设置动画选项 )
 */
- (SwpCoolAnimators * _Nonnull (^)(SwpCoolAnimatorsOptions))swpCoolAnimatorsOption;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsOption  ( 设置动画选项 )
 */
- (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorsOptionRandom;


@end
NS_ASSUME_NONNULL_END
