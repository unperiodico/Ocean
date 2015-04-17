//
//  TimuViewController.h
//  Ocean
//
//  Created by Nick on 15/4/17.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGRadioView.h"

@interface TimuViewController : UITableViewController
<BGRadioViewDelegate,UIAlertViewDelegate>
- (IBAction)commitButton:(id)sender;

@end
