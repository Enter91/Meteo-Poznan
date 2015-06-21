//
//  DayWeatherCollectionViewCell.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "DayWeatherCollectionViewCell.h"

@implementation DayWeatherCollectionViewCell

- (void)prepareForReuse {
    self.temperatureLabel.text = @"";
    self.pressureLabel.text = @"";
    self.dayLabel.text = @"";
    self.cityLabel.text = @"";
    self.weatherIconImageView.image = nil;
}

@end
