//
//  DayWeatherModel.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "DayWeatherModel.h"
#import <Motis.h>

@implementation DayWeatherModel

+ (NSDictionary *)mts_mapping {
    return @{
             @"pressure" : mts_key(pressure),
             @"temp" : mts_key(temp),
             @"weather" : mts_key(weather),
             @"dt" : mts_key(dateTimestamp)
             };
}

+ (NSDictionary *)mts_arrayClassMapping {
    return @{
             mts_key(weather) : WeatherDescriptionModel.class
             };
}
@end
