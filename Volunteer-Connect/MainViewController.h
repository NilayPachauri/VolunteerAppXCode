//
//  MainViewController.h
//  Volunteer-Connect
//
//  Created by Nilay on 7/20/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "UserInput.h"
#import "Agency.h"
#import "ViewController.h"

@interface MainViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray* listOfAgencies;
    NSMutableArray* sortedListOfAgencies;
    NSArray *areasOfInterests;
    NSArray *listOfCities;
    NSMutableArray* strArray;
}
-(void)addAgencies:(UserInput*) userSelections;
-(void)shellSortListOfAgencies: (UserInput*) userPreferences;
-(void)readFile;
@property (weak, nonatomic) IBOutlet UIPickerView *areaOfInterestPicker;
@property (weak, nonatomic) IBOutlet UISwitch *monday;
@property (weak, nonatomic) IBOutlet UISwitch *tuesday;
@property (weak, nonatomic) IBOutlet UISwitch *wednesday;
@property (weak, nonatomic) IBOutlet UISwitch *thursday;
@property (weak, nonatomic) IBOutlet UISwitch *friday;
@property (weak, nonatomic) IBOutlet UISwitch *saturday;
@property (weak, nonatomic) IBOutlet UISwitch *sunday;
- (IBAction)startSearching:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *hours;


@end
