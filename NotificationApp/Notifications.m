//
//  Notifications.m
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import "Notifications.h"

@implementation Notifications

-(id)init
{
    if(self = [super init])
    {
        self.notificationList =nil;
    }
    return self;
}
-(void)addNotification:(NSDictionary *)info
{
    
    self.notificationList = [NSMutableArray arrayWithCapacity:10];
    [self.notificationList addObject:info];
}

@end
