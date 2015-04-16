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
#import "UIImageView+WebCache.h"
#import <AFNetworking.h>
@interface UserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate>
{
    UITableView *_tbView;
    UILabel *_la;
    
}

@property(strong,nonatomic)NSDictionary *dic;

- (IBAction)rightButton;

@end
