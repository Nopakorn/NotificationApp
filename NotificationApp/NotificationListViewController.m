//
//  NotificationListViewController.m
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import "NotificationListViewController.h"
#import "AppDelegate.h"

@implementation NotificationListViewController

-(void) viewDidLoad
{

    NSLog(@"in view didload:");
    self.notificationList = [NSMutableArray arrayWithCapacity:10];
    
    //initiate when app was killed and notification received
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if(appDelegate.myNoti != nil){
        [self.notificationList addObject:appDelegate.myNoti];
    }
    
    //add observ for next notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addNotification:)
                                                 name:@"ReceivedNotification" object:nil];
    
    [super viewDidLoad];
}

-(void)addNotification:(NSNotification *)notification
{
    
    NSDictionary* a_info = [notification userInfo];
    [self.notificationList addObject:a_info];
    [self.notiTableView reloadData];

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.notificationList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Notification Items";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDate *datenow = [[NSDate alloc] init];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSString *theDate = [dateFormat stringFromDate:datenow];
    
    cell.textLabel.text = [[[self.notificationList objectAtIndex:indexPath.row]objectForKey:@"aps"]objectForKey:@"alert"];
    cell.detailTextLabel.text = theDate;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSDictionary *detailNotification = [self.notificationList objectAtIndex:[self.notiTableView indexPathForSelectedRow].row];
    NotificaitonDetailViewController *dest = [segue destinationViewController];
    dest.detail = detailNotification;

}


@end
