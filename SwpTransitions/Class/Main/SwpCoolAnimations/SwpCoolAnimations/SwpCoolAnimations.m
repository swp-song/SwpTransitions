//
//  SwpCoolAnimators.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpCoolAnimationsHeader.h"
#import "SwpCoolAnimations+SwpPageFlip.h"
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
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsToAnimation:transitionContext];
    
    switch (_animatorsOption) {
            
            //  全屏翻页
        case SwpCoolAnimationOptionPageFlip:
            [self swpCoolPageFlipToAnimation:transitionContext];
            break;
            
            //  居中翻页
        case SwpCoolAnimationOptionCenterPageFlipEdgeTop:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeTop];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeLeft:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeBottom:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeBottom];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeRight:
            [self swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeRight];
            break;
            
            //  门户效果
        case SwpCoolAnimationOptionPortal:
            [self swpCoolPortalToAnimation:transitionContext];
            break;
    
            //  折纸效果
        case SwpCoolAnimationOptionOrigamiLeft:
            [self swpCoolOrigamiToAnimation:transitionContext edge:SwpCoolOrigamiLeft];
            break;
            
        case SwpCoolAnimationOptionOrigamiRight:
            [self swpCoolOrigamiToAnimation:transitionContext edge:SwpCoolOrigamiRight];
            break;
            
            //  碎片效果
        case SwpCoolAnimationOptionDebris:
            [self swpCoolDebrisToAnimation:transitionContext];
            break;
            
            //  线性效果
        case SwpCoolAnimationOptionLinesHorizontal:
            [self swpCoolLinesToAnimation:transitionContext lineDirection:SwpCoolLineDirectionHorizontal];
            break;
            
        case SwpCoolAnimationOptionLinesVertical:
            [self swpCoolLinesToAnimation:transitionContext lineDirection:SwpCoolLineDirectionVertical];
            break;
            
            // 扫描效果
        case SwpCoolAnimationOptionScanningTop:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimationOptionScanningLeft:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeLeft];
            break;
            
        case SwpCoolAnimationOptionScanningBottom:
            [self swpCoolScanningToAnimation:transitionContext edge:SwpCoolScanningEdgeBottom];
            break;
            
        case SwpCoolAnimationOptionScanningRight:
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
 *  @brief  swpTransitionsBackAnimation:    ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    [super swpTransitionsBackAnimation:transitionContext];
    
    switch (_animatorsOption) {
            
            //  全屏翻页
        case SwpCoolAnimationOptionPageFlip:
            [self swpCoolPageFlipBackAnimation:transitionContext];
            break;
            
            //  居中翻页
        case SwpCoolAnimationOptionCenterPageFlipEdgeTop:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeBottom];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeLeft:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeRight];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeBottom:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeTop];
            break;
            
        case SwpCoolAnimationOptionCenterPageFlipEdgeRight:
            [self swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
            //  门户效果
        case SwpCoolAnimationOptionPortal:
            [self swpCoolPortalBackAnimation:transitionContext];
            break;
            
            //  折纸效果
        case SwpCoolAnimationOptionOrigamiLeft:
            [self swpCoolOrigamiBackAnimation:transitionContext edge:SwpCoolOrigamiRight];
            break;
            
        case SwpCoolAnimationOptionOrigamiRight:
            [self swpCoolOrigamiBackAnimation:transitionContext edge:SwpCoolOrigamiLeft];
            break;
            
            //  碎片效果
        case SwpCoolAnimationOptionDebris:
            [self swpCoolDebrisBackAnimation:transitionContext];
            break;
            
            //  线性效果
        case SwpCoolAnimationOptionLinesHorizontal:
            [self swpCoolLinesBackAnimation:transitionContext lineDirection:SwpCoolLineDirectionHorizontal];
            break;
            
        case SwpCoolAnimationOptionLinesVertical:
            [self swpCoolLinesBackAnimation:transitionContext lineDirection:SwpCoolLineDirectionVertical];
            break;
            
            // 扫描效果
        case SwpCoolAnimationOptionScanningTop:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeBottom];
            break;

        case SwpCoolAnimationOptionScanningLeft:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeRight];
            break;
            
        case SwpCoolAnimationOptionScanningBottom:
            [self swpCoolScanningBackAnimation:transitionContext edge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimationOptionScanningRight:
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
 *  @brief  initWithOption: ( 快速初始化 )
 *
 *  @param  option  option
 *
 *  @return SwpCoolAnimators
 */
- (instancetype)initWithOption:(SwpCoolAnimationsOptions)option {
    if (self = [super init]) {
        _animatorsOption = option;
        _swpOrigamiCount = 4;
    }
    return self;
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsInitWithOption: ( 快速初始化 )
 *
 *  @param  option  option
 *
 *  @return SwpCoolAnimators
 */
+ (instancetype)swpCoolAnimationsInitWithOption:(SwpCoolAnimationsOptions)option {
    return [[self alloc] initWithOption:option];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInitWithAnimatorsOption  ( 快速初始化 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(SwpCoolAnimationsOptions))swpCoolAnimationsInitWithOption {
    return ^(SwpCoolAnimationsOptions option) {
        return [self.class swpCoolAnimationsInitWithOption:option];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsWithInit   ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimationsWithInit {
    return [self.class swpCoolAnimationsInitWithOption:100];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorInit ( 快速初始化 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsInit {
    
    return ^(void) {
        return [self.class swpCoolAnimationsWithInit];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsWithInitRandom ( 快速初始化 )
 *
 *  @return SwpTransitions
 */
+ (instancetype)swpCoolAnimationsWithInitRandom {
    return [self.class swpCoolAnimationsInitWithOption:arc4random_uniform(16)];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsRandom ( 设置随机转场 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsRandom {
    return ^(void) {
        return [self.class swpCoolAnimationsWithInitRandom];
    };
}



/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsOptions    ( 设置动画选项 )
 */
- (SwpCoolAnimations * _Nonnull (^)(SwpCoolAnimationsOptions))swpCoolAnimationsOptions {
    return ^(SwpCoolAnimationsOptions swpCoolAnimatorsOption) {
        self->_animatorsOption = swpCoolAnimatorsOption;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimationsOptionRandom   ( 设置随机转场 )
 */
- (SwpCoolAnimations * _Nonnull (^)(void))swpCoolAnimationsOptionRandom {
    return ^(void) {
        return self.swpCoolAnimationsOptions(arc4random_uniform(16));
    };
}


@end

