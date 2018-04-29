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
    

    if (!viewController) return;
    
    if (!animated) {
        [self pushViewController:viewController animated:YES];
        return;
    }

    objc_setAssociatedObject(viewController, &kSwpTransitionsKey, animated, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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
    
    //  可以不使用 dispatch_once lod 本身也就调用一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //  方法交换
        swpTransitions_MethodSwizzle(self, @selector(pushViewController:animated:), @selector(swp_pushViewController:animated:));
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
        
    }

    //  调回系统方法
    [self swp_pushViewController:viewController animated:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  swp_MethodSwizzle   ( 方法替换 )
 *
 *  @param  aClass      aClass
 *
 *  @param  originaSEL  originaSEL
 *
 *  @param  replaceSEL  replaceSEL
 */
FOUNDATION_STATIC_INLINE void swpTransitions_MethodSwizzle(Class aClass, SEL originaSEL, SEL replaceSEL) {
    
    
    Method originaMethod = class_getInstanceMethod(aClass, originaSEL);
    Method replaceMethod = class_getInstanceMethod(aClass, replaceSEL);
    
    //  class_addMethod 验证方法是否存在，不存在返回 NO，这里用来验证
    if(class_addMethod(aClass, originaSEL, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod))) {
        
        //  方法不存在，也就是说方法没实现,我们需要先把这个方法实现, 然后在去替换, 这里使用到的是class_replaceMethod这个方法. class_replaceMethod 本身会尝试调用 class_addMethod 和method_setImplementation，所以直接调用 class_replaceMethod
        class_replaceMethod(aClass, originaSEL, method_getImplementation(originaMethod), method_getTypeEncoding(originaMethod));
    } else {
        //  方法交换
        method_exchangeImplementations(originaMethod, replaceMethod);
    }
}


/**
 *  @author swp_song
 *
 *  @brief  _checkDelegate  ( 验证代理方法 )
 */
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
