//
//  MainViewController.m
//  Volunteer-Connect
//
//  Created by Nilay on 7/20/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MainViewController () <CLLocationManagerDelegate>

@end

@implementation MainViewController{
    CLLocationManager *manager;
    CLGeocoder *geoCode;
    CLPlacemark *placeMark;
}

@synthesize areaOfInterestPicker = _areaOfInterestPicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    areasOfInterests = [[NSArray alloc] initWithObjects:@"Children", @"Developmentally Disabled", @"Elderly", @"Socioeconomically Disadvantaged", nil];
    
    listOfCities = [[NSArray alloc] initWithObjects: @"Union City", @"Fremont", @"Milpitas", @"San Jose", @"Los Gatos", @"Cupertino", @"Sunnyvale", @"Mountain View", @"Los Altos", @"Palo Alto", @"Redwood City", @"San Francisco", nil];
    manager= [[CLLocationManager alloc] init];
    geoCode= [[CLGeocoder alloc] init];
    
    _areaOfInterestPicker.delegate = self;
    _areaOfInterestPicker.dataSource = self;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [areasOfInterests count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [areasOfInterests objectAtIndex:row];
}

-(void)addAgencies:(UserInput*) userSelections{
    const int MINIMUM_MATCH = 0;
    
    for(int i=0; i<10; i++)
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
-(void)readFile{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"VolData" ofType:@"csv"];
    NSString *strFile = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"%@", strFile);
    if (!strFile) {
        NSLog(@"Error reading file.");
    }
    NSArray* data = [[NSArray alloc] init];
    data = [strFile componentsSeparatedByString:@"\n"];
    strArray = [NSMutableArray array]; // This is your 2D array
    for(int i = 0; i < [data count]; i++)
    {
        NSArray *translation = [data[i] componentsSeparatedByString:@","];
        // translation is assumed to be an array with two elements
        [strArray addObject:translation];
    }
    //NSString* myArrayElement  = [[strArray objectAtIndex:1] objectAtIndex:1];
    //NSLog(@"%@", myArrayElement);
    //NSLog(@"hi");
    
    // this .csv file is seperated with new line character
    // if .csv is seperated by comma use "," instesd of "\n"
    
}

- (IBAction)startSearching:(id)sender {
    manager.delegate= self;
    manager.desiredAccuracy=kCLLocationAccuracyBest;
    [manager requestWhenInUseAuthorization];
    [manager startUpdatingLocation];
    
    
    [self readFile];
    NSString* name;
    NSString* city;
    NSString* target;
    NSString* phoneNumber;
    NSString* email;

    //NSString* selectedCity;
    NSString* selectedInterest;
    double selectedHour=2.00;
    NSString* selectedCity=@"San Jose";
    
    
    double hours;
    
    bool monday;
    bool tuesday;
    bool wednesday;
    bool thursday;
    bool friday;
    bool saturday;
    bool sunday;
    bool isSelectedMonday;
    bool isSelectedTuesday;
    bool isSelectedWednesday;
    bool isSelectedThursday;
    bool isSelectedFriday;
    bool isSelectedSaturday;
    bool isSelectedSunday;
//    NSString* x= [@([strArray count]) stringValue];
//    NSLog(@"%@", x);
    

    for (int rows = 1; rows < ([strArray count]); rows++)    {
        
        name = [[strArray objectAtIndex:rows] objectAtIndex:0];
        city = [[strArray objectAtIndex:rows] objectAtIndex:1];
        target = [[strArray objectAtIndex:rows] objectAtIndex:2];
        phoneNumber = [[strArray objectAtIndex:rows] objectAtIndex:3];
        email = [[strArray objectAtIndex:rows] objectAtIndex:4];

        hours = [[[strArray objectAtIndex:rows] objectAtIndex:5] doubleValue];
        
        monday = [[[strArray objectAtIndex:rows] objectAtIndex:6] boolValue];
        tuesday = [[[strArray objectAtIndex:rows] objectAtIndex:7] boolValue];
        wednesday = [[[strArray objectAtIndex:rows] objectAtIndex:8] boolValue];
        thursday =[[[strArray objectAtIndex:rows] objectAtIndex:9] boolValue];
        friday = [[[strArray objectAtIndex:rows] objectAtIndex:10] boolValue];
        saturday = [[[strArray objectAtIndex:rows] objectAtIndex:11] boolValue];
        sunday = [[[strArray objectAtIndex:rows] objectAtIndex:12] boolValue];
        
        Agency *x = [[Agency alloc] initWithName:name :city :target :phoneNumber :email :hours :monday :tuesday :wednesday :thursday :friday :saturday :sunday];
        
        [listOfAgencies addObject:x];
        //if([x getIsOpenMonday]){NSLog(@"true");}
        
        //        Agency *x=[[Agency] name:name city:city target:target: phoneNumber:phoneNumber email:email hours:hours monday:monday tuesday:tuesday wednesday:wednesday thursday:thursday friday:friday saturday:saturday sunday:sunday];
//        [listOfAgencies addObject: Agency(name,city,target,phoneNumber,email,hours,monday,tuesday,wednesday,thursday,friday,saturday,sunday))];
    }
    NSInteger pickerInput;
    pickerInput=[_areaOfInterestPicker selectedRowInComponent:0];
    selectedInterest=[areasOfInterests objectAtIndex:pickerInput];
    
    isSelectedMonday=[_monday isOn];
    isSelectedTuesday=[_tuesday isOn];
    isSelectedWednesday=[_wednesday isOn];
    isSelectedThursday=[_thursday isOn];
    isSelectedFriday=[_friday isOn];
    isSelectedSaturday=[_saturday isOn];
    isSelectedSunday=[_sunday isOn];

    NSString * theTitle = [_hours titleForSegmentAtIndex:_hours.selectedSegmentIndex];
    selectedHour=[theTitle doubleValue];

    
    UserInput *userChoices=[[UserInput alloc] initWithName:selectedCity :selectedInterest :selectedHour :isSelectedMonday :isSelectedTuesday :isSelectedWednesday :isSelectedThursday :isSelectedFriday :isSelectedSaturday :isSelectedSunday];
    
    [self addAgencies:userChoices];
    [self shellSortListOfAgencies:userChoices];

}

#pragma mark CLLocationManagerDelegate Methods
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Location: %@", newLocation);
    CLLocation *currentLocation= newLocation;
    if(currentLocation!=nil){
        NSLog(@"%@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
        NSLog(@"%@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]);

    }
    [geoCode reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error==nil && [placemarks count]>0){
            placeMark= [placemarks lastObject];
            NSLog(@"%@", [NSString stringWithFormat:@"%@ %@\n%@ %@\n$2\n",
                          placeMark.subThoroughfare, placeMark.thoroughfare,
                          placeMark.postalCode, placeMark.locality,
                          placeMark.administrativeArea,
                          placeMark.country]);
        }
        else{
            NSLog(@"%@", error.debugDescription);
        }
    }];
}
@end
