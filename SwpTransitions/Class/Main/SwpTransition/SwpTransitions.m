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
 *  @brief  swpTransitionsSetToAnimation:   ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //  跳转执行专场动画
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
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

#pragma mark - Init Data Methods
- (SwpTransitionObject *)toTransition {
    
    return !_toTransition ? _toTransition = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_toDuration animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsSetToAnimation:transitionContext];
        }];
    }) : _toTransition;
}


- (SwpTransitionObject *)backTranstion {
    
    return !_backTranstion ? _backTranstion = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_backDuration animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsSetBackAnimation:transitionContext];
        }];
    }) : _backTranstion;
}




@end

