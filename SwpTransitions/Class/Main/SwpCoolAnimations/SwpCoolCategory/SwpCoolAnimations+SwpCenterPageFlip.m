//
//  SwpCoolAnimations+SwpCenterPageFlip.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimations+SwpCenterPageFlip.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */

@implementation SwpCoolAnimations (SwpCenterPageFlip)

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipToAnimation:pageFlipEdge:  ( 跳转，居中翻页效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */
- (void)swpCoolCenterPageFlipToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)pageFlipEdge {
    _CenterPageFlipAnimation(transitionContext, pageFlipEdge, _toDuration);
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation:pageFlipEdge:    ( 返回，居中翻页效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 */
- (void)swpCoolCenterPageFlipBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext pageFlipEdge:(SwpCoolCenterPageFlipEdge)pageFlipEdge {
    _CenterPageFlipAnimation(transitionContext, pageFlipEdge, _backDuration);
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipToAnimation    ( 跳转，居中翻页动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipToAnimation {
    
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolCenterPageFlipEdge pageFlipEdge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolCenterPageFlipToAnimation:transitionContext pageFlipEdge:pageFlipEdge];
        return swpCoolAnimators;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCoolCenterPageFlipBackAnimation  ( 返回，居中翻页动画效果 )
 */
+ (SwpCoolAnimations * _Nonnull (^)(id<UIViewControllerContextTransitioning> _Nonnull, SwpCoolCenterPageFlipEdge))swpCoolCenterPageFlipBackAnimation {
    
    return ^(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolCenterPageFlipEdge pageFlipEdge) {
        id swpCoolAnimators = self.class.new;
        [swpCoolAnimators swpCoolCenterPageFlipBackAnimation:transitionContext pageFlipEdge:pageFlipEdge];
        return swpCoolAnimators;
    };
}

#pragma mark - Private Methods
/**
 *  @author swp_song
 *
 *  @brief  _Animation  ( 返回，居中翻页效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  pageFlipEdge        pageFlipEdge
 *
 *  @param  duration            duration
 */
FOUNDATION_STATIC_INLINE void _CenterPageFlipAnimation(id<UIViewControllerContextTransitioning>transitionContext, SwpCoolCenterPageFlipEdge pageFlipEdge, NSTimeInterval duration) {
 
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *toView        = toVC.view;
    UIView           *fromView      = fromVC.view;
    UIView           *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34           = -0.002;
    [containerView.layer setSublayerTransform:transform];
    
    BOOL animation = pageFlipEdge == SwpCoolCenterPageFlipEdgeLeft || pageFlipEdge == SwpCoolCenterPageFlipEdgeTop;
    
    NSArray *toViewSnapshots    = _AnimationSnapFlipView(toView, pageFlipEdge, YES);
    UIView  *animationToView    = toViewSnapshots[animation ? 1 : 0];
    NSArray *fromViewSnapshots  = _AnimationSnapFlipView(fromView, pageFlipEdge, NO);
    UIView  *animationFromView  = fromViewSnapshots[animation ? 0 : 1];
    
    _AddShadowWithPageFlipEdge(pageFlipEdge, animationFromView, animationToView);
    
    _AnchorPointWithPageFlipEdge(pageFlipEdge, animationFromView, animationToView);
    
    BOOL rationAngle    = pageFlipEdge == SwpCoolCenterPageFlipEdgeLeft || pageFlipEdge == SwpCoolCenterPageFlipEdgeBottom;
    BOOL flipDirection  = pageFlipEdge == SwpCoolCenterPageFlipEdgeLeft || pageFlipEdge == SwpCoolCenterPageFlipEdgeRight;
    
    animationToView.layer.transform = CATransform3DMakeRotation(rationAngle ? -M_PI_2 : M_PI_2, flipDirection ? 0.0 : 1.0, !flipDirection ? 0.0 : 1.0, 0.0);
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            
            animationFromView.layer.transform   = CATransform3DMakeRotation(rationAngle ? M_PI_2 : -M_PI_2, flipDirection ? 0.0 : 1.0, !flipDirection ? 0.0 : 1.0, 0.0);
            UIView *shadowView                  = animationFromView.subviews.lastObject;
            shadowView.alpha                    = 1.0f;
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            animationToView.hidden          = NO;
            animationToView.layer.transform = CATransform3DMakeRotation(rationAngle ? -0.001 : 0.001, flipDirection ? 0.0 : 1.0, !flipDirection ? 0.0 : 1.0, 0.0);
            UIView *shadowView              = animationToView.subviews.lastObject;
            shadowView.alpha                = 0.0f;
            
        }];
        
    } completion:^(BOOL finished) {
        
        [toViewSnapshots makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [fromViewSnapshots makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}


FOUNDATION_STATIC_INLINE NSArray<UIView *> * _AnimationSnapFlipView(UIView *view, SwpCoolCenterPageFlipEdge pageFlipEdge, BOOL update) {
    UIView *containerView   = view.superview;
    CGSize size             = view.bounds.size;
    CGRect rectOne          = CGRectZero;
    CGRect rectTwo          = CGRectZero;
    switch (pageFlipEdge) {
        case SwpCoolCenterPageFlipEdgeLeft:
        case SwpCoolCenterPageFlipEdgeRight:{
            rectOne = CGRectMake(0, 0, view.frame.size.width / 2.0f, view.frame.size.height);
            rectTwo = CGRectMake(view.frame.size.width / 2.0f, 0, view.frame.size.width / 2.0f, view.frame.size.height);
            break;
        }
        case SwpCoolCenterPageFlipEdgeTop:
        case SwpCoolCenterPageFlipEdgeBottom:{
            rectOne = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height / 2.0f);
            rectTwo = CGRectMake(0, view.frame.size.height / 2.0f, view.frame.size.width, view.frame.size.height / 2.0f);
            break;
        }
    }
    UIView *viewOne                     = [UIView new];
    viewOne.swpAnimatorsContentImage    = view.swpAnimatorsSnapshotImage;
    UIView *viewTwo                     = [UIView new];
    viewTwo.swpAnimatorsContentImage    = viewOne.swpAnimatorsContentImage;
    viewOne.frame                       = rectOne;
    viewTwo.frame                       = rectTwo;
    viewOne.layer.contentsRect          = CGRectMake(rectOne.origin.x / size.width, rectOne.origin.y / size.height, rectOne.size.width / size.width, rectOne.size.height / size.height);
    viewTwo.layer.contentsRect          = CGRectMake(rectTwo.origin.x / size.width, rectTwo.origin.y / size.height, rectTwo.size.width / size.width, rectTwo.size.height / size.height);
    [containerView addSubview:viewOne];
    [containerView addSubview:viewTwo];
    return @[viewOne, viewTwo];
}

FOUNDATION_STATIC_INLINE void _AnchorPointWithPageFlipEdge(SwpCoolCenterPageFlipEdge pageFlipEdge, UIView *fromView, UIView *toView) {
    switch (pageFlipEdge) {
        case SwpCoolCenterPageFlipEdgeLeft: {
            _AnchorToPoint(CGPointMake(1, 0.5), fromView);
            _AnchorToPoint(CGPointMake(0, 0.5), toView);
            break;
        }
        case SwpCoolCenterPageFlipEdgeRight: {
            _AnchorToPoint(CGPointMake(0, 0.5), fromView);
            _AnchorToPoint(CGPointMake(1, 0.5), toView);
            break;
        }
        case SwpCoolCenterPageFlipEdgeTop: {
            _AnchorToPoint(CGPointMake(0.5, 1), fromView);
            _AnchorToPoint(CGPointMake(0.5, 0), toView);
            break;
        }
        case SwpCoolCenterPageFlipEdgeBottom: {
            _AnchorToPoint(CGPointMake(0.5, 0), fromView);
            _AnchorToPoint(CGPointMake(0.5, 1), toView);
            break;
        }
    }
}


FOUNDATION_STATIC_INLINE void _AddShadowWithPageFlipEdge(SwpCoolCenterPageFlipEdge pageFlipEdge, UIView *fromView, UIView *toView) {
    
    CGPoint fstartP = CGPointZero;
    CGPoint fendP   = CGPointZero;
    CGPoint tstartP = CGPointZero;
    CGPoint tendP   = CGPointZero;
    switch (pageFlipEdge) {
            
        case SwpCoolCenterPageFlipEdgeLeft: {
            fstartP = CGPointMake(0.0, 0.0);
            fendP   = CGPointMake(1.0, 0.0);
            tstartP = CGPointMake(1.0, 0.0);
            tendP   = CGPointMake(0.0, 0.0);
            break;
        }
            
        case SwpCoolCenterPageFlipEdgeRight: {
            fstartP = CGPointMake(1.0, 0.0);
            fendP   = CGPointMake(0.0, 0.0);
            tstartP = CGPointMake(0.0, 0.0);
            tendP   = CGPointMake(1.0, 0.0);
            break;
        }
        case SwpCoolCenterPageFlipEdgeTop: {
            fstartP = CGPointMake(0.0, 0.0);
            fendP   = CGPointMake(0.0, 1.0);
            tstartP = CGPointMake(0.0, 1.0);
            tendP   = CGPointMake(0.0, 0.0);
            break;
        }
        case SwpCoolCenterPageFlipEdgeBottom: {
            fstartP = CGPointMake(0.0, 1.0);
            fendP   = CGPointMake(0.0, 0.0);
            tstartP = CGPointMake(0.0, 0.0);
            tendP   = CGPointMake(0.0, 1.0);
            break;
        }
    }
    _AddGrandientLayerWithStartPoint(fstartP, fendP, fromView).alpha    = 0.0f;
    _AddGrandientLayerWithStartPoint(fstartP, fendP, toView).alpha      = 1.0f;
}

FOUNDATION_STATIC_INLINE UIView * _AddGrandientLayerWithStartPoint(CGPoint startPoint, CGPoint endPoint, UIView *view) {
     
     CAGradientLayer *gradient   = [CAGradientLayer layer];
     gradient.frame              = view.bounds;
     gradient.colors             = @[(id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor,
                                     (id)[UIColor colorWithWhite:0.0 alpha:0.5].CGColor];
     gradient.startPoint         = startPoint;
     gradient.endPoint           = endPoint;
     UIView* shadowView          = [[UIView alloc] initWithFrame:view.bounds];
     [shadowView.layer insertSublayer:gradient atIndex:0];
     [view addSubview:shadowView];
     return shadowView;
}

FOUNDATION_STATIC_INLINE void _AnchorToPoint(CGPoint point, UIView *view) {
    view.frame = CGRectOffset(view.frame, (point.x - view.layer.anchorPoint.x) * view.frame.size.width, (point.y - view.layer.anchorPoint.y) * view.frame.size.height);
    view.layer.anchorPoint = point;
}


@end

