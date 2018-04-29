//
//  SwpTransitionsInfo.h
//  swp_song
//
//  Created by swp_song on 2018/4/8.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface SwpTransitionsInfo : NSObject


/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsInfo ( 获取 SwpTransitions 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpTransitionsInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsVersion   ( 获取 SwpTransitions 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpTransitionsVersion;


@end
NS_ASSUME_NONNULL_END
