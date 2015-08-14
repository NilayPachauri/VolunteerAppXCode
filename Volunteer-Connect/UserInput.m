//
//  UserInput.m
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/25/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "UserInput.h"

@implementation UserInput
-(id)initWithName:(NSString*)city: (NSString*)areaOfInterest: (double)numberOfHours: (bool)isSelectedMonday: (bool)isSelectedTuesday: (bool)isSelectedWednesday: (bool)isSelectedThursday: (bool)isSelectedFriday: (bool)isSelectedSaturday:(bool)isSelectedSunday{
    self = [super init];
    if (self != nil) {
        userCity = city;
        userAreaOfInterest = areaOfInterest;
        
        userNumberOfHours = numberOfHours;
        
        userIsSelectedMonday = isSelectedMonday;
        userIsSelectedTuesday = isSelectedTuesday;
        userIsSelectedWednesday = isSelectedWednesday;
        userIsSelectedThursday = isSelectedThursday;
        userIsSelectedFriday = isSelectedFriday;
        userIsSelectedSaturday = isSelectedSaturday;
        userIsSelectedSunday = isSelectedSunday;
        
    }
    return self;
}
-(NSString*)getUserCity{
    return userCity;
}
-(NSString*)getUserAreaOfInterest{
    return userAreaOfInterest;
}
-(double)getUserHours{
    return userNumberOfHours;
}
-(bool)getUserIsSelectedMonday{
    return userIsSelectedMonday;
}
-(bool)getUserIsSelectedTuesday{
    return userIsSelectedTuesday;
}
-(bool)getUserIsSelectedWednesday{
    return userIsSelectedWednesday;
}
-(bool)getUserIsSelectedThursday{
    return userIsSelectedThursday;
}
-(bool)getUserIsSelectedFriday{
    return userIsSelectedFriday;
}
-(bool)getUserIsSelectedSaturday{
    return userIsSelectedSaturday;
}
-(bool)getUserIsSelectedSunday;{
    return userIsSelectedSunday;
}



@end
