//
//  SwpDrawerAnimations.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimations.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpDrawerAnimationsHeader.h"
/* ---------------------- Tool       ---------------------- */


@interface SwpDrawerAnimations ()
{
    // 缩放比例
    CGFloat _slideEjectAnimatorScaleRatio;
}

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 画效果 */
@property (nonatomic, assign) SwpDrawerAnimationsType       drawer;
/* 画效方向 */
@property (nonatomic, assign) SwpDrawerAnimationsDirection  direction;
/* 垂直，水平 */
@property (nonatomic, assign, getter = isVertical) BOOL vertical;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, assign) CGFloat   size;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, weak  ) UIView    *tempView;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, weak  ) UIView    *gestureView;
/* 缩放比例 */
@property (nonatomic, assign) CGFloat   stepOneScale;
/* 缩放比例 */
@property (nonatomic, assign) CGFloat   stepTwoScale;
/* 手势 */
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
/* SwpDrawerAnimators, 回调方法，点击 toView 调用 */
@property (nonatomic, copy) dispatch_block_t enableClickGesture;
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpDrawerAnimations

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsToAnimation:  ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsToAnimation:transitionContext];
    
    switch (self.drawer) {
            
            //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimation:
            
            self.tempView = [self swpSideslipToAnimation:transitionContext direction:self.direction aDistance:self.size vertical:self.isVertical scaleRatio:_slideEjectAnimatorScaleRatio];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.tempView setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimation:
            
            self.tempView = [self swpSlideEjectToAnimation:transitionContext direction:self.direction aDistance:self.size vertical:self.isVertical stepOneScale:self.stepOneScale stepTwoScale:self.stepTwoScale];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.tempView setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
        default:
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsBackAnimation:    ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsBackAnimation:transitionContext];
    
    
    [self.tempView removeGestureRecognizer:self.self.tapGestureRecognizer];
    
    switch (self.drawer) {
            
              //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimation:
            
            [self swpSideslipBackAnimation:transitionContext tempView:self.tempView gestureView:self.gestureView];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimation:
            
            [self swpSlideEjectBackAnimation:transitionContext tempView:self.tempView gestureView:self.gestureView direction:self.direction vertical:self.isVertical stepOneScale:self.stepOneScale];
            
            break;
            
        default:
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前控制器被销毁时调用 )
 */
- (void)dealloc {
    NSLog(@"%s, %@，已销毁", __FUNCTION__, self.class);
}

/**
 *  @author swp_song
 *
 *  @brief  init    ( Override Init )
 *
 *  @return NSObject
 */
