//
//  NotificaitonDetailViewController.h
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationListViewController.h"

@interface NotificaitonDetailViewController : UIViewController

@property(nonatomic,strong) NSDictionary * detail;

@property (weak, nonatomic) IBOutlet UILabel *nameAlert;
@property (weak, nonatomic) IBOutlet UILabel *p1;
@property (weak, nonatomic) IBOutlet UILabel *p2;
@end
