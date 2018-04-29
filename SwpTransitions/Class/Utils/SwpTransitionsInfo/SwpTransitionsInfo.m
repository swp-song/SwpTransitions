//
//  SwpTransitionsInfo.m
//  swp_song
//
//  Created by swp_song on 2018/4/8.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpTransitionsInfo.h"


@implementation SwpTransitionsInfo

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsInfo ( 获取 SwpTransitions 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpTransitionsInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpTransitions.bundle/SwpTransitions.plist" ofType:nil]].copy;
}

/**
 *  @author swp_song
 *
 *  @brief  swpTransitionsVersion   ( 获取 SwpTransitions 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpTransitionsVersion {
    return [self.class swpTransitionsInfo][@"Version"];
}

@end

