//
//  UINavigationController+SwpTransitions.m
//  swp_song
//
//  Created by swp_song on 2018/1/4.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "UINavigationController+SwpTransitions.h"

#import <objc/message.h>
#import "SwpTransitions.h"

@implementation UINavigationController (SwpTransitions)

/**
 *  @author swp_song
 *
 *  @brief  swpPushViewController:animated: ( 跳转方法 )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated        animated
 */
- (void)swpPushViewController:(UIViewController *)viewController animated:(SwpTransitions *)animated {
    
    if (animated) {
        objc_setAssociatedObject(viewController, &kSwpTransitionsKey, animated, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self pushViewController:viewController animated:YES];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self _swizzeViewControlelrDealloc];
    });
}

/**
 *  @author swp_song
 *
 *  @brief  load    ( Override load )
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method systemPush   = class_getInstanceMethod(self.class, @selector(pushViewController:animated:));
        Method swpPush      = class_getInstanceMethod(self.class, @selector(swp_pushViewController:animated:));
        method_exchangeImplementations(systemPush, swpPush);
    });
}

/**
 *  @author swp_song
 *
 *  @brief  swp_pushViewController:animated:    (  )
 *
 *  @param  viewController  viewController
 *
 *  @param  animated    animated
 */
- (void)swp_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    SwpTransitions *swpTransitions = objc_getAssociatedObject(viewController, &kSwpTransitionsKey);
    
    if (swpTransitions) {
        self.delegate = swpTransitions;
    } else if ([self.delegate isKindOfClass:[SwpTransitions class]]){
        self.delegate = nil;
    } else {
        self.delegate = nil;
    }

    //  调回系统方法
    [self swp_pushViewController:viewController animated:animated];
}

- (void)_checkDelegate {
    
    SwpTransitions *animator = objc_getAssociatedObject(self.topViewController, &kSwpTransitionsKey);
    if (animator) {
        self.delegate = animator;
    } else {
        self.delegate = nil;
    }
}


- (void)_swizzeViewControlelrDealloc {
    Class swizzleClass = [UIViewController class];
    @synchronized(swizzleClass) {
        SEL deallocSelector = sel_registerName("dealloc");
        __block void (*originalDealloc)(__unsafe_unretained id, SEL) = NULL;
        __weak typeof(self) weakSelf = self;
        id newDealloc = ^(__unsafe_unretained UIViewController *objSelf) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf _checkDelegate];
            if (originalDealloc == NULL) {
                struct objc_super superInfo = {
                    .receiver = objSelf,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                void (*msgSend)(struct objc_super *, SEL) = (__typeof__(msgSend))objc_msgSendSuper;
                msgSend(&superInfo, deallocSelector);
            } else {
                originalDealloc(objSelf, deallocSelector);
            }
        };
        IMP newDeallocIMP = imp_implementationWithBlock(newDealloc);
        if (!class_addMethod(swizzleClass, deallocSelector, newDeallocIMP, "v@:")) {
            Method deallocMethod = class_getInstanceMethod(swizzleClass, deallocSelector);
            originalDealloc = (void(*)(__unsafe_unretained id, SEL))method_getImplementation(deallocMethod);
            originalDealloc = (void(*)(__unsafe_unretained id, SEL))method_setImplementation(deallocMethod, newDeallocIMP);
        }
    }
}



@end
