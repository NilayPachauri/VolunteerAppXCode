//
//  SearchViewController.h
//  Volunteer-Connect
//
//  Created by Akash Singhal on 8/13/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "UserInput.h"
#import "Agency.h"

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *result1;
@property (weak, nonatomic) IBOutlet UIButton *result2;
@property (weak, nonatomic) IBOutlet UIButton *result3;
@property (weak, nonatomic) IBOutlet UIButton *result4;
@property (weak, nonatomic) IBOutlet UIButton *result5;
@property (weak, nonatomic) IBOutlet UIButton *result6;
@property (weak, nonatomic) IBOutlet UIButton *result7;
@property (weak, nonatomic) IBOutlet UIButton *result8;
@property (weak, nonatomic) IBOutlet UIButton *result9;
@property (weak, nonatomic) IBOutlet UIButton *result10;

- (IBAction)displayAlertViewResult1:(id)sender;
- (IBAction)displayAlertViewResult2:(id)sender;
- (IBAction)displayAlertViewResult3:(id)sender;
- (IBAction)displayAlertViewResult4:(id)sender;
- (IBAction)displayAlertViewResult5:(id)sender;
- (IBAction)displayAlertViewResult6:(id)sender;
- (IBAction)displayAlertViewResult7:(id)sender;
- (IBAction)displayAlertViewResult8:(id)sender;
- (IBAction)displayAlertViewResult9:(id)sender;
- (IBAction)displayAlertViewResult10:(id)sender;


@end
