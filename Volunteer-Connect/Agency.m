//
//  Agency.m
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/25/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import "Agency.h"

@implementation Agency
-(NSString*)getName{
    
}
-(NSString*)getCity{
    
}
-(NSString*)getTarget{
    
}
-(NSString*)getPhoneNumber{
    
}
-(NSString*)getEmail{
    
}
-(double)getHours{
    
}
-(bool)getIsOpenMonday{
    
}
-(bool)getIsOpenTuesday{
    
}
-(bool)getIsOpenWednesday{
    
}
-(bool)getIsOpenThursday{
    
}
-(bool)getIsOpenFriday{
    
}
-(bool)getIsOpenSaturday{
    
}
-(bool)getISOpenSunday{
    
}
-(int)percentMatch:(UserInput)userPicks{
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
            
            double hoursDifference = Math.abs([userPicks getUserNumberOfHours] - agencyHours);
            percentMatch = (int) (percentMatch + (HOURS_WEIGHTAGE-(12*hoursDifference))); //should be +-<=2.5 hour difference or else the hour match isn't close enough
            return percentMatch;
}
@end
