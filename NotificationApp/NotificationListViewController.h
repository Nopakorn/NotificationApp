//
//  NotificationListViewController.h
//  NotificationApp
//
//  Created by guild on 9/22/2558 BE.
//  Copyright © 2558 ssd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notifications.h"
#import "NotificaitonDetailViewController.h"


@interface NotificationListViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSString * Title;
    
}
@property (nonatomic) NSMutableArray  * notificationList;
@property(nonatomic,strong) NSDictionary * info;
@property(weak, nonatomic) IBOutlet UITableView *notiTableView;

@end
