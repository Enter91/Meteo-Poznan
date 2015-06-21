//
//  TemperatureModel.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "TemperatureModel.h"
#import <Motis.h>

@implementation TemperatureModel

+ (NSDictionary *)mts_mapping {
    return @{
             @"day" : mts_key(dayTemp),
             @"min" : mts_key(minTemp),
             @"max" : mts_key(maxTemp),
             @"morn" : mts_key(morningTemp),
             @"eve" : mts_key(eveningTemp),
             @"night" : mts_key(nightTemp)
             };
}

@end
