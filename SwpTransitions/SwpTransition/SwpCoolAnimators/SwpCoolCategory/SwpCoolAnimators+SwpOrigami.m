//
//  SwpCoolAnimators+SwpOrigami.m
//  swp_song
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpOrigami.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */


@implementation SwpCoolAnimators (SwpOrigami)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:origamiEdge:origamiCount:   ( 跳转转场，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  origamiEdge         origamiEdge
 *
 *  @param  origamiCount        origamiCount
 */
- (void)swpCoolOrigamiToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge origamiCount:(NSInteger)origamiCount {
    [self _animation:transitionContext origamiEdge:origamiEdge duration:self.transitionsToDuration origamiCount:origamiCount];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolOrigamiBackAnimation:origamiEdge:origamiCount:   ( 关闭转场，折纸动画效果 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  origamiEdge         origamiEdge
 *
 *  @param  origamiCount        origamiCount
 */
- (void)swpCoolOrigamiBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge origamiCount:(NSInteger)origamiCount {
    [self _animation:transitionContext origamiEdge:origamiEdge duration:self.transitionsBackDuration origamiCount:origamiCount];
}



/**
 *  @author swp_song
 *
 *  @brief  _animation:origamiEdge:duration:origamiCount:   ( 折纸核心动画 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  origamiEdge         origamiEdge
 *
 *  @param  duration            duration
 *
 *  @param  origamiCount        origamiCount
 */
- (void)_animation:(id<UIViewControllerContextTransitioning>)transitionContext origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge duration:(NSTimeInterval)duration origamiCount:(NSInteger)origamiCount {
    
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *toView        = toVC.view;
    UIView           *fromView      = fromVC.view;
    UIView           *containerView = [transitionContext containerView];
    toView.frame                    = [transitionContext finalFrameForViewController:toVC];
    toView.frame                    = CGRectOffset(toView.frame, toView.frame.size.width, 0);
    [containerView addSubview:toView];
    
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = -0.005;
    containerView.layer.sublayerTransform = transform;
    CGSize size                     = toView.frame.size;
    float foldWidth                 = size.width * 0.5 / (float)origamiCount ;
    NSMutableArray *fromViewFolds   = [NSMutableArray new];
    NSMutableArray *toViewFolds     = [NSMutableArray new];
    
    UIImage         *fromImage      = fromView.swpAnimatorsSnapshotImage;
    UIImage         *toImage        = toView.swpAnimatorsSnapshotImage;
    
    for (int i=0; i<origamiCount; i++){
        
        float offset = (float)i * foldWidth * 2;
        UIView *leftFromViewFold            = [self _createSnapshotFromView:fromView location:offset origamiEdge:SwpCoolSwpOrigamiRight image:fromImage origamiCount:origamiCount];
        leftFromViewFold.layer.position     = CGPointMake(offset, size.height/2);
        [fromViewFolds addObject:leftFromViewFold];
        
        [leftFromViewFold.subviews[1] setAlpha:0.0];
        UIView *rightFromViewFold           = [self _createSnapshotFromView:fromView location:offset + foldWidth origamiEdge:SwpCoolSwpOrigamiLeft image:fromImage origamiCount:origamiCount];
        rightFromViewFold.layer.position    = CGPointMake(offset + foldWidth * 2, size.height / 2);
        [fromViewFolds addObject:rightFromViewFold];
        
        [rightFromViewFold.subviews[1] setAlpha:0.0];
        UIView *leftToViewFold              = [self _createSnapshotFromView:toView location:offset origamiEdge:SwpCoolSwpOrigamiRight image:toImage origamiCount:origamiCount];
        leftToViewFold.layer.position       = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? size.width : 0.0, size.height / 2);
        leftToViewFold.layer.transform      = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 0.0);
        [toViewFolds addObject:leftToViewFold];
        
        UIView *rightToViewFold             = [self _createSnapshotFromView:toView location:offset + foldWidth origamiEdge:SwpCoolSwpOrigamiLeft image:toImage origamiCount:origamiCount];
        rightToViewFold.layer.position      = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? size.width : 0.0, size.height / 2);
        rightToViewFold.layer.transform     = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
        [toViewFolds addObject:rightToViewFold];
    }
    
    fromView.frame = CGRectOffset(fromView.frame, fromView.frame.size.width, 0);
    
    [UIView animateWithDuration:duration animations:^{
        
        for (int i=0; i<origamiCount; i++) {
            float offset                    = (float)i * foldWidth * 2;
            UIView *leftFromView            = fromViewFolds[i * 2];
            leftFromView.layer.position     = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? 0.0 : size.width, size.height / 2);
            leftFromView.layer.transform    = CATransform3DRotate(transform, M_PI_2, 0.0, 1.0, 0);
            
            [leftFromView.subviews[1] setAlpha:1.0];
            UIView *rightFromView           = fromViewFolds[ i * 2 + 1];
            rightFromView.layer.position    = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? 0.0 : size.width, size.height / 2);
            rightFromView.layer.transform   = CATransform3DRotate(transform, -M_PI_2, 0.0, 1.0, 0);
            
            [rightFromView.subviews[1] setAlpha:1.0];
            UIView* leftToView              = toViewFolds[i*2];
            leftToView.layer.position       = CGPointMake(offset, size.height/2);
            leftToView.layer.transform      = CATransform3DIdentity;
            
            [leftToView.subviews[1] setAlpha:0.0];
            UIView* rightToView             = toViewFolds[i*2+1];
            rightToView.layer.position      = CGPointMake(offset + foldWidth * 2, size.height/2);
            rightToView.layer.transform     = CATransform3DIdentity;
            [rightToView.subviews[1] setAlpha:0.0];
        }
        
    }  completion:^(BOOL finished) {
        for (UIView *view in toViewFolds) {
            [view removeFromSuperview];
        }
        for (UIView *view in fromViewFolds) {
            [view removeFromSuperview];
        }
        
        BOOL transitionFinished = ![transitionContext transitionWasCancelled];
        if (transitionFinished) {
            toView.frame    = containerView.bounds;
            fromView.frame   = containerView.bounds;
        }
        else {
            fromView.frame  = containerView.bounds;
        }
        [transitionContext completeTransition:transitionFinished];
    }];
}


