//
//  SwpCoolModel.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/1/1.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpCoolModel : SwpTransitionsModel

@property (nonatomic, assign, readonly) NSInteger coolType;

/**
 *  @author swp_song
 *
 *  @brief  swpCoolWithDictionary:  ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpCoolWithDictionary:(NSDictionary *)dictionary;


/**
 *  @author swp_song
 *
 *  @brief  swpCoolWithDictionarys: ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpCoolWithDictionarys:(NSArray<NSDictionary *> *)dictionarys;

@end
NS_ASSUME_NONNULL_END
