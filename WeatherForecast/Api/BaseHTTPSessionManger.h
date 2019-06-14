//
//  BaseHTTPSessionManger.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseHTTPSessionManger : AFHTTPSessionManager

+ (instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
