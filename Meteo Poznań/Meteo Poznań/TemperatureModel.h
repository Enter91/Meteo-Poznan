//
//  TemperatureModel.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureModel : NSObject

@property (copy, nonatomic, readonly) NSNumber *dayTemp;
@property (copy, nonatomic, readonly) NSNumber *minTemp;
@property (copy, nonatomic, readonly) NSNumber *maxTemp;
@property (copy, nonatomic, readonly) NSNumber *morningTemp;
@property (copy, nonatomic, readonly) NSNumber *eveningTemp;
@property (copy, nonatomic, readonly) NSNumber *nightTemp;

@end
