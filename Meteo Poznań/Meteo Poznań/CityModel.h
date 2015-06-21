//
//  CityModel.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (copy, nonatomic, readonly) NSString *cityName;
@property (copy, nonatomic, readonly) NSString *countryName;
@property (copy, nonatomic, readonly) NSNumber *cityID;

@end
