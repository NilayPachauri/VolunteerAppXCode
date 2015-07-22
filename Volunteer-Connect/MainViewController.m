//
//  MainViewController.m
//  Volunteer-Connect
//
//  Created by Nilay on 7/20/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()    {
    NSArray *areasOfInterests;
    NSArray *listOfCities;
}

@end

@implementation MainViewController
@synthesize mapView = _mapView;
@synthesize areaOfInterestPicker = _areaOfInterestPicker;
@synthesize cityPicker = _cityPicker;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    
    areasOfInterests = [[NSArray alloc] initWithObjects:@"Children", @"Developmentally Disabled", @"Elderly", @"Socioeconomically Disadvantaged", nil];
    
    listOfCities = [[NSArray alloc] initWithObjects: @"Union City", @"Fremont", @"Milpitas", @"San Jose", @"Los Gatos", @"Cupertino", @"Sunnyvale", @"Mountain View", @"Los Altos", @"Palo Alto", @"Redwood City", @"San Francisco", nil];
    
}

- (void) mapView: (MKMapView *) mapView didUpdateUserLocation:(MKUserLocation *)userLocation    {
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [self.mapView setRegion:region animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 0)    {
        return listOfCities.count;
    }
    else    {
        return areasOfInterests.count;
    }
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 0)    {
        return listOfCities[row];
    }
    else    {
        return areasOfInterests[row];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
