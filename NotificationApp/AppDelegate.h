//
//  AppDelegate.h
//  NotificationApp
//
//  Created by guild on 9/18/2558 BE.
//  Copyright (c) 2558 ssd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notifications.h"
#import "NotificationListViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSDictionary* myNoti;
}
@property (nonatomic, retain) NSDictionary* myNoti;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Notifications * noti;

@end

