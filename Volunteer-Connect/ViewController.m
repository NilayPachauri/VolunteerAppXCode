//
//  ViewController.m
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/19/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"VolData" ofType:@"csv"];
    NSString *strFile = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    if (!strFile) {
        NSLog(@"Error reading file.");
    }
    NSArray* data = [[NSArray alloc] init];
    
    data = [strFile componentsSeparatedByString:@"/n"];
    NSMutableArray *strArray = [NSMutableArray array]; // This is your 2D array
    for(int i = 0; i < [data count]; i++)
    {
        NSArray *translation = [data[i] componentsSeparatedByString:@","];
        // translation is assumed to be an array with two elements
        [strArray addObject:translation];
    }
    id myArrayElement  = [strArray objectAtIndex:1];
    // NSLog(@"%@", myArrayElement);
    NSLog(@"hi");
    
    // this .csv file is seperated with new line character
    // if .csv is seperated by comma use "," instesd of "\n"
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
