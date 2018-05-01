//
//  SwpDrawerAnimators.m
//  swp_song
//
//  Created by swp_song on 2018/3/9.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimators.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpDrawerAnimatorsHeader.h"
/* ---------------------- Tool       ---------------------- */


@interface SwpDrawerAnimators ()
{
    // 缩放比例
    CGFloat _slideEjectAnimatorScaleRatio;
}

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 画效果 */
@property (nonatomic, assign) SwpDrawerAnimatorType      animatorType;
/* 画效方向 */
@property (nonatomic, assign) SwpDrawerAnimatorDirection direction;
/* 垂直，水平 */
@property (nonatomic, assign, getter = isVertical) BOOL vertical;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, assign) CGFloat   screenSize;
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
@property (nonatomic, copy) dispatch_block_t swpDrawerAnimatorEnableClickGesture;
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpDrawerAnimators

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetToAnimation:   ( 控制器跳转调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetToAnimation:transitionContext];
    
    switch (self.animatorType) {
            
            //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimator:
            
            self.tempView = [self swpSideslipToAnimation:transitionContext direction:self.direction aDistance:self.screenSize vertical:self.isVertical scaleRatio:_slideEjectAnimatorScaleRatio];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.tempView setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimator:
            
            self.tempView = [self swpSlideEjectToAnimation:transitionContext direction:self.direction aDistance:self.screenSize vertical:self.isVertical stepOneScale:self.stepOneScale stepTwoScale:self.stepTwoScale];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.tempView setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
        default:
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 控制器返回调用 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetBackAnimation:transitionContext];
    
    
    [self.tempView removeGestureRecognizer:self.self.tapGestureRecognizer];
    
    switch (self.animatorType) {
            
              //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimator:
            
            [self swpSideslipBackAnimation:transitionContext tempView:self.tempView gestureView:self.gestureView];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimator:
            
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
        _animatorType                   = SwpDrawerSideslipAnimator;
        _direction                      = SwpDrawerAnimatorDirectionLeft;
        _stepOneScale                   = 0.95;
        _stepTwoScale                   = 0.85;
        _slideEjectAnimatorScaleRatio   = 1.00;
        _screenSize                     = 260;
        _vertical = _direction == SwpDrawerAnimatorDirectionTop || _direction == SwpDrawerAnimatorDirectionBottom;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  initWithAnimatorType:dnimatorDirection:screenSize:  ( 快速初始化 )
 *
 *  @param  drawerAnimator      ( 抽屉动画类型 )
 *
 *  @param  dnimatorDirection   ( 动画方向 )
 *
 *  @param  size                 ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimators
 */
- (instancetype)initWithAnimatorType:(SwpDrawerAnimatorType)drawerAnimator dnimatorDirection:(SwpDrawerAnimatorDirection)dnimatorDirection screenSize:(CGFloat)size {
    
    if (self = [super init]) {
        _animatorType                   = drawerAnimator;
        _direction                      = dnimatorDirection;
        _screenSize                     = size;
        _stepOneScale                   = 0.95;
        _stepTwoScale                   = 0.85;
        _slideEjectAnimatorScaleRatio   = 1.00;
        _vertical = _direction == SwpDrawerAnimatorDirectionTop || _direction == SwpDrawerAnimatorDirectionBottom;
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
    if (self.swpDrawerAnimatorEnableClickGesture) self.swpDrawerAnimatorEnableClickGesture();
}




#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorWithAnimatorType:dnimatorDirection:screenSize: ( 快速初始化 )
 *
 *  @param  drawerAnimator      ( 抽屉动画类型 )
 *
 *  @param  dnimatorDirection   ( 动画方向 )
 *
 *  @param  size                 ( 显示在屏幕中的尺寸 )
 *
 *  @return SwpDrawerAnimators
 */
+ (instancetype)swpDrawerAnimatorWithAnimatorType:(SwpDrawerAnimatorType)drawerAnimator dnimatorDirection:(SwpDrawerAnimatorDirection)dnimatorDirection screenSize:(CGFloat)size {
    return [[self alloc] initWithAnimatorType:drawerAnimator dnimatorDirection:dnimatorDirection screenSize:size];
}



/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorInit:  ( 快速初始化 )
 */
+ (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorType, SwpDrawerAnimatorDirection, CGFloat))swpDrawerAnimatorInit {
    return ^(SwpDrawerAnimatorType drawerAnimator, SwpDrawerAnimatorDirection dnimatorDirection, CGFloat screenSize) {
        return [self.class swpDrawerAnimatorWithAnimatorType:drawerAnimator dnimatorDirection:dnimatorDirection screenSize:screenSize];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimator   ( 设置动画效果 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorType))swpDrawerAnimator {
    return ^(SwpDrawerAnimatorType swpDrawerAnimator) {
        self.animatorType = swpDrawerAnimator;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorDirection  ( 设置动画方向 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(SwpDrawerAnimatorDirection))swpDrawerAnimatorDirection {
    return ^(SwpDrawerAnimatorDirection swpDrawerAnimatorDirection) {
        self.direction = swpDrawerAnimatorDirection;
        self.vertical = self.direction == SwpDrawerAnimatorDirectionTop || self.direction == SwpDrawerAnimatorDirectionBottom;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  slideEjectAnimatorScaleRatio    ( 抽屉，弹出侧滑效果，背景缩放比例，比例默认为 0.85 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(CGFloat))slideEjectAnimatorScaleRatio {
    return ^(CGFloat slideEjectAnimatorScaleRatio) {
        _slideEjectAnimatorScaleRatio = slideEjectAnimatorScaleRatio;
        self.stepOneScale = fmin(1.0, _slideEjectAnimatorScaleRatio + 0.15);
        self.stepTwoScale = fmax(0.1, _slideEjectAnimatorScaleRatio);
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorScreenSizes    ( 设置显示在屏幕中的尺寸 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(CGFloat))swpDrawerAnimatorScreenSizes {
    
    return ^(CGFloat swpDrawerAnimatorScreenSizes) {
        self.screenSize = swpDrawerAnimatorScreenSizes;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorEnableClickGestureEvent:   ( SwpDrawerAnimators, 回调方法，点击 toView 调用 )
 *
 *  @param  swpDrawerAnimatorEnableClickGesture swpDrawerAnimatorEnableClickGesture
 */
- (void)swpDrawerAnimatorEnableClickGestureEvent:(dispatch_block_t)swpDrawerAnimatorEnableClickGesture {
    _swpDrawerAnimatorEnableClickGesture = swpDrawerAnimatorEnableClickGesture;
}

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorEnableClickGestureEvent    ( SwpDrawerAnimators, 回调方法，点击 toView 调用 )
 */
- (SwpDrawerAnimators * _Nonnull (^)(dispatch_block_t))swpDrawerAnimatorEnableClickGestureEvent {
    return ^(dispatch_block_t swpDrawerAnimatorEnableClickGesture) {
        [self swpDrawerAnimatorEnableClickGestureEvent:swpDrawerAnimatorEnableClickGesture];
        return self;
    };
}





@end
