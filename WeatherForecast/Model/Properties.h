//
//  Properties.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Period.h"

NS_ASSUME_NONNULL_BEGIN

@interface Properties : NSObject

@property (nonatomic, strong) NSString *forecast;

@property (nonatomic, strong) NSString *timeZone;

@property (nonatomic, strong) NSArray *periods;
@end

NS_ASSUME_NONNULL_END
