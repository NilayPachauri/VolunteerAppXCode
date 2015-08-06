//
//  Agency.h
//  Volunteer-Connect
//
//  Created by Akash Singhal on 7/25/15.
//  Copyright (c) 2015 Akash Singhal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInput.h"

@interface Agency : NSObject
{
    NSString* agencyName;  //name of the agency
    NSString* agencyCity;  //city in which the agency is located
    NSString* agencyTarget;    //the area with which the area works with
    NSString* agencyPhoneNumber;   //the phone number to contact the agency
    NSString* agencyEmail; //the email to contact the agency
    
    double agencyHours;    //hours which the agency works per day
    
    //what days the agency is open
    bool isOpenMonday;
    bool isOpenTuesday;
    bool isOpenWednesday;
    bool isOpenThursday;
    bool isOpenFriday;
    bool isOpenSaturday;
    bool isOpenSunday;
}
-(NSString*)getName;
-(NSString*)getCity;
-(NSString*)getTarget;
-(NSString*)getPhoneNumber;
-(NSString*)getEmail;
-(double)getHours;
-(bool)getIsOpenMonday;
-(bool)getIsOpenTuesday;
-(bool)getIsOpenWednesday;
-(bool)getIsOpenThursday;
-(bool)getIsOpenFriday;
-(bool)getIsOpenSaturday;
-(bool)getIsOpenSunday;
-(int)percentMatch:(UserInput*)userPicks;
-(id)initWithName: (NSString*) name: (NSString*) city: (NSString*) target: (NSString*) phoneNumber: (NSString*) email: (double) hours: (bool) monday: (BOOL) tuesday: (BOOL) wednesday: (BOOL) thursday: (BOOL)friday: (BOOL) saturday: (BOOL) sunday;

@end
