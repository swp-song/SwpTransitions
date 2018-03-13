//
//  SwpTransitionsModel.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2017/12/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsModel : NSObject

@property (nonatomic, copy, readonly) NSDictionary  *metaData;
@property (nonatomic, copy, readonly) NSString      *title;
@property (nonatomic, copy, readonly) NSString      *jumpController;

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionary:  ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpTransitionsWithDictionary:(NSDictionary *)dictionary;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsWithDictionarys: ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpTransitionsWithDictionarys:(NSArray<NSDictionary *> *)dictionarys;



@end
NS_ASSUME_NONNULL_END
