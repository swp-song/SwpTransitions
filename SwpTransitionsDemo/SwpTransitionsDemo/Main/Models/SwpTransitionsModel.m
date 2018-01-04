//
//  SwpTransitionsModel.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpTransitionsModel.h"

@implementation SwpTransitionsModel

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _metaData       = dictionary;
        _title          = _metaData[@"title"];
        _jumpController = _metaData[@"jumpController"];
    
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionary:   ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpTransitionsWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionarys:  ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpTransitionsWithDictionarys:(NSArray<NSDictionary *> *)dictionarys {
    
    NSMutableArray *models = @[].mutableCopy;
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[self.class swpTransitionsWithDictionary:obj]];
    }];
    return models.copy;
}


@end

