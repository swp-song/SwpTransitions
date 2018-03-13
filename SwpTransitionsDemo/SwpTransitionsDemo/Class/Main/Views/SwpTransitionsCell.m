//
//  SwpTransitionsCell.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionsCell.h"


/* ---------------------- Tool       ---------------------- */
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpTransitionsModel.h"
/* ---------------------- Model      ---------------------- */


@interface SwpTransitionsCell ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* ---------------------- Data Property  ---------------------- */


@end


@implementation SwpTransitionsCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  @author swp_song
 *
 *  @brief  initWithStyle:reuseIdentifier:  ( Override Init )
 *
 *  @param  style           style
 *
 *  @param  reuseIdentifier reuseIdentifier
 *
 *  @return UITableViewCell
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:12];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  drawRect:   ( Override drawRect )
 *
 *  @param  rect    rect
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self viewBottomDrawLines:rect linesHeight:1 linesColor:[UIColor colorWithRed: 249.0 / 255.0 green: 249.0 / 255.0 blue: 249.0 / 255.0 alpha: 1.0]];
}


/**
 *  @author swp_song
 *
 *  @brief  setData:    ( 设置数据 )
 *
 *  @param  swpTransitions  swpTransitions
 */
- (void)setData:(SwpTransitionsModel *)swpTransitions {
    self.textLabel.text = swpTransitions.title;
}

/**
 *  @author swp_song
 *
 *  @brief  viewBottomDrawLines:linesHeight:linesColor: ( 在 view 底部画线在 view drawRect 这个方法中调用, 一般适用于 绘制 cell 分割线)
 *
 *  @param  frame   frame
 *
 *  @param  height  height
 *
 *  @param  color   color
 */
- (void)viewBottomDrawLines:(CGRect)frame linesHeight:(CGFloat)height linesColor:(UIColor *)color {
    
    color = color ? color : [UIColor colorWithRed:0xE2 / 255.0f green:0xE2 / 255.0f blue:0xE2 / 255.0f alpha:1];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, frame);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokeRect(context, CGRectMake(0, frame.size.height - height, frame.size.width, height));
}



#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsCellWithTableView:forCellReuseIdentifier:    ( 快速初始化一个 Cell )
 *
 *  @param  tableView   tableView
 *
 *  @param  identifier  identifier
 *
 *  @return UITableViewCell
 */
+ (instancetype)swpTransitionsCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier {
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsCellInit ( 快速初始化一个 Cell )
 */
+ (__kindof SwpTransitionsCell * _Nonnull (^)(UITableView * _Nonnull, NSString * _Nonnull))swpTransitionsCellInit {
    
    return ^(UITableView *tableView, NSString *identifier) {
        return [self.class swpTransitionsCellWithTableView:tableView forCellReuseIdentifier:identifier];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  transitions ( 设置数据 )
 */
- (SwpTransitionsCell * _Nonnull (^)(SwpTransitionsModel * _Nonnull))swpTransitions {
    return ^(SwpTransitionsModel *transitions) {
        [self setData:transitions];
        return self;
    };
}


@end
