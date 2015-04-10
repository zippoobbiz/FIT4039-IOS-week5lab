//
//  AddReminderViewController.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Reminder.h"

@protocol addReminderProtocol <NSObject>

-(void)addReminder:(Reminder*) reminder;

@end

@interface AddReminderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
- (IBAction)submitButton:(id)sender;

@property (weak, nonatomic) id<addReminderProtocol> delegate;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@end
