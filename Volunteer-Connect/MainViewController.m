//
//  MainViewController.m
//  Volunteer-Connect
//
//  Created by Nilay on 7/20/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

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
-(void)addAgencies:(UserInput*) userSelections{
    const int MINIMUM_MATCH = 40;
    
    for(int i=0; i<3; i++)
    {
        if ([[listOfAgencies objectAtIndex:i] percentMatch: userSelections] > MINIMUM_MATCH) {
            [sortedListOfAgencies addObject:([listOfAgencies objectAtIndex:i])];
        }
    }
}
-(void)shellSortListOfAgencies: (UserInput*) userPreferences{
    int increment = [sortedListOfAgencies count] / 2;
    while (increment > 0) {
        for (int i = increment; i < [sortedListOfAgencies count]; i++) {
            int j = i;
            Agency *temp = [sortedListOfAgencies objectAtIndex:i];
            while (j >= increment && [[sortedListOfAgencies objectAtIndex:(j - increment)] percentMatch:userPreferences] < [temp percentMatch:userPreferences]) {
                [sortedListOfAgencies insertObject:[sortedListOfAgencies objectAtIndex:(j-increment)] atIndex:j];
                j = j - increment;
            }
            [sortedListOfAgencies insertObject:temp atIndex:j];
        }
        if (increment == 2) {
            increment = 1;
        } else {
            increment *= (5.0 / 11);
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
}
- (IBAction)startSearching:(id)sender {
    
}
@end
