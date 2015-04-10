//
//  ReminderCell.h
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;

@end
