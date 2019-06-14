//
//  CityDetailViewController.h
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityDetailViewController : UIViewController

///city info
@property (nonatomic, strong) City *city;
@end

NS_ASSUME_NONNULL_END
