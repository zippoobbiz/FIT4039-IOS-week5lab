//
//  ReminderList.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reminder;

@interface ReminderList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface ReminderList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Reminder *)value;
- (void)removeMembersObject:(Reminder *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
