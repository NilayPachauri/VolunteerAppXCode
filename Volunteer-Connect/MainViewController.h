//
//  MainViewController.h
//  Volunteer-Connect
//
//  Created by Nilay on 7/20/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *cityPicker;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIPickerView *areaOfInterestPicker;
@end
