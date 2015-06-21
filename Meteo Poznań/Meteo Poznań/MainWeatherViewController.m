//
//  MainWeatherViewController.m
//  Meteo Poznań
//
//  Created by Michał Czwarnowski on 21.06.2015.
//  Copyright (c) 2015 Michal Czwarnowski. All rights reserved.
//

#import "MainWeatherViewController.h"
#import "NSDate+RequestStringDate.h"
#import "DayWeatherCollectionViewCell.h"
#import "WeatherManager.h"
#import <DejalActivityView.h>
#import <UIImageView+AFNetworking.h>

@interface MainWeatherViewController () <UICollectionViewDelegateFlowLayout, UIAlertViewDelegate>

@end

@implementation MainWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self downloadCurrentWeatherForecast];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadCurrentWeatherForecast {
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Trwa pobieranie pogody. Proszę czekać..."];
    [[WeatherManager sharedInstance] downloadCurrentWeatherWithCompletionBlock:^(BOOL status) {
        [DejalBezelActivityView removeViewAnimated:YES];
        if (status) {
            [self.collectionView reloadData];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wystąpił błąd" message:@"Nie udało się pobrać pogody" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Spróbuj ponownie", nil];
            [alert show];
        }
    }];
}

#pragma mark- UICollectionView Delegates
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[WeatherManager sharedInstance].weatherForecast.daysWeatherForecastArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    DayWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.contentView.frame = cell.bounds;
    
    WeatherForecastModel *forecastModel = [WeatherManager sharedInstance].weatherForecast;
    DayWeatherModel *weather = [forecastModel.daysWeatherForecastArray objectAtIndex:indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[weather.dateTimestamp doubleValue]];
    
    cell.cityLabel.text = forecastModel.city.cityName;
    cell.dayLabel.text = [date nameOfDay];
    cell.pressureLabel.text = [NSString stringWithFormat:@"%@ hPa", weather.pressure];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:[weather.temp.dayTemp floatValue]]];
    NSNumber *roundedTemperature = [formatter numberFromString:numberString];
    
    if ([roundedTemperature floatValue] == [roundedTemperature intValue]) {
        cell.temperatureLabel.text = [NSString stringWithFormat:@"%d°C",[weather.temp.dayTemp intValue]];
    } else {
        cell.temperatureLabel.text = [NSString stringWithFormat:@"%.1f°C",[weather.temp.dayTemp floatValue]];
    }
    
    [cell.temperatureLabel adjustsFontSizeToFitWidth];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", [[weather.weather firstObject] icon]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    __weak DayWeatherCollectionViewCell *weakCell = cell;
    
    [cell.weatherIconImageView setImageWithURLRequest:request
                                     placeholderImage:nil
                                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                                  weakCell.weatherIconImageView.image = image;
                                              } failure:nil];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return CGSizeMake(240, 320);
    } else {
        return CGSizeMake(CGRectGetMidX(self.view.frame)-18, 200);
    }
    
}

#pragma mark- UIAlertView Delegates
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        [self downloadCurrentWeatherForecast];
    }
}
@end
