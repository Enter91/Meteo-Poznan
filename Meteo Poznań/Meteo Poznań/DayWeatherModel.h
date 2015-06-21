//
//  DayWeatherModel.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemperatureModel.h"
#import "WeatherDescriptionModel.h"

@interface DayWeatherModel : NSObject

@property (copy, nonatomic, readonly) NSNumber *pressure;
@property (copy, nonatomic, readonly) NSNumber *dateTimestamp;
@property (strong, nonatomic, readonly) TemperatureModel *temp;
@property (strong, nonatomic, readonly) NSArray *weather;

@end
