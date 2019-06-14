//
//  CityDetailViewModel.m
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "CityDetailViewModel.h"
#import "BaseHTTPSessionManger.h"

@interface CityDetailViewModel ()

@end

@implementation CityDetailViewModel

- (void)doQueryDataWithPoint:(NSString *)point completion:(nullable void (^)(City *city, NSError *error))completionHandle {
    [[BaseHTTPSessionManger shareInstance] GET:[NSString stringWithFormat:@"points/%@", point] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        City *city = [City mj_objectWithKeyValues:responseObject];
        
        completionHandle(city, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandle(nil, error);
    }];
}

- (void)doQueryWeatherDataWithURL:(NSString *)URL completion:(nullable void (^)(City *city, NSError *error))completionHandle {
    NSString *tempURL = URL;
    tempURL = [tempURL stringByReplacingOccurrencesOfString:@"https://api.weather.gov/" withString:@""];
    
    [[BaseHTTPSessionManger shareInstance] GET:tempURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        City *city = [City mj_objectWithKeyValues:responseObject];
        
        completionHandle(city, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandle(nil, error);
    }];
}

@end
