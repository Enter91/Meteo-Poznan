//
//  DayWeatherCollectionViewCell.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "AFHTTPRequestMaker.h"
#import <AFNetworking/AFNetworking.h>

@implementation AFHTTPRequestMaker

+ (void)sendGETRequestToAddress:(NSString *)urlString successBlock:(void (^)(NSInteger statusCode, id responseObject))success failureBlock:(void (^)(NSInteger statusCode, NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] relativeToURL:[NSURL URLWithString:@"http://api.openweathermap.org"]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:[url absoluteString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success([operation.response statusCode], responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure([operation.response statusCode], error);
        }
        
    }];
}

@end
