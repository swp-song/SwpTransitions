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

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 画效果 */
@property (nonatomic, assign) SwpDrawerAnimatorType      swpDrawerAnimatorType_;
/* 画效方向 */
@property (nonatomic, assign) SwpDrawerAnimatorDirection swpDrawerAnimator_;
/* 背景缩放比例，比例默认为 0.85 */
@property (nonatomic, assign) CGFloat   slideEjectAnimatorScaleRatio_;
/* 垂直，水平 */
@property (nonatomic, assign, getter = isVertical) BOOL vertical_;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, assign) CGFloat   screenSize_;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, weak  ) UIView    *toFromTempView_;
/* 显示在屏幕中的尺寸 */
@property (nonatomic, weak  ) UIView    *gestureView_;
/* 缩放比例 */
@property (nonatomic, assign) CGFloat   stepOneScale_;
/* 缩放比例 */
@property (nonatomic, assign) CGFloat   stepTwoScale_;
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
 *  @brief  swpTransitionsSetToAnimation:   ( 转场开始执行动画方法 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetToAnimation:transitionContext];
    
    switch (self.swpDrawerAnimatorType_) {
            
            //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimator:
            
            self.toFromTempView_      = [self swpSideslipToAnimation:transitionContext swpDrawerAnimator:self.swpDrawerAnimator_ distance:self.screenSize_ vertical:self.isVertical scaleRatio:self.slideEjectAnimatorScaleRatio_];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.toFromTempView_ setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimator:
            
            self.toFromTempView_ = [self swpSlideEjectToAnimation:transitionContext swpDrawerAnimator:self.swpDrawerAnimator_ distance:self.screenSize_ vertical:self.isVertical stepOneScale:self.stepOneScale_ stepTwoScale:self.stepTwoScale_];
            
            self.tapGestureRecognizer = [self tapGestureRecognizer:self.toFromTempView_ setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
            break;
            
        default:
            break;
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsSetBackAnimation: ( 转场关闭执行动画方法 )
 *
 *  @param  transitionContext   transitionContext
 */
- (void)swpTransitionsSetBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [super swpTransitionsSetBackAnimation:transitionContext];
    
    
    [self.toFromTempView_ removeGestureRecognizer:self.self.tapGestureRecognizer];
    
    switch (self.swpDrawerAnimatorType_) {
            
              //  抽屉，左右侧滑效果
        case SwpDrawerSideslipAnimator:
            
            [self swpSideslipBackAnimation:transitionContext toFromTempView:self.toFromTempView_ gestureView:self.gestureView_];
            break;
            
            //  抽屉，弹出侧滑效果
        case SwpDrawerSlideEjectAnimator:
            
            [self swpSlideEjectBackAnimation:transitionContext toFromTempView:self.toFromTempView_ gestureView:self.gestureView_ direction:self.swpDrawerAnimator_ vertical:self.isVertical stepOneScale:self.stepOneScale_];
            
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
        _swpDrawerAnimatorType_         = SwpDrawerSideslipAnimator;
        _swpDrawerAnimator_             = SwpDrawerAnimatorDirectionLeft;
        _stepOneScale_                  = 0.95;
        _stepTwoScale_                  = 0.85;
        _slideEjectAnimatorScaleRatio_  = 1.00;
        _screenSize_                    = 260;
        _vertical_ = _swpDrawerAnimator_ == SwpDrawerAnimatorDirectionTop || _swpDrawerAnimator_ == SwpDrawerAnimatorDirectionBottom;
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
        _swpDrawerAnimatorType_         = drawerAnimator;
        _swpDrawerAnimator_             = dnimatorDirection;
        _screenSize_                    = size;
        _stepOneScale_                  = 0.95;
        _stepTwoScale_                  = 0.85;
        _slideEjectAnimatorScaleRatio_  = 1.00;
        _vertical_ = _swpDrawerAnimator_ == SwpDrawerAnimatorDirectionTop || _swpDrawerAnimator_ == SwpDrawerAnimatorDirectionBottom;
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
        self.swpDrawerAnimatorType_ = swpDrawerAnimator;
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
        self.swpDrawerAnimator_ = swpDrawerAnimatorDirection;
        self.vertical_ = self.swpDrawerAnimator_ == SwpDrawerAnimatorDirectionTop || self.swpDrawerAnimator_ == SwpDrawerAnimatorDirectionBottom;
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
        self.slideEjectAnimatorScaleRatio_ = slideEjectAnimatorScaleRatio;
        self.stepOneScale_ = fmin(1.0, self.slideEjectAnimatorScaleRatio_ + 0.15);
        self.stepTwoScale_ = fmax(0.1, self.slideEjectAnimatorScaleRatio_);
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
        self.screenSize_ = swpDrawerAnimatorScreenSizes;
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
