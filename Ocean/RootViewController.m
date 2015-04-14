//
//  ViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()
@end

@implementation RootViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
}

//测试帐号ahy123 密码111111

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarController *tabbarController = (UITabBarController*)self.contentViewController;
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    tabbarController.selectedIndex = appDelegate.tabbarLastTimeSelectedIndex;

}

@end
