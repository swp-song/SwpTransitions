
//
//  SwpCoolAnimators+SwpScanning.m
//  swp_song
//
//  Created by swp_song on 2018/1/3.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpScanning.h"

@implementation SwpCoolAnimators (SwpScanning)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 跳转转场，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  scanningEdge        scanningEdge
 */
- (void)swpCoolScanningToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext scanningEdge:(SwpCoolScanningEdge)scanningEdge {
    [self _animateTransition:transitionContext duration:self.transitionsToDuration scanningEdge:scanningEdge];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolScanningToAnimation: ( 关闭转场，扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  scanningEdge        scanningEdge
 */
- (void)swpCoolScanningBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext scanningEdge:(SwpCoolScanningEdge)scanningEdge {
    [self _animateTransition:transitionContext duration:self.transitionsBackDuration scanningEdge:scanningEdge];
}



/**
 *  @author swp_song
 *
 *  @brief  _animateTransition:duration:scanningEdge:    ( 扫描动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  duration            duration
 *
 *  @param  scanningEdge        scanningEdge
 */
- (void)_animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext duration:(NSTimeInterval)duration scanningEdge:(SwpCoolScanningEdge)scanningEdge {
    
    
    UIViewController    *fromVC         = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController    *toVC           = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView              *containerView  = [transitionContext containerView];
    [containerView insertSubview:toVC.view atIndex:0];
    UIView              *maskView       = [UIView new];
    maskView.backgroundColor            = [UIColor whiteColor];
    maskView.frame                      = containerView.bounds;
    fromVC.view.maskView                = maskView;
    UIView              *scanView       = [UIView new];
    
//    scanView.backgroundColor            = [UIColor whiteColor];
    
    [containerView addSubview:scanView];
    CGFloat width               = containerView.frame.size.width;
    CGFloat height              = containerView.frame.size.height;
    CGAffineTransform transfrom = CGAffineTransformIdentity;
    
    //  上
    if (scanningEdge == SwpCoolScanningEdgeTop) {
        scanView.bounds = CGRectMake(0, 0,width * 1.5, 18);
        scanView.center = CGPointMake(containerView.center.x, -4);
        transfrom       = CGAffineTransformMakeTranslation(0, height);
    }
    
    // 左
    if (scanningEdge == SwpCoolScanningEdgeLeft) {
        scanView.bounds = CGRectMake(0, 0, 18, height * 1.5);
        scanView.center = CGPointMake(-4, containerView.center.y);
        transfrom       = CGAffineTransformMakeTranslation(width, 0);
    }
    
    
    //  下
    if (scanningEdge == SwpCoolScanningEdgeBottom) {
        scanView.bounds = CGRectMake(0, 0, width * 1.5, 18);
        scanView.center = CGPointMake(containerView.center.x, height + 4);
        transfrom       = CGAffineTransformMakeTranslation(0, -height);
    }
    
    //  右
    if (scanningEdge == SwpCoolScanningEdgeRight) {
        scanView.bounds = CGRectMake(0, 0, 18, height * 1.5);
        scanView.center = CGPointMake(width + 4, containerView.center.y);
        transfrom       = CGAffineTransformMakeTranslation(-width, 0);
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
