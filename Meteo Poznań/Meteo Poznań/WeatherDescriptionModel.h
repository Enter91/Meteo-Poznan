//
//  WeatherDescriptionModel.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDescriptionModel : NSObject

@property (copy, nonatomic, readonly) NSNumber *descriptionID;
@property (copy, nonatomic, readonly) NSString *mainWeather;
@property (copy, nonatomic, readonly) NSString *icon;
@property (copy, nonatomic, readonly) NSString *weatherDescription;

@end
