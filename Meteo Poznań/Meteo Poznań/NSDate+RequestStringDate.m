//
//  DayWeatherCollectionViewCell.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "NSDate+RequestStringDate.h"

@implementation NSDate (RequestStringDate)

- (NSString *)nameOfDay {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"EEEE"];
    return [df stringFromDate:self];
}

@end
