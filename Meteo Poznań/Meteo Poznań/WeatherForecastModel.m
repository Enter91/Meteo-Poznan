//
//  WeatherForecastModel.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "WeatherForecastModel.h"
#import <Motis.h>

@implementation WeatherForecastModel

+ (NSDictionary *)mts_mapping {
    return @{
             @"city" : mts_key(city),
             @"list" : mts_key(daysWeatherForecastArray)
             };
}

+ (NSDictionary *)mts_arrayClassMapping {
    return @{
             mts_key(daysWeatherForecastArray) : DayWeatherModel.class
             };
}

@end