- (instancetype)init {
    
    if (self = [super init]) {
        _drawer                         = SwpDrawerSideslipAnimation;
        _direction                      = SwpDrawerAnimationDirectionLeft;
        _stepOneScale                   = 0.95;
        _stepTwoScale                   = 0.85;
        _slideEjectAnimatorScaleRatio   = 1.00;
        _size                           = 260;
        _vertical = _direction == SwpDrawerAnimationDirectionTop || _direction == SwpDrawerAnimationDirectionBottom;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithAnimatorType:direction:size:    ( 快速初始化 )
 *
 *  @param  drawer      ( 抽屉动画类型 )
 *
 *  @param  direction   ( 动画方向 )
 *
 *  @param  size        ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimators
 */
- (instancetype)initWithAnimatorType:(SwpDrawerAnimationsType)drawer direction:(SwpDrawerAnimationsDirection)direction size:(CGFloat)size {
    
    if (self = [super init]) {
        _drawer                         = drawer;
        _direction                      = direction;
        _size                           = size;
        _stepOneScale                   = 0.95;
        _stepTwoScale                   = 0.85;
        _slideEjectAnimatorScaleRatio   = 1.00;
        _vertical = _direction == SwpDrawerAnimationDirectionTop || _direction == SwpDrawerAnimationDirectionBottom;
    }
    return self;
}



/**
 *  @author swp_song
 *
 *  @brief  swpToolSetTapGestureRecognizer:setViewTag:setClickCount:setTarget:setAction:setCancelsTouchesInView:    ( 绑定 一个 点击事件 给一个 view )
 *
 *  @param  view        view
 *
 *  @param  tag         tag
 *
 *  @param  count       count
 *
 *  @param  target      target
 *
 *  @param  action      action
 *
 *  @param  cancels     cancels
 *
 *  @return UITapGestureRecognizer
 */
- (UITapGestureRecognizer *)tapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(id)target setAction:(SEL)action setCancelsTouchesInView:(BOOL)cancels {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired    = count;
    tap.cancelsTouchesInView    = cancels;
    view.tag                    = tag;
    [tap addTarget:target action:action];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
    return tap;
}



/**
 *  @author swp_song
 *
 *  @brief  clickViewEvent: ( view 绑定方法 )
 *
 *  @param  tapGestureRecognizer    tapGestureRecognizer
 */
- (void)clickViewEvent:(UITapGestureRecognizer *)tapGestureRecognizer {
    if (self.enableClickGesture) self.enableClickGesture();
}


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorWithDrawerAnimator:direction:size: ( 快速初始化 )
 *
 *  @param  drawer      ( 抽屉动画类型 )
 *
 *  @param  direction   ( 动画方向 )
 *
 *  @param  size        ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimations
 */
+ (instancetype)swpDrawerAnimatorWithDrawerAnimator:(SwpDrawerAnimationsType)drawer direction:(SwpDrawerAnimationsDirection)direction size:(CGFloat)size {
    return [[self alloc] initWithAnimatorType:drawer direction:direction size:size];
}



/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationsInit:    ( 快速初始化 )
 */
+ (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsType, SwpDrawerAnimationsDirection, CGFloat))swpDrawerAnimationsInit {
    return ^(SwpDrawerAnimationsType drawer, SwpDrawerAnimationsDirection direction, CGFloat size) {
        return [self.class swpDrawerAnimatorWithDrawerAnimator:drawer direction:direction size:size];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimation ( 设置动画效果 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsType))swpDrawerAnimation {
    return ^(SwpDrawerAnimationsType drawer) {
        self.drawer = drawer;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationDirection ( 设置动画方向 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(SwpDrawerAnimationsDirection))swpDrawerAnimationDirection {
    return ^(SwpDrawerAnimationsDirection direction) {
        self.direction = direction;
        self.vertical = self.direction == SwpDrawerAnimationDirectionTop || self.direction == SwpDrawerAnimationDirectionBottom;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  slideEjectAnimationScaleRatio   ( 抽屉，弹出侧滑效果，背景缩放比例，比例默认为 0.85 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(CGFloat))slideEjectAnimationScaleRatio {
    return ^(CGFloat slideEjectAnimationScaleRatio) {
        self->_slideEjectAnimatorScaleRatio = slideEjectAnimationScaleRatio;
        self.stepOneScale = fmin(1.0, self->_slideEjectAnimatorScaleRatio + 0.15);
        self.stepTwoScale = fmax(0.1, self->_slideEjectAnimatorScaleRatio);
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationSize  ( 设置显示在屏幕中的尺寸 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(CGFloat))swpDrawerAnimationSize {
    return ^(CGFloat size) {
        self.size = size;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationEnableClickGestureEvent:  ( SwpDrawerAnimations, 回调方法，点击 toView 调用 )
 *
 *  @param  enableClickGesture  enableClickGesture
 */
- (void)swpDrawerAnimationEnableClickGestureEvent:(dispatch_block_t)enableClickGesture {
    _enableClickGesture = enableClickGesture;
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimationEnableClickGestureEvent   ( SwpDrawerAnimations, 回调方法，点击 toView 调用 )
 */
- (SwpDrawerAnimations * _Nonnull (^)(dispatch_block_t))swpDrawerAnimationEnableClickGestureEvent {
    return ^(dispatch_block_t enableClickGesture) {
        [self swpDrawerAnimationEnableClickGestureEvent:enableClickGesture];
        return self;
    };
}





@end
