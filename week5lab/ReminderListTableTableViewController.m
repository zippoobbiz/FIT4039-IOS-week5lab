//
//  ReminderListTableTableViewController.m
//  week5lab
//
//  Created by BigBadEgg on 4/8/15.
//  Copyright (c) 2015 Xiaoduo. All rights reserved.
//

#import "ReminderListTableTableViewController.h"

@interface ReminderListTableTableViewController ()

@end

@implementation ReminderListTableTableViewController

//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.ReminderArray = [[NSArray alloc] init];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ReminderList"];
    NSError* error;
    NSArray* result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(result == nil) {
        NSLog(@"Could not fetch table:\n%@", error.userInfo); }
    else if([result count] == 0)
    {
        self.currentListObject = [NSEntityDescription insertNewObjectForEntityForName:@"ReminderList"
                                                               inManagedObjectContext:self.managedObjectContext]; }
    else
    {
        self.currentListObject = [result firstObject];
        self.ReminderArray = [self.currentListObject.members allObjects];
        self.ReminderArray = [self.ReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSDate *first = [(Reminder*)a dueDate];
            NSDate *second = [(Reminder*)b dueDate];
            return [first compare:second];
        }];
    }
}

-(void) viewDidAppear:(BOOL)animated{

    self.ReminderArray = [self.ReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Reminder*)a dueDate];
        NSDate *second = [(Reminder*)b dueDate];
        return [first compare:second];
    }];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.ReminderArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
    {
        ReminderCell *cell = (ReminderCell*)[tableView
                                             dequeueReusableCellWithIdentifier:@"ReminderCell" forIndexPath:indexPath];
        Reminder* r = [self.ReminderArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = r.title;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat =@"yyyy-MM-dd";
        cell.dueDateLabel.text = [dateFormatter stringFromDate:r.dueDate];
        return cell;
    }
    return nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addReminder"])
    {
        AddReminderViewController* controller = segue.destinationViewController;
        controller.managedObjectContext = self.managedObjectContext;
        controller.delegate = self;
        
        
    }else if([segue.identifier isEqualToString:@"editReminder"]){
        self.editcontroller = segue.destinationViewController;
        NSManagedObject* selectedReminder = (NSManagedObject *)[self.ReminderArray objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        self.editcontroller.selectedReminder = selectedReminder;
    }
}


-(void)addReminder:(Reminder *)reminder
{
    [self.currentListObject addMembersObject:reminder];
    self.ReminderArray = [self.currentListObject.members allObjects];
    self.ReminderArray = [self.ReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Reminder*)a dueDate];
        NSDate *second = [(Reminder*)b dueDate];
        return [first compare:second];
    }];
    NSError* error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Could not save reminder insertion:\n%@", error.userInfo);
    }
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        Reminder* r = [self.ReminderArray objectAtIndex:indexPath.row];
        [self.currentListObject removeMembersObject:r];
        self.ReminderArray = [self.currentListObject.members allObjects];
        //Delete the row from the table
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSError* error;
        if(![self.managedObjectContext save:&error])
        {
            NSLog(@"Could not save deletion:\n%@", error.userInfo);
        }
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
