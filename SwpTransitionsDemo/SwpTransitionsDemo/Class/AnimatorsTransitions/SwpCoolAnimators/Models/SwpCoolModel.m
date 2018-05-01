//
//  SwpCoolModel.m
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpCoolModel.h"

@implementation SwpCoolModel

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary dictionary
 *
 *  @return SwpCoolAnimatorsModel
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _coolType  = [dictionary[@"coolType"] integerValue];
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
+ (instancetype)swpCoolWithDictionary:(NSDictionary *)dictionary {
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
+ (NSArray *)swpCoolWithDictionarys:(NSArray<NSDictionary *> *)dictionarys {
    
    NSMutableArray *models = @[].mutableCopy;
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[self.class swpCoolWithDictionary:obj]];
    }];
    return models.copy;
}






@end

