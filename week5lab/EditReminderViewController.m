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
    
    self.originalReminder = self.currentReminder;
    self.titleTextField.text = self.currentReminder.title;
    self.descriptionTextField.text = self.currentReminder.descriptions;
    self.dueDatePicker.date = self.currentReminder.dueDate;
    if(self.currentReminder.completed.boolValue)
    {
        [self.completedSwitch setOn:YES animated:YES];
    }else{
        [self.completedSwitch setOn:NO animated:YES];
    }
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    
    
    self.navigationItem.rightBarButtonItem = anotherButton;
    self.navigationItem.leftBarButtonItem = backButton;
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
    
    if(self.completedSwitch.on)
    {
        [self.currentReminder setCompleted:[NSNumber numberWithBool:YES]];
    }else{
        [self.currentReminder setCompleted:[NSNumber numberWithBool:NO]];
    }
    
    [self.currentReminder setTitle:self.titleTextField.text];
    [self.currentReminder setDescriptions:self.descriptionTextField.text];
    [self.currentReminder setDueDate:self.dueDatePicker.date];
    [self.delegate editReminder:self.currentReminder];
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)back:(id)sender {
    [self.delegate editReminder:self.originalReminder];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
