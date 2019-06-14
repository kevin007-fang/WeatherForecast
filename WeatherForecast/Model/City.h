//
//  City.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Properties.h"

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject

///城市名字
@property (nonatomic, strong) NSString *name;

///纬度
@property (nonatomic, strong) NSString *latitude;

///经度
@property (nonatomic, strong) NSString *longitude;

@property (nonatomic, strong) Properties *properties;
@end

NS_ASSUME_NONNULL_END
