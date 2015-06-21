//
//  WeatherForecastModel.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"
#import "DayWeatherModel.h"

@interface WeatherForecastModel : NSObject

@property (strong, nonatomic, readonly) CityModel *city;
@property (strong, nonatomic, readonly) NSArray *daysWeatherForecastArray;

@end
