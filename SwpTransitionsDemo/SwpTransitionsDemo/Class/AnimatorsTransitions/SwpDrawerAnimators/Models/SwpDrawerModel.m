//
//  SwpDrawerModel.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/13.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDrawerModel.h"

@implementation SwpDrawerModel

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
        _drawer     = [dictionary[@"drawer"] integerValue];
        _size       = dictionary[@"size"];
        _direction  = [dictionary[@"direction"] integerValue];
    }
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerWithDictionary:    ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpDrawerWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerWithDictionarys:   ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpDrawerWithDictionarys:(NSArray<NSDictionary *> *)dictionarys {
    
    NSMutableArray *models = @[].mutableCopy;
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[self.class swpDrawerWithDictionary:obj]];
    }];
    return models.copy;
}



@end
