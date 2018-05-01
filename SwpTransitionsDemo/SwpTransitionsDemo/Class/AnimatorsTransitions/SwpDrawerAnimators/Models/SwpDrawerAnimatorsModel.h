//
//  SwpDrawerAnimatorsModel.h
//  SwpTransitionsDemo
//
//  Created by swp_song on 2018/3/13.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpDrawerAnimatorsModel : SwpTransitionsModel


/*  */
@property (nonatomic, assign, readonly) NSInteger drawer;
@property (nonatomic, assign, readonly) NSInteger direction;
@property (nonatomic, copy  , readonly) NSNumber *size;



/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorsWithDictionary:   ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpDrawerAnimatorsWithDictionary:(NSDictionary *)dictionary;


/**
 *  @author swp_song
 *
 *  @brief  swpDrawerAnimatorsWithDictionarys:  ( 快速初始化 )
 *
 *  @param  dictionarys dictionarys
 *
 *  @return NSObject
 */
+ (NSArray *)swpDrawerAnimatorsWithDictionarys:(NSArray<NSDictionary *> *)dictionarys;


@end
NS_ASSUME_NONNULL_END
