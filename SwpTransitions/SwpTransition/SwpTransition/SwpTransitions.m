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
/* 跳转，转场 */
@property (nonatomic, strong) SwpTransitionObject *toTransition_;
/* 关闭，转场 */
@property (nonatomic, strong) SwpTransitionObject *backTranstion_;
/* 跳转，转场时长 默认 0.5s */
@property (nonatomic, assign) NSTimeInterval toDuration_;
/* 关闭，转场时长 默认 0.5s */
@property (nonatomic, assign) NSTimeInterval backDuration_;

@property (nonatomic, assign) UINavigationControllerOperation operation;

/* ---------------------- Data Property  ---------------------- */
@end


@implementation SwpTransitions


/**!
 *  @author swp_song
 *
 *  @brief  init    ( Override Init )
 *
 *  @return NSObject
 */
- (instancetype)init {
    
    if (self = [super init]) {
        self.toDuration_ = self.backDuration_ = 0.5f;
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
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.toTransition_;
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
    return self.backTranstion_;
}


#pragma mark - <UINavigationControllerDelegate>

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    _operation = operation;
    return operation == UINavigationControllerOperationPush ? self.toTransition_ : self.backTranstion_;
}



#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 转场开始执行动画方法 )
 *
 *  @param  transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //  跳转执行专场动画
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 转场关闭执行动画方法  )
 *
 *  @param  transitionContext
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
        self.toDuration_ = toDuration <=0 ? 0.5 : toDuration;
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
        self.backDuration_ = backDuration <=0 ? 0.5 : backDuration;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  transitionsToDuration   ( 获取跳转，转场时间 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)transitionsToDuration {
    return self.toDuration_;
}


/**
 *  @author swp_song
 *
 *  @brief  transitionsBackDuration ( 获取关闭，转场时间 )
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)transitionsBackDuration {
    return self.backDuration_;
}



#pragma mark - Init Data Methods
- (SwpTransitionObject *)toTransition_ {
    
    return !_toTransition_ ? _toTransition_ = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_toDuration_ animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsSetToAnimation:transitionContext];
        }];
    }) : _toTransition_;
}


- (SwpTransitionObject *)backTranstion_ {
    
    return !_backTranstion_ ? _backTranstion_ = ({
        
        __weak typeof(self) weakSelf = self;
        [SwpTransitionObject swpTransitionObject:_toDuration_ animationBlock:^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf swpTransitionsSetBackAnimation:transitionContext];
        }];
    }) : _backTranstion_;
}




@end

