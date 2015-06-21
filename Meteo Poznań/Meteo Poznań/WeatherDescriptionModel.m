//
//  WeatherDescriptionModel.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "WeatherDescriptionModel.h"
#import <Motis.h>

@implementation WeatherDescriptionModel

+ (NSDictionary *)mts_mapping {
    return @{
             @"id": mts_key(descriptionID),
             @"main" : mts_key(mainWeather),
             @"icon" : mts_key(icon),
             @"description" : mts_key(weatherDescription)
             };
}

@end
