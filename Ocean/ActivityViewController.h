//
//  ActivityViewController.h
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "CCSegmentedControl.h"
#import "UIDefine.h"
#import "ShouYouViewController.h"
#import "ZhiShiViewController.h"
#import "ShanghuViewController.h"
@interface ActivityViewController : UIViewController<UIAlertViewDelegate>
{
    ShouYouViewController *_shouyou;
    ZhiShiViewController *_zhishi;
    ShanghuViewController *_shanghu;
}
- (IBAction)showMenu;

@end
