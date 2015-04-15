//
//  ActivityViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ActivityViewController.h"
#import "AppDelegate.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CCSegmentedControl* segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"手游大赛", @"知识竞赛", @"商户平台"]];
    segmentedControl.frame = CGRectMake(0, 65, SelfView_W, 50);
    
    //设置背景图片，或者设置颜色，或者使用默认白色外观
    segmentedControl.backgroundImage = [UIImage imageNamed:@"segment_bg.png"];
    //segmentedControl.backgroundColor = [UIColor grayColor];
    
    //阴影部分图片，不设置使用默认椭圆外观的stain
    segmentedControl.selectedStainView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stain.png"]];
    
    
    _shouyou=[[ShouYouViewController alloc]init];
    _zhishi=[[ZhiShiViewController alloc]init];
    _shanghu=[[ShanghuViewController alloc]init];
    
    UIView *rootView=[[UIView alloc]initWithFrame:CGRectMake(0, 115, SelfView_W, SelfView_H-115)];
    rootView.tag=1;
    rootView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:rootView];
    
    _shouyou.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-115);
    [rootView addSubview:_shouyou.view];
    
    
    segmentedControl.selectedSegmentTextColor = [UIColor whiteColor];
//    segmentedControl.segmentTextColor = [self colorWithHexString:@"#535353"];
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    
}

- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = sender;
    NSLog(@"%s line:%d segment has changed to %ld", __FUNCTION__, __LINE__, segmentedControl.selectedSegmentIndex);
    
    
    
    UIView *rootView=(UIView*)[self.view viewWithTag:1];
    
    NSArray *array=[rootView subviews];
    if ([array count]!=0) {
        [array[0] removeFromSuperview];
    }
    
    if (segmentedControl.selectedSegmentIndex==0) {
        _shouyou.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_shouyou.view];
    }else if (segmentedControl.selectedSegmentIndex==1){
        _zhishi.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_zhishi.view];
    }else{
        _shanghu.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_shanghu.view];
    }
    
    
}

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    appDelegate.tabbarLastTimeSelectedIndex =self.tabBarController.selectedIndex;
}

@end
