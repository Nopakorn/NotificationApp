//
//  AppDelegate.m
//  NotificationApp
//
//  Created by guild on 9/18/2558 BE.
//  Copyright (c) 2558 ssd. All rights reserved.
//

#import "AppDelegate.h"
#import <WindowsAzureMessaging/WindowsAzureMessaging.h>
#import "NotificationListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize myNoti;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if(launchOptions != nil){
        
        NSDictionary* userinfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        
        if (userinfo != nil) {
            myNoti = userinfo;
        }
    }
    
#ifdef __IPHONE_8_0
    //Right, that is the point
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
#else
    //register to receive notifications
    UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
#endif
    
    
    return YES;
}

#ifdef __IPHONE_8_0
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    
    [application registerForRemoteNotifications];

}
-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler{
    
    if([identifier isEqualToString:@"declineAction"]){
    }
    else if([identifier isEqualToString:@"answerAction"]){}

}
#endif

-(void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"Device Token: %@",deviceToken);
    
//    SBNotificationHub *hub = [[SBNotificationHub alloc]initWithConnectionString:@"Endpoint=sb://carsharing.servicebus.windows.net/;SharedAccessKeyName=DefaultFullSharedAccessSignature;SharedAccessKey=ydsLhKSi55rt8MPcg9dVEMrcJcFqqm+tqbrc7t+MwIg=" notificationHubPath:@"ssd"];
//    
//    [hub registerNativeWithDeviceToken:deviceToken tags:nil completion:^(NSError *error) {
//        if(error != nil) {
//            NSLog(@"Error Registering for notifications: %@",error);
//        }else{
////            [self MessageBox:@"Registration Status" message:@"Registered"];
//            NSLog(@"Registering for notifications");
//        }
//    }];
}

-(void)MessageBox:(NSString *)title message:(NSString *)messageText{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:messageText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}


-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
    NSLog(@"Error FailToRegister: %@",error);
}



-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    NSLog(@"%@", userInfo);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Notification" message:[[userInfo objectForKey:@"aps"]objectForKey:@"alert"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReceivedNotification" object:nil userInfo:userInfo];
    
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers,  and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
