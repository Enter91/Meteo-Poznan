//
//  DayWeatherCollectionViewCell.h
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayWeatherCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;

@end
