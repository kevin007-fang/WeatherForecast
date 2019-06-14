//
//  BaseHTTPSessionManger.m
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "BaseHTTPSessionManger.h"

@implementation BaseHTTPSessionManger

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static BaseHTTPSessionManger *instance;
    dispatch_once(&onceToken, ^{
        instance = [[BaseHTTPSessionManger alloc]initWithBaseURL:[NSURL URLWithString:@"https://api.weather.gov/"]];
        instance.requestSerializer = [AFHTTPRequestSerializer serializer];;
        [instance.requestSerializer setValue:@"application/geo+json" forHTTPHeaderField:@"Content-Type"];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        instance.responseSerializer.acceptableContentTypes=[instance.responseSerializer.acceptableContentTypes setByAddingObject:@"application/geo+json"];
        instance.requestSerializer.timeoutInterval = 10;
    });
    return instance;
}
@end
