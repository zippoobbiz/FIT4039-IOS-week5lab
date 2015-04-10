//
//  EditReminderViewController.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol editReminderProtocol <NSObject>

-(void)editReminder:(Reminder *)reminder;

@end


@interface EditReminderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
- (IBAction)switchAction:(id)sender;

- (IBAction)save:(id)sender;

@property (strong, nonatomic) Reminder* currentReminder;
@property (strong, nonatomic) Reminder* originalReminder;
@property (weak, nonatomic) id<editReminderProtocol> delegate;


@end
