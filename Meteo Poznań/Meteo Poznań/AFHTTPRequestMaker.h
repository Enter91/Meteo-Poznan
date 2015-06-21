//
//  DayWeatherCollectionViewCell.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPRequestMaker : NSObject

+ (void)sendGETRequestToAddress:(NSString *)urlString successBlock:(void (^)(NSInteger statusCode, id responseObject))success failureBlock:(void (^)(NSInteger statusCode, NSError *error))failure;


@end
