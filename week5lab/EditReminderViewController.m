//
//  EditReminderViewController.m
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "EditReminderViewController.h"

@interface EditReminderViewController ()

@end

@implementation EditReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.selectedReminder)
    {
        self.titleTextField.text = [self.selectedReminder valueForKey:@"title"];
        self.descriptionTextField.text = [self.selectedReminder valueForKey:@"descriptions"];
        self.dueDatePicker.date = [self.selectedReminder valueForKey:@"dueDate"];
    }
    
    if([[self.selectedReminder valueForKey:@"completed"] boolValue])
    {
        [self.completedSwitch setOn:YES animated:YES];
    }else{
        [self.completedSwitch setOn:NO animated:YES];
    }
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)switchAction:(id)sender {
    
//    NSLog(@"ssss");
//    if(self.completedSwitch.on)
//    {
//        [self.currentReminder setCompleted:[NSNumber numberWithBool:YES]];
//    }else{
//        [self.currentReminder setCompleted:[NSNumber numberWithBool:NO]];
//    }
}

- (IBAction)save:(id)sender {
    
    if (self.selectedReminder) {
        [self.selectedReminder setValue:self.titleTextField.text forKey:@"title"];
        [self.selectedReminder setValue:self.descriptionTextField.text forKey:@"descriptions"];
        [self.selectedReminder setValue:self.dueDatePicker.date forKey:@"dueDate"];
        [self.selectedReminder setValue:[NSNumber numberWithBool:self.completedSwitch.on ]forKey:@"completed"];
    }
    NSError* saveError;
    // Save the object to persistent store
    if (![self.managedObjectContext save:&saveError]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", saveError, saveError.localizedDescription);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
