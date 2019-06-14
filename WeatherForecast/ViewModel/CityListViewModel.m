//
//  CityListViewModel.m
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "CityListViewModel.h"

@interface CityListViewModel ()

@end

@implementation CityListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configData];
    }
    
    return self;
}

- (void)configData {
    ///Chicago
    City *chicago = [[City alloc] init];
    chicago.name = @"Chicago";
    chicago.latitude = @"41.8842";
    chicago.longitude = @"-87.6324";
    
    ///New-York
    City *newYork = [[City alloc] init];
    newYork.name = @"New-York";
    newYork.latitude = @"40.7145";
    newYork.longitude = @"-74.0071";
    
    ///Miami
    City *miami = [[City alloc] init];
    miami.name = @"Miami";
    miami.latitude = @"25.7748";
    miami.longitude = @"-80.1977";
    
    ///San Francisco
    City *sanFrancisco = [[City alloc] init];
    sanFrancisco.name = @"San Francisco";
    sanFrancisco.latitude = @"37.7705";
    sanFrancisco.longitude = @"-122.4269";
    
    NSArray *array = @[chicago, newYork, miami, sanFrancisco];
    
    self.cityListArr = array;
}

@end
