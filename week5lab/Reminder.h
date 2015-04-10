//
//  Reminder.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReminderList;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) ReminderList *list;

@end
