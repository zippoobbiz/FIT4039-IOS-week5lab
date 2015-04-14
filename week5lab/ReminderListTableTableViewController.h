//
//  ReminderListTableTableViewController.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddReminderViewController.h"
#import "EditReminderViewController.h"
#import "ReminderList.h"
#import "Reminder.h"
#import "ReminderCell.h"

@interface ReminderListTableTableViewController : UITableViewController <addReminderProtocol>

@property (strong, nonatomic) EditReminderViewController* editcontroller;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) ReminderList* currentListObject;
@property (strong, nonatomic) NSArray* ReminderArray;

@end
