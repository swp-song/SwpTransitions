//
//  SwpCoolAnimators.m
//  swp_song
//
//  Created by swp_song on 2017/12/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpCoolAnimatorsCategoryHeader.h"
/* ---------------------- Tool       ---------------------- */


@interface SwpCoolAnimators ()

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
@property (nonatomic, assign) SwpCoolAnimatorsOptions animatorsOption_;
@property (nonatomic, assign) NSUInteger origamiCount_;
/* ---------------------- Data Property  ---------------------- */


@end

@implementation SwpCoolAnimators

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 转场开始执行动画方法 )
 *
 *  @param  transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetToAnimation:transitionContext];
    
    switch (self.animatorsOption_) {
            
            //  全屏翻页
        case SwpCoolAnimatorsOptionPageFlip:
            [self swpCoolPageFlipToAnimators:transitionContext];
            break;
            
            //  居中翻页
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeTop:
            [self swpCoolCenterPageFlipAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeLeft:
            [self swpCoolCenterPageFlipAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeBottom:
            [self swpCoolCenterPageFlipAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeBottom];
            break;
            
        case SwpCoolAnimatorsOptionCenterPageFlipEdgeRight:
            [self swpCoolCenterPageFlipAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeRight];
            break;
            
            //  门户效果
        case SwpCoolAnimatorsOptionPortal:
            [self swpCoolSwpPortalToAnimation:transitionContext];
            break;
    
            //  折纸效果
        case SwpCoolAnimatorsOptionOrigamiLeft:
            [self swpCoolOrigamiToAnimation:transitionContext origamiEdge:SwpCoolSwpOrigamiLeft origamiCount:self.origamiCount_];
            break;
            
        case SwpCoolAnimatorsOptionOrigamiRight:
            [self swpCoolOrigamiToAnimation:transitionContext origamiEdge:SwpCoolSwpOrigamiRight origamiCount:self.origamiCount_];
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
            [self swpCoolScanningToAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionScanningLeft:
            [self swpCoolScanningToAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeLeft];
            break;
            
        case SwpCoolAnimatorsOptionScanningBottom:
            [self swpCoolScanningToAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeBottom];
            break;
            
        case SwpCoolAnimatorsOptionScanningRight:
            [self swpCoolScanningToAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeRight];
            break;
            
        default:
            [self swpCoolDebrisBackAnimation:transitionContext];
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 转场关闭执行动画方法 )
 *
 *  @param  transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    [super swpTransitionsSetBackAnimation:transitionContext];
    
    switch (self.animatorsOption_) {
            
            //  全屏翻页
        case SwpCoolAnimatorsOptionPageFlip:
            [self swpCoolPageFlipBackAnimators:transitionContext];
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
            [self swpCoolCenterPageFlipAnimation:transitionContext pageFlipEdge:SwpCoolCenterPageFlipEdgeLeft];
            break;
            
            //  门户效果
        case SwpCoolAnimatorsOptionPortal:
            [self swpCoolSwpPortalBackAnimation:transitionContext];
            break;
            
            //  折纸效果
        case SwpCoolAnimatorsOptionOrigamiLeft:
            [self swpCoolOrigamiBackAnimation:transitionContext origamiEdge:SwpCoolSwpOrigamiRight origamiCount:self.origamiCount_];
            break;
            
        case SwpCoolAnimatorsOptionOrigamiRight:
            [self swpCoolOrigamiBackAnimation:transitionContext origamiEdge:SwpCoolSwpOrigamiLeft origamiCount:self.origamiCount_];
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
            [self swpCoolScanningBackAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeBottom];
            break;

        case SwpCoolAnimatorsOptionScanningLeft:
            [self swpCoolScanningBackAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeRight];
            break;
            
        case SwpCoolAnimatorsOptionScanningBottom:
            [self swpCoolScanningBackAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeTop];
            break;
            
        case SwpCoolAnimatorsOptionScanningRight:
            [self swpCoolScanningBackAnimation:transitionContext scanningEdge:SwpCoolScanningEdgeLeft];
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
 *  @brief  initWithAnimatorOption: ( 快速初始化 )
 *
 *  @param  animatorsOption animatorsOption
 *
 *  @return SwpCoolAnimators
 */
- (instancetype)initWithAnimatorOption:(SwpCoolAnimatorsOptions)animatorsOption {
    if (self = [super init]) {
        self.animatorsOption_   = animatorsOption;
        self.origamiCount_      = 4;
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
        self.animatorsOption_ = swpCoolAnimatorsOption;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolAnimatorsOptionRandom    ( 设置随机转场 )
 */
- (SwpCoolAnimators * _Nonnull (^)())swpCoolAnimatorsOptionRandom {
    return ^(void) {
        self.swpCoolAnimatorsOption(arc4random_uniform(16));
        return self;
    };
}


@end

