
//
//  SwpDrawerAnimatorsModel.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/13.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerAnimatorsModel.h"

@implementation SwpDrawerAnimatorsModel

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _drawerAnimatorsType        = [dictionary[@"drawerAnimatorsType"] integerValue];
        _screenSizes                = dictionary[@"screenSizes"];
        _drawerAnimatorDirection    = [dictionary[@"drawerAnimatorDirection"] integerValue];
    }
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorsWithDictionary:   ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpDrawerAnimatorsWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorsWithDictionarys:  ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpDrawerAnimatorsWithDictionarys:(NSArray<NSDictionary *> *)dictionarys {
    
    NSMutableArray *models = @[].mutableCopy;
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[self.class swpDrawerAnimatorsWithDictionary:obj]];
    }];
    return models.copy;
}



@end
