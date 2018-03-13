//
//  SwpCoolAnimatorsModel.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolAnimatorsModel : SwpTransitionsModel

@property (nonatomic, assign, readonly) NSInteger coolAnimatorsType;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionary:   ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpCoolAnimatorsWithDictionary:(NSDictionary *)dictionary;


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionarys:  ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpCoolAnimatorsWithDictionarys:(NSArray<NSDictionary *> *)dictionarys;

@end
NS_ASSUME_NONNULL_END
