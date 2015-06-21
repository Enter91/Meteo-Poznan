//
//  WeatherManager.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherForecastModel.h"

@interface WeatherManager : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (WeatherManager*)sharedInstance;

@property (strong, nonatomic) WeatherForecastModel *weatherForecast;

- (void)downloadCurrentWeatherWithCompletionBlock:(void (^)(BOOL status))completionBlock;

@end
