//
//  SwpCoolAnimations+SwpPageFlip.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations+SwpPageFlip.h"

/* ---------------------- Tool       ---------------------- */
#import <objc/runtime.h>
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */

static NSString * const kSwpCoolPageFlip_Animators = @"kSwpCoolPageFlip_Animators";

@implementation SwpCoolAnimations (SwpPageFlip)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolPageFlipToAnimation: ( 跳转，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    _PageFlipToAnimation(self, transitionContext, _toDuration);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolPageFlipBackAnimation:   ( 返回，翻页动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolPageFlipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    _PageFlipBackAnimation(self, transitionContext, _backDuration);
}

#pragma mark - Private Methods

FOUNDATION_STATIC_INLINE void _PageFlipToAnimation(SwpCoolAnimations *swpCoolAnimations, id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration) {
    
    UIViewController *fromVC            = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC              = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *tempView                    = [UIView new];
    tempView.swpAnimatorsContentImage   = fromVC.view.swpAnimatorsSnapshotImage;
    tempView.frame                      = fromVC.view.frame;
    UIView *containerView               = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    fromVC.view.hidden = YES;
    [containerView insertSubview:toVC.view atIndex:0];
    _AnchorPoint(CGPointMake(0, 0.5), tempView);
    CATransform3D transfrom3d               = CATransform3DIdentity;
    transfrom3d.m34                         = -0.002;
    containerView.layer.sublayerTransform   = transfrom3d;
    CAGradientLayer *fromGradient           = [CAGradientLayer layer];
    fromGradient.frame                      = fromVC.view.bounds;
    fromGradient.colors                     = @[
                                                (id)[UIColor blackColor].CGColor,
                                                (id)[UIColor blackColor].CGColor
                                                ];
    
    fromGradient.startPoint     = CGPointMake(0.0, 0.5);
    fromGradient.endPoint       = CGPointMake(0.8, 0.5);
    UIView *fromShadow          = [[UIView alloc]initWithFrame:fromVC.view.bounds];
    fromShadow.backgroundColor  = [UIColor clearColor];
    [fromShadow.layer insertSublayer:fromGradient atIndex:1];
    fromShadow.alpha            = 0.0;
    [tempView addSubview:fromShadow];
    CAGradientLayer *toGradient = [CAGradientLayer layer];
    toGradient.frame            = fromVC.view.bounds;
    toGradient.colors           = @[(id)[UIColor blackColor].CGColor,
                                    (id)[UIColor blackColor].CGColor];
    toGradient.startPoint       = CGPointMake(0.0, 0.5);
    toGradient.endPoint         = CGPointMake(0.8, 0.5);
    UIView *toShadow            = [[UIView alloc]initWithFrame:fromVC.view.bounds];
    toShadow.backgroundColor    = [UIColor clearColor];
    [toShadow.layer insertSublayer:toGradient atIndex:1];
    toShadow.alpha              = 1.0;
    [toVC.view addSubview:toShadow];
    
    objc_setAssociatedObject(swpCoolAnimations, &kSwpCoolPageFlip_Animators, tempView, OBJC_ASSOCIATION_ASSIGN);
    [UIView animateWithDuration:duration animations:^{
        tempView.layer.transform    = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        fromShadow.alpha            = 1.0;
        toShadow.alpha              = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [tempView removeFromSuperview];
            fromVC.view.hidden = NO;
        }
    }];
}
FOUNDATION_STATIC_INLINE void _PageFlipBackAnimation(SwpCoolAnimations *swpCoolAnimations, id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration) {
    
    UIViewController    *fromVC         = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC           = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *containerView  = [transitionContext containerView];
    UIView              *tempView       = objc_getAssociatedObject(swpCoolAnimations, &kSwpCoolPageFlip_Animators);
    [containerView addSubview:toVC.view];
    [UIView animateWithDuration:duration animations:^{
        tempView.layer.transform                = CATransform3DIdentity;
        fromVC.view.subviews.lastObject.alpha   = 1.0;
        tempView.subviews.lastObject.alpha      = 0.0;
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        } else {
            [transitionContext completeTransition:YES];
            [tempView removeFromSuperview];
            toVC.view.hidden = NO;
        }
    }];
}


FOUNDATION_STATIC_INLINE void _AnchorPoint(CGPoint point, UIView *view) {
    view.frame = CGRectOffset(view.frame, (point.x - view.layer.anchorPoint.x) * view.frame.size.width, (point.y - view.layer.anchorPoint.y) * view.frame.size.height);
    view.layer.anchorPoint = point;
}
@end

