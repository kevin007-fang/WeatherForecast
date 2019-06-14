//
//  CityDetailViewModel.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityDetailViewModel : NSObject

///Query city info
- (void)doQueryDataWithPoint:(NSString *)point completion:(nullable void (^)(City *city, NSError *error))completionHandle;

///Query weather info
- (void)doQueryWeatherDataWithURL:(NSString *)URL completion:(nullable void (^)(City *city, NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END
