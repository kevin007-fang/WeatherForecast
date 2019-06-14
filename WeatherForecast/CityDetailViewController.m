//
//  CityDetailViewController.m
//  WeatherForecast
//
//  Created by Fang on 2019/6/14.
//  Copyright © 2019 Fang. All rights reserved.
//

#import "CityDetailViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import "CityDetailViewModel.h"
#import <UIImageView+WebCache.h>

@interface CityDetailViewController ()<BMKMapViewDelegate>

///weather thumbnail
@property (nonatomic, strong) UIImageView *weatherThumbImgView;

///city name
@property (nonatomic, strong) UILabel *cityNameLab;

///weather desc
@property (nonatomic, strong) UILabel *descLab;

///baidu map
@property (nonatomic, strong) BMKMapView *mapView;

///viewModel
@property (nonatomic, strong) CityDetailViewModel *cityDetailViewModel;
@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Detail";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
    [self doQueryData];
}

///config UI
- (void)configUI {
    ///weather thumbnail
    [self.view addSubview:self.weatherThumbImgView];
    [self.weatherThumbImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_offset(60);
        make.top.left.mas_offset(20);
    }];
    
    ///city name
    [self.view addSubview:self.cityNameLab];
    [self.cityNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.weatherThumbImgView.mas_top).mas_offset(15);
        make.left.mas_equalTo(self.weatherThumbImgView.mas_right).mas_offset(15);
    }];
    
    ///Describe the weather
    [self.view addSubview:self.descLab];
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cityNameLab);
        make.bottom.mas_equalTo(self.weatherThumbImgView.mas_bottom);
        make.right.mas_offset(-20);
    }];
    
    ///City map preview
    [self.view addSubview:self.mapView];
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLab.mas_bottom).mas_offset(20);
        make.left.bottom.right.mas_equalTo(self.view);
    }];
    
    BMKMapStatus *status = [[BMKMapStatus alloc]init];
    status.fLevel = 8;
    status.targetGeoPt = CLLocationCoordinate2DMake(self.city.latitude.doubleValue, self.city.longitude.doubleValue);
    [self.mapView setMapStatus:status withAnimation:YES withAnimationTime:1000];
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = CLLocationCoordinate2DMake(self.city.latitude.doubleValue, self.city.longitude.doubleValue);
    annotation.title = @"America";
    annotation.subtitle = self.city.name;
    [self.mapView addAnnotation:annotation];
}

#pragma mark - Query city info
- (void)doQueryData {
    __weak typeof(self) weakSelf = self;
    [self.view makeToastActivity:CSToastPositionCenter];
    [self.cityDetailViewModel doQueryDataWithPoint:[NSString stringWithFormat:@"%@,%@", self.city.latitude, self.city.longitude] completion:^(City * _Nonnull city, NSError * _Nonnull error) {
        [weakSelf.view hideToastActivity];
        if (error == nil) {
            weakSelf.cityNameLab.text = city.properties.timeZone;
            
            [weakSelf doQueryWeatherDataWithURL:city.properties.forecast];
        }
        
    }];
}

#pragma mark - Query weather info
- (void)doQueryWeatherDataWithURL:(NSString *)URL {
    __weak typeof(self) weakSelf = self;
    [self.view makeToastActivity:CSToastPositionCenter];
    [self.cityDetailViewModel doQueryWeatherDataWithURL:URL completion:^(City * _Nonnull city, NSError * _Nonnull error) {
        [weakSelf.view hideToastActivity];
        if (city.properties.periods.count > 0) {
            Period *period = city.properties.periods[0];
            
            [weakSelf.weatherThumbImgView sd_setImageWithURL:[NSURL URLWithString:period.icon] placeholderImage:[UIImage imageNamed:@"def"]];
            weakSelf.descLab.text = period.shortForecast;
        }
    }];
}

#pragma mark - getter
- (UIImageView *)weatherThumbImgView {
    if (_weatherThumbImgView == nil) {
        _weatherThumbImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _weatherThumbImgView.image = [UIImage imageNamed:@"def"];
        _weatherThumbImgView.layer.masksToBounds = YES;
        _weatherThumbImgView.layer.cornerRadius = 4;
    }
    
    return _weatherThumbImgView;
}

- (UILabel *)cityNameLab {
    if (_cityNameLab == nil) {
        _cityNameLab = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return _cityNameLab;
}

- (UILabel *)descLab {
    if (_descLab == nil) {
        _descLab = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return _descLab;
}

- (BMKMapView *)mapView {
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc] initWithFrame:CGRectZero];
    }
    
    return _mapView;
}

- (CityDetailViewModel *)cityDetailViewModel {
    if (_cityDetailViewModel == nil) {
        _cityDetailViewModel = [[CityDetailViewModel alloc] init];
    }
    
    return _cityDetailViewModel;
}

- (void)dealloc {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
