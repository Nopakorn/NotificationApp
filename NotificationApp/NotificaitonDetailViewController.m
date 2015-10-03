//
//  NotificaitonDetailViewController.m
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import "NotificaitonDetailViewController.h"

@implementation NotificaitonDetailViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.nameAlert.text = [[self.detail objectForKey:@"aps"] objectForKey:@"alert"];
    
    NSString* badge = [NSString stringWithFormat:@"Badge: %@",[[self.detail objectForKey:@"aps"] objectForKey:@"badge"]];
    
    
    self.p1.text = badge;
    self.p2.text = [[self.detail objectForKey:@"aps"] objectForKey:@"sound"];

}

@end
