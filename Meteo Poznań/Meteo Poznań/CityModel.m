//
//  CityModel.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "CityModel.h"
#import <Motis.h>

@implementation CityModel

+ (NSDictionary *)mts_mapping {
    return @{
             @"country" : mts_key(countryName),
             @"name" : mts_key(cityName),
             @"id" : mts_key(cityID)
             };
}

@end
