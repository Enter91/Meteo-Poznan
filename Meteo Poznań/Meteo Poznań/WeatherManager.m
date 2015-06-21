//
//  WeatherManager.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "WeatherManager.h"
#import "AFHTTPRequestMaker.h"
#import <Motis.h>

@implementation WeatherManager

static WeatherManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[WeatherManager alloc] init];
}

- (id)mutableCopy
{
    return [[WeatherManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

- (void)downloadCurrentWeatherWithCompletionBlock:(void (^)(BOOL status))completionBlock {
    
    [AFHTTPRequestMaker sendGETRequestToAddress:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=Poznan&mode=json&units=metric&cnt=7" successBlock:^(NSInteger statusCode, id responseObject) {
        if (self.weatherForecast) {
            self.weatherForecast = nil;
        }
        
        self.weatherForecast = [[WeatherForecastModel alloc] init];
        [self.weatherForecast mts_setValuesForKeysWithDictionary:responseObject];
        
        if (completionBlock) {
            completionBlock(YES);
        }
    } failureBlock:^(NSInteger statusCode, NSError *error) {
        if (completionBlock) {
            completionBlock(NO);
        }
    }];
    
    
}

@end
