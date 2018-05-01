//
//  SwpCoolAnimations+SwpScanning.m
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations+SwpScanning.h"

@implementation SwpCoolAnimations (SwpScanning)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 跳转，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolScanningToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolScanningEdge)edge {
    _ScanningAnimation(transitionContext, _toDuration, edge);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 返回，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  edge                edge
 */
- (void)swpCoolScanningBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext edge:(SwpCoolScanningEdge)edge {
    _ScanningAnimation(transitionContext, _backDuration, edge);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation  ( 跳转，扫描动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolScanningEdge))swpCoolScanningToAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolScanningEdge edge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolScanningToAnimation:transitionContext edge:edge];
        return swpCoolAnimators;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningBackAnimation    ( 返回，扫描动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolScanningEdge))swpCoolScanningBackAnimation {
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolScanningEdge edge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolScanningBackAnimation:transitionContext edge:edge];
        return swpCoolAnimators;
    };
}


#pragma mark - Private Methods

FOUNDATION_STATIC_INLINE void _ScanningAnimation(id<UIViewControllerContextTransitioning> transitionContext, NSTimeInterval duration, SwpCoolScanningEdge edge) {
    
    UIViewController    *fromVC         = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC           = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *containerView  = [transitionContext containerView];
    [containerView insertSubview:toVC.view atIndex:0];
    UIView              *maskView       = [UIView new];
    maskView.backgroundColor            = [UIColor whiteColor];
    maskView.frame                      = containerView.bounds;
    fromVC.view.maskView                = maskView;
    UIView              *scanView       = [UIView new];
    
    [containerView addSubview:scanView];
    CGFloat width               = containerView.frame.size.width;
    CGFloat height              = containerView.frame.size.height;
    CGAffineTransform transfrom = CGAffineTransformIdentity;
    
    switch (edge) {
        case SwpCoolScanningEdgeTop: {
            scanView.bounds = CGRectMake(0, 0,width * 1.5, 18);
            scanView.center = CGPointMake(containerView.center.x, -4);
            transfrom       = CGAffineTransformMakeTranslation(0, height);
        }
            break;
        case SwpCoolScanningEdgeLeft: {
            scanView.bounds = CGRectMake(0, 0, 18, height * 1.5);
            scanView.center = CGPointMake(-4, containerView.center.y);
            transfrom       = CGAffineTransformMakeTranslation(width, 0);
        }
            break;
        case SwpCoolScanningEdgeBottom: {
            scanView.bounds = CGRectMake(0, 0, width * 1.5, 18);
            scanView.center = CGPointMake(containerView.center.x, height + 4);
            transfrom       = CGAffineTransformMakeTranslation(0, -height);
        }
            break;
            
        case SwpCoolScanningEdgeRight: {
            
            scanView.bounds = CGRectMake(0, 0, 18, height * 1.5);
            scanView.center = CGPointMake(width + 4, containerView.center.y);
            transfrom       = CGAffineTransformMakeTranslation(-width, 0);
        }
            break;
            
        default: {
            scanView.bounds = CGRectMake(0, 0, width * 1.5, 18);
            scanView.center = CGPointMake(containerView.center.x, height + 4);
            transfrom       = CGAffineTransformMakeTranslation(0, -height);
        }
            
            break;
    }
    
    // 执行动画
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.7 animations:^{
            maskView.transform = transfrom;
            scanView.transform = transfrom;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.7 relativeDuration:0.3 animations:^{
            scanView.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        
        fromVC.view.maskView = nil;
        [scanView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}


@end
