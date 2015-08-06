//
//  Agency.m
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/25/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "Agency.h"
#import "UserInput.h"
#import <math.h>

@implementation Agency

-(NSString*)getName{
    return agencyName;
}
-(NSString*)getCity{
    return agencyCity;
}
-(NSString*)getTarget{
    return agencyTarget;
}
-(NSString*)getPhoneNumber{
    return agencyPhoneNumber;
}
-(NSString*)getEmail{
    return agencyEmail;
}
-(double)getHours{
    return agencyHours;
}
-(bool)getIsOpenMonday{
    return isOpenMonday;
}
-(bool)getIsOpenTuesday{
    return isOpenTuesday;
}
-(bool)getIsOpenWednesday{
    return isOpenWednesday;
}
-(bool)getIsOpenThursday{
    return isOpenThursday;
}
-(bool)getIsOpenFriday{
    return isOpenFriday;
}
-(bool)getIsOpenSaturday{
    return isOpenSaturday;
}
-(bool)getIsOpenSunday{
    return isOpenSunday;
}
-(int)percentMatch:(UserInput*)userPicks{
        const int CITY_WEIGHTAGE = 40; //percent weightage
        const int HOURS_WEIGHTAGE = 30;
        const int DAYS_WEIGHTAGE = 30;
        
        int percentMatch = 0;
    if([agencyTarget isEqualToString:([userPicks getUserAreaOfInterest])])
        {
            if([agencyCity isEqualToString:([userPicks getUserCity])])
            {
                percentMatch = percentMatch + CITY_WEIGHTAGE;
            }
            
            int daysSelected = 0;
            int daysMatched = 0;
            if([userPicks getUserIsSelectedMonday])
            {
                daysSelected++;
                if(isOpenMonday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedTuesday])
            {
                daysSelected++;
                if(isOpenTuesday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedWednesday])
            {
                daysSelected++;
                if(isOpenWednesday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedThursday])
            {
                daysSelected++;
                if(isOpenThursday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedFriday])
            {
                daysSelected++;
                if(isOpenFriday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedSaturday])
            {
                daysSelected++;
                if(isOpenSaturday==true)
                {
                    daysMatched++;
                }
            }
            
            if([userPicks getUserIsSelectedSunday])
            {
                daysSelected++;
                if(isOpenSunday==true)
                {
                    daysMatched++;
                }
            }
            
            if(daysSelected==0){daysSelected=1; daysMatched=1;}
            percentMatch = (int) (percentMatch + (DAYS_WEIGHTAGE*(daysMatched/daysSelected))); //percentMatch increases based on how many days matched out of days selected
            
            double hoursDifference = abs([userPicks getUserNumberOfHours] - agencyHours);
            percentMatch = (int) (percentMatch + (HOURS_WEIGHTAGE-(12*hoursDifference))); //should be +-<=2.5 hour difference or else the hour match isn't close enough
        }
            return percentMatch;
}

-(id)initWithName:(NSString *)name :(NSString *)city :(NSString *)target :(NSString *)phoneNumber :(NSString *)email :(double)hours :(bool)monday :(BOOL)tuesday :(BOOL)wednesday :(BOOL)thursday :(BOOL)friday :(BOOL)saturday :(BOOL)sunday   {
    if (self = [super init])    {
        agencyName = name;
        agencyCity = city;
        agencyTarget = target;
        agencyPhoneNumber = phoneNumber;
        agencyEmail = email;
        
        agencyHours = hours;
        
        isOpenMonday = monday;
        isOpenTuesday = tuesday;
        isOpenWednesday = wednesday;
        isOpenThursday = thursday;
        isOpenFriday = friday;
        isOpenSaturday = saturday;
        isOpenSunday = sunday;
        
        return self;
    } else
        return nil;
}

@end
