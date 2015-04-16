//
//  UserViewController.h
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "UIDefine.h"
#import "MyCell.h"
@interface UserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tbView;
}

- (IBAction)rightButton;

@end
