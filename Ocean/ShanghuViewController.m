//
//  ShanghuViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/4/15.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ShanghuViewController.h"

@interface ShanghuViewController ()

@end

@implementation ShanghuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor=[UIColor purpleColor];
    
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake((SelfView_W-50)/2, SelfView_H/3, 50, 50)];
    imgView.layer.cornerRadius=imgView.frame.size.width/2;
    imgView.clipsToBounds=YES;
    
    imgView.image=[UIImage imageNamed:@"无信息"];
    
    [self.view addSubview:imgView];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((SelfView_W-110)/2, SelfView_H/3+53, 120, 20)];
    label.font=[UIFont boldSystemFontOfSize:13];
    
    label.text=@"暂无商家信息哦~~";
    [self.view addSubview:label];
    
    
}





@end
