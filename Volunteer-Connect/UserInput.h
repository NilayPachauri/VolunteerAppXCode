//
//  UserInput.h
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/25/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInput : NSObject
{
    NSString* userCity;
    NSString* userAreaOfInterest;
    
    double userNumberOfHours;
    
    bool userIsSelectedMonday;
    bool userIsSelectedTuesday;
    bool userIsSelectedWednesday;
    bool userIsSelectedThursday;
    bool userIsSelectedFriday;
    bool userIsSelectedSaturday;
    bool userIsSelectedSunday;
}
-(NSString*)getUserCity;
-(NSString*)getUserAreaOfInterest;
-(double)getUserNumberOfHours;
-(bool)getUserIsSelectedMonday;
-(bool)getUserIsSelectedTuesday;
-(bool)getUserIsSelectedWednesday;
-(bool)getUserIsSelectedThursday;
-(bool)getUserIsSelectedFriday;
-(bool)getUserIsSelectedSaturday;
-(bool)getUserIsSelectedSunday;
-(id)initWithName:(NSString*)city: (NSString*)areaOfInterest: (double)numberOfHours: (bool)isSelectedMonday: (bool)isSelectedTuesday: (bool)isSelectedWednesday: (bool)isSelectedThursday: (bool)isSelectedFriday: (bool)isSelectedSaturday:(bool)isSelectedSunday;

@end
