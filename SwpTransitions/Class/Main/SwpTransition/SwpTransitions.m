//
//  SwpTransitions.m
//  swp_song
//
//  Created by swp_song on 2017/12/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitions.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpTransitionObject.h"
/* ---------------------- Tool       ---------------------- */

NSString * const kSwpTransitionsKey = @"kSwpTransitionsKey";

@interface SwpTransitions ()

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 跳转转场 */
@property (nonatomic, strong, nullable) SwpTransitionObject *toTransition;
/* 返回转场 */
@property (nonatomic, strong, nullable) SwpTransitionObject *backTranstion;
@property (nonatomic, assign) UINavigationControllerOperation operation;
/* ---------------------- Data Property  ---------------------- */
@end


@implementation SwpTransitions


/**
 *  @author swp_song
 *
 *  @brief  init    ( Override Init )
 *
 *  @return NSObject
 */
- (instancetype)init {
    
    if (self = [super init]) {
        _toDuration = _backDuration = 0.5;
    }
    return self;
}




#pragma mark - <UIViewController Transitioning Delegate>
/**
 *  @author swp_song
 *
 *  @brief  animationControllerForPresentedController:presentingController:sourceController:    (   )
 *
 *  @param  presented   presented
 *
 *  @param  presenting  presenting
 *
 *  @param  source      source
 *
 *  @return id<UIViewControllerAnimatedTransitioning>
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.toTransition;
}

/**
 *  @author swp_song
 *
 *  @brief  animationControllerForDismissedController:  (   )
 *
 *  @param  dismissed   dismissed
 *
 *  @return id<UIViewControllerAnimatedTransitioning>
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.backTranstion;
}


#pragma mark - <UINavigationControllerDelegate>

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    _operation = operation;
    return operation == UINavigationControllerOperationPush ? self.toTransition : self.backTranstion;
}



#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //  跳转执行专场动画
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsBackAnimation:    ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //  关闭执行转场动画
}

/**
 *  @author swp_song
 *
 *  @brief  toDuration  (  设置转场时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))toDuration {
    
    return ^(NSTimeInterval toDuration) {
        self->_toDuration = toDuration <= 0 ? 0.5 : toDuration;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  toDuration  (  设置关闭时长 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(NSTimeInterval))backDuration {
    
    return ^(NSTimeInterval backDuration) {
        self->_backDuration = backDuration <= 0 ? 0.5 : backDuration;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  aToDuration ( 获取跳转，转场时长 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)aToDuration {
    return _toDuration;
}

/**
 *  @author swp_song
 *
 *  @brief  aBackDuration   ( 获取返回，转场时长 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)aBackDuration {
    return _backDuration;
}



/**
 *  @author swp_song
 *
 *  @brief  interactive ( 双向交互，防止手势松开，缺少过度动画问题 )
 */
- (__kindof SwpTransitions * _Nonnull (^)(BOOL))interactive {
    return ^(BOOL interactive) {
        self->_isInteractive = interactive;
        return self;
    };
}


#pragma mark - Init Data Methods
- (SwpTransitionObject *)toTransition {
    
    return !_toTransition ? _toTransition = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_toDuration animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsToAnimation:transitionContext];
        }];
    }) : _toTransition;
}


- (SwpTransitionObject *)backTranstion {
    
    return !_backTranstion ? _backTranstion = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_backDuration animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsBackAnimation:transitionContext];
        }];
    }) : _backTranstion;
}




@end

