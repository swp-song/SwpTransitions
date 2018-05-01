//
//  SwpCircleSpreadAnimations+SwpCircleSpread.m
//  swp_song
//
//  Created by swp_song on 2018/5/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCircleSpreadAnimations+SwpCircleSpread.h"

@implementation SwpCircleSpreadAnimations (SwpCircleSpread)

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadToAnimation:center:radius:   ( 跳转，圆圈扩散动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  center              center
 *
 *  @param  radius              radius
 */
- (void)swpCircleSpreadToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext center:(CGPoint)center radius:(CGFloat)radius {
    self.center(center).radius(radius);
    _CircleSpreadToAnimation(transitionContext, _toDuration, self, _center, _radius, _path, _containerView, _maskLayer);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCircleSpreadBackAnimation:center:radius: ( 返回，圆圈扩散动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  center              center
 *
 *  @param  radius              radius
 */
- (void)swpCircleSpreadBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext center:(CGPoint)center radius:(CGFloat)radius  {
    self.center(center).radius(radius);
    _CircleSpreadBackAnimation(transitionContext, _toDuration, self, _center, _radius, _path, _containerView, _maskLayer);
}


#pragma mark - Private Methods
FOUNDATION_STATIC_INLINE void _CircleSpreadToAnimation(id<UIViewControllerContextTransitioning>transitionContext,  NSTimeInterval duration, SwpCircleSpreadAnimations *swpCircleSpreadAnimations, CGPoint aStartPoint, CGFloat aStartRadius, UIBezierPath *aStartPath, UIView *aContainerView, CAShapeLayer *aMaskLayer) {
    
    UIViewController *toVC      = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView       = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    UIBezierPath *startCycle    =  [UIBezierPath bezierPathWithArcCenter:aStartPoint radius:aStartRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CGFloat      x              = aStartPoint.x;
    CGFloat      y              = aStartPoint.y;
    CGFloat      endX           = MAX(x, containerView.frame.size.width - x);
    CGFloat      endY           = MAX(y, containerView.frame.size.height - y);
    CGFloat      radius         = sqrtf(pow(endX, 2) + pow(endY, 2));
    UIBezierPath *endCycle      = [UIBezierPath bezierPathWithArcCenter:aStartPoint radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *maskLayer     = [CAShapeLayer layer];
    maskLayer.path              = endCycle.CGPath;
    toVC.view.layer.mask        = maskLayer;
    aStartPath                  = startCycle;
    aMaskLayer                  = maskLayer;
    aContainerView              = containerView;
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
    maskLayerAnimation.toValue   = (__bridge id)((endCycle.CGPath));
    maskLayerAnimation.duration  = duration;
    maskLayerAnimation.delegate  = swpCircleSpreadAnimations;
    [maskLayerAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"circleSpreadAnimation"];
}


FOUNDATION_STATIC_INLINE void _CircleSpreadBackAnimation(id<UIViewControllerContextTransitioning>transitionContext,  NSTimeInterval duration, SwpCircleSpreadAnimations *swpCircleSpreadAnimations, CGPoint aStartPoint, CGFloat aStartRadius, UIBezierPath *aStartPath, UIView *aContainerView, CAShapeLayer *aMaskLayer) {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:toVC.view atIndex:0];
    UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:aStartPoint radius:aStartRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *maskLayer = (CAShapeLayer *)fromVC.view.layer.mask;
    CGPathRef startPath = maskLayer.path;
    maskLayer.path = endCycle.CGPath;
    aMaskLayer = maskLayer;
    aStartPath = [UIBezierPath bezierPathWithCGPath:startPath];
    aContainerView = containerView;
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(startPath);
    maskLayerAnimation.toValue = (__bridge id)(endCycle.CGPath);
    maskLayerAnimation.duration = duration;
    maskLayerAnimation.delegate = swpCircleSpreadAnimations;
    [maskLayerAnimation setValue:transitionContext forKey:@"transitionContext"];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"circleSpreadAnimation"];
}


#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    id<UIViewControllerContextTransitioning> transitionContext = [anim valueForKey:@"transitionContext"];
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}


@end
