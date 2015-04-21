//
//  AddReminderViewController.m
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(submitButton:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    _titleTextField.text = @"sample title";
    _descriptionTextField.text = @"sample description";
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

- (IBAction)submitButton:(id)sender {

    NSString* title = self.titleTextField.text;
    NSString* description = self.descriptionTextField.text;
    
    if([self.titleTextField.text isEqualToString:@""])
    {
        [self.titleTextField becomeFirstResponder];
        [self alert:@"Please input title!"];
    }else if([self.descriptionTextField.text isEqualToString:@""])
    {
        [self.descriptionTextField becomeFirstResponder];
        [self alert:@"Please input description!"];
    }else
    {
        NSDate* date = self.dueDatePicker.date;
        
        
        Reminder *reminder = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder"
                                                           inManagedObjectContext:self.managedObjectContext];
        [reminder setTitle:title];
        [reminder setDescriptions:description];
        [reminder setDueDate:date];
        [reminder setCompleted:[NSNumber numberWithBool:NO]];
        [self.delegate addReminder:reminder];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

-(void) alert:(NSString *)text{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:text delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

@end
