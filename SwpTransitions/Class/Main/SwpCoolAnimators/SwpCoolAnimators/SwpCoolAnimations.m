//
//  SwpCoolAnimators.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpCoolAnimatorsHeader.h"
#import "SwpCoolAnimators+SwpPageFlip.h"
/* ---------------------- Tool       ---------------------- */

@interface SwpCoolAnimations ()

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpCoolAnimations

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetToAnimation:transitionContext];
    
    switch (_animatorsOption) {
            
            //  全屏翻页
        case SwpCoolAnimatorsOptionPageFlip:
            [self swpCoolPageFlipToAnimation:transitionContext];
            break;
            
            //  居中翻页
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeTop:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeLeft:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeBottom:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeBottom];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeRight:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeRight];
            break;
            
            //  门户效果
        case SwpCoolAnimatorsOptionPortal:
            [self swpCoolPortalToAnimation:transitionContext];
            break;
    
            //  折纸效果
        case SwpCoolAnimatorsOptionOrigamiLeft:
            [self swpCoolOrigamiToAnimation:transitionContext edge:SwpCoolOrigamiLeft];
            break;
            
        case SwpCoolAnimatorsOptionOrigamiRight:
            [self swpCoolOrigamiToAnimation:transitionContext edge:SwpCoolOrigamiRight];
            break;
            
            //  碎片效果
        case SwpCoolAnimatorsOptionDebris:
            [self swpCoolDebrisToAnimation:transitionContext];
            break;
            
            //  线性效果
        case SwpCoolAnimatorsOptionLinesHorizontal:
            [self swpCoolLinesToAnimation:transitionContext lineDirection:SwpCoolLineDirectionHorizontal];
            break;
            
        case SwpCoolAnimatorsOptionLinesVertical:
            [self swpCoolLinesToAnimation:transitionContext lineDirection:SwpCoolLineDirectionVertical];
            break;
            
            // 扫描效果
        case SwpCoolAnimatorsOptionScanningTop:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionScanningLeft:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeLeft];
            break;
            
        case SwpCoolAnimatorsOptionScanningBottom:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeBottom];
            break;
            
        case SwpCoolAnimatorsOptionScanningRight:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeRight];
            break;
            
        default:
            [self swpCoolDebrisBackAnimation:transitionContext];
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    [super swpTransitionsSetBackAnimation:transitionContext];
    
    switch (_animatorsOption) {
            
            //  全屏翻页
        case SwpCoolAnimatorsOptionPageFlip:
            [self swpCoolPageFlipBackAnimation:transitionContext];
            break;
            
            //  居中翻页
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeTop:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeBottom];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeLeft:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeRight];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeBottom:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeRight:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
            //  门户效果
        case SwpCoolAnimatorsOptionPortal:
            [self swpCoolPortalBackAnimation:transitionContext];
            break;
            
            //  折纸效果
        case SwpCoolAnimatorsOptionOrigamiLeft:
            [self swpCoolOrigamiBackAnimation:transitionContext edge:SwpCoolOrigamiRight];
            break;
            
        case SwpCoolAnimatorsOptionOrigamiRight:
            [self swpCoolOrigamiBackAnimation:transitionContext edge:SwpCoolOrigamiLeft];
            break;
            
            //  碎片效果
        case SwpCoolAnimatorsOptionDebris:
            [self swpCoolDebrisBackAnimation:transitionContext];
            break;
            
            //  线性效果
        case SwpCoolAnimatorsOptionLinesHorizontal:
            [self swpCoolLinesBackAnimation:transitionContext lineDirection:SwpCoolLineDirectionHorizontal];
            break;
            
        case SwpCoolAnimatorsOptionLinesVertical:
            [self swpCoolLinesBackAnimation:transitionContext lineDirection:SwpCoolLineDirectionVertical];
            break;
            
            // 扫描效果
        case SwpCoolAnimatorsOptionScanningTop:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeBottom];
            break;

        case SwpCoolAnimatorsOptionScanningLeft:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeRight];
            break;
            
        case SwpCoolAnimatorsOptionScanningBottom:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionScanningRight:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeLeft];
            break;

        default:
            [self swpCoolDebrisBackAnimation:transitionContext];
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前控制器被销毁时调用 )
 */
- (void)dealloc {
    NSLog(@"%s, %@，已销毁", __FUNCTION__, self.class);
}



#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  init    ( Override Init )
 *
 *  @return SwpCoolAnimators
 */
- (instancetype)init {
    if (self = [super init]) {
        _swpOrigamiCount = 4;
    }
    return self;
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
- (instancetype)initWithAnimatorOption:(SwpCoolAnimatorsOptions)animatorsOption {
    if (self = [super init]) {
        _animatorsOption = animatorsOption;
        _swpOrigamiCount = 4;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsWithAnimatorOption: ( 快速初始化 )
 *
 *  @param  animatorsOption animatorsOption
 *
 *  @return SwpCoolAnimators
 */
+ (instancetype)swpCoolAnimatorsWithAnimatorOption:(SwpCoolAnimatorsOptions)animatorsOption {
    return [[self alloc] initWithAnimatorOption:animatorsOption];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInitWithAnimatorsOption  ( 快速初始化 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(SwpCoolAnimatorsOptions))swpCoolAnimatorInitWithAnimatorsOption {
    return ^(SwpCoolAnimatorsOptions animatorsOption) {
        return [self.class swpCoolAnimatorsWithAnimatorOption:animatorsOption];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorWithInit ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimatorWithInit {
    return [self.class swpCoolAnimatorsWithAnimatorOption:100];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInit ( 快速初始化 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorInit {
    
    return ^(void) {
        return [self.class swpCoolAnimatorWithInit];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorWithInitRandom   ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimatorWithInitRandom {
    return [self.class swpCoolAnimatorsWithAnimatorOption:arc4random_uniform(16)];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInitRandom   ( 设置随机转场 )
 */
+ (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorInitRandom {
    return ^(void) {
        return [self.class swpCoolAnimatorWithInitRandom];
    };
}



/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsOption  ( 设置动画选项 )
 */
- (SwpCoolAnimators * _Nonnull (^)(SwpCoolAnimatorsOptions))swpCoolAnimatorsOption {
    return ^(SwpCoolAnimatorsOptions swpCoolAnimatorsOption) {
        _animatorsOption = swpCoolAnimatorsOption;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsOptionRandom    ( 设置随机转场 )
 */
- (SwpCoolAnimators * _Nonnull (^)(void))swpCoolAnimatorsOptionRandom {
    return ^(void) {
        return self.swpCoolAnimatorsOption(arc4random_uniform(16));
    };
}


@end

