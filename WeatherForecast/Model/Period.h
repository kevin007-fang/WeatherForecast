//
//  Period.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Period : NSObject

@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) NSString *shortForecast;

@property (nonatomic, strong) NSString *detailedForecast;
@end

NS_ASSUME_NONNULL_END
