//
//  SwpCoolAnimators+SwpDebris.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/2.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolAnimators+SwpDebris.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpAnimatorsSnapshot.h"
/* ---------------------- Tool       ---------------------- */



@implementation SwpCoolAnimators (SwpDebris)


/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 跳转转场，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self _animation:transitionContext duration:self.transitionsToDuration];
    

}


/**
 *  @author swp_song
 *
 *  @brief  swpCoolDebrisBackAnimation: ( 关闭转场，碎片动画效果 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpCoolDebrisBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self _animation:transitionContext duration:self.transitionsBackDuration];
}


/**
 *  @author swp_song
 *
 *  @brief  duration:duration:  ( 碎片效果，动画 )
 *
 *  @param  transitionContext   transitionContext
 *
 *  @param  duration            duration
 */
- (void)_animation:(id<UIViewControllerContextTransitioning>)transitionContext duration:(NSTimeInterval)duration {
    
    UIViewController *fromVC        = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC          = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *toView        = toVC.view;
    UIView           *fromView      = fromVC.view;
    UIView           *containerView = [transitionContext containerView];
    [containerView insertSubview:toView atIndex:0];
    
    CGSize          size                        = toView.frame.size;
    NSMutableArray  *snapshots                  = [NSMutableArray new];
    CGFloat         xNum                        = 10.0f;
    CGFloat         yNum                        = xNum * size.height / size.width;
    UIView          *fromViewSnapshot           = [UIView new];
    UIImage         *fromImage                  = fromVC.view.swpAnimatorsSnapshotImage;
    fromViewSnapshot.swpAnimatorsContentImage   = fromImage;
    CGFloat         fromWidth                   = fromVC.view.bounds.size.width;
    CGFloat         fromHeight                  = fromVC.view.bounds.size.height;
    
    for (CGFloat x=0; x < size.width; x+= size.width / xNum) {
        for (CGFloat y=0; y < size.height; y+= size.height / yNum) {
            CGRect snapshotRegion               = CGRectMake(x, y, size.width / xNum, size.height / yNum);
            UIView *snapshot                    = [UIView new];
            snapshot.swpAnimatorsContentImage   = fromImage;
            CGRect contentRect                  = CGRectMake(x / fromWidth, y / fromHeight, size.width / xNum / fromWidth, size.height / yNum / fromHeight);
            snapshot.layer.contentsRect         = contentRect;
            snapshot.frame                      = snapshotRegion;
            [containerView addSubview:snapshot];
            [snapshots addObject:snapshot];
        }
    }
    fromView.hidden = YES;
    [UIView animateWithDuration:duration animations:^{
        for (UIView *view in snapshots) {
            CGFloat xOffset = [self _randomFloatBetween:-100.0 and:100.0];
            CGFloat yOffset = [self _randomFloatBetween:-100.0 and:100.0];
            view.frame      = CGRectOffset(view.frame, xOffset, yOffset);
            view.alpha      = 0.0;
            view.transform  = CGAffineTransformScale(CGAffineTransformMakeRotation([self _randomFloatBetween:-10.0 and:10.0]), 0.01, 0.01);
        }
    } completion:^(BOOL finished) {
        for (UIView *view in snapshots) {
            [view removeFromSuperview];
        }
        fromView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


- (float)_randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

@end
