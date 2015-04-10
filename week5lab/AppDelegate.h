//
//  AppDelegate.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ReminderListTableTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@end

