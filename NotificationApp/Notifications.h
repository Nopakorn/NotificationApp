//
//  Notifications.h
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notifications : NSObject
{
    NSDate *date;
    NSDictionary *payload;
    
}
@property(nonatomic,copy) NSString *Name;
@property(nonatomic,strong) NSMutableArray *notificationList;

-(id)init;
//-(void)addNotification:(NSDictionary *)info;
@end