- (UIView *)_createSnapshotFromView:(UIView *)view location:(CGFloat)offset origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge image:(UIImage *)image origamiCount:(NSInteger)origamiCount {
    
    CGSize size             = view.frame.size;
    UIView *containerView   = view.superview;
    float  foldWidth        = size.width * 0.5 / (float)origamiCount ;
    UIView *snapshotView    = [UIView new];
    CGRect snapshotRegion   = CGRectMake(offset, 0.0, foldWidth, size.height);
    snapshotView.frame      = snapshotRegion;
    snapshotView.swpAnimatorsContentImage = image;
    snapshotView.layer.contentsRect = CGRectMake(offset / size.width, 0.0, foldWidth / size.width, 1.0f);
    UIView* snapshotWithShadowView  = [self _addShadowToView:snapshotView origamiEdge:origamiEdge];
    [containerView addSubview:snapshotWithShadowView];
    snapshotWithShadowView.layer.anchorPoint = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? 0.0 : 1.0, 0.5);
    
    return snapshotWithShadowView;
}

- (UIView *)_addShadowToView:(UIView *)view origamiEdge:(SwpCoolSwpOrigamiEdge)origamiEdge {
    
    UIView          *viewWithShadow  = [[UIView alloc] initWithFrame:view.frame];
    UIView          *shadowView      = [[UIView alloc] initWithFrame:viewWithShadow.bounds];
    CAGradientLayer *gradient        = [CAGradientLayer layer];
    gradient.frame                   = shadowView.bounds;
    gradient.colors                  = @[(id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor,
                                         (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor];
    gradient.startPoint              = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? 0.0 : 1.0, origamiEdge == SwpCoolSwpOrigamiRight  ? 0.2 : 0.0);
    gradient.endPoint                = CGPointMake(origamiEdge == SwpCoolSwpOrigamiRight ? 1.0 : 0.0, origamiEdge == SwpCoolSwpOrigamiRight ? 0.0 : 1.0);
    [shadowView.layer insertSublayer:gradient atIndex:1];
    view.frame                       = view.bounds;
    [viewWithShadow addSubview:view];
    [viewWithShadow addSubview:shadowView];
    return viewWithShadow;
}




@end
