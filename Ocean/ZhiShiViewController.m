//
//  ZhiShiViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/4/15.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ZhiShiViewController.h"

@interface ZhiShiViewController ()

@end

@implementation ZhiShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor=[UIColor blueColor];
    
    
    UIScrollView *sView=[[UIScrollView alloc]init];
    
    sView.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
    sView.contentSize=CGSizeMake(0, 180);
    sView.bounces=NO;
    
    NSArray *arr=@[@"竞赛入口"];
    
    for (int i=0; i<1; i++) {
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, i*180, SelfView_W, 180);
        imgView.image=[UIImage imageNamed:arr[i]];
        
        
        //头像点击事件
        UITapGestureRecognizer *tapGes=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick:)];
        //允许交互
        imgView.userInteractionEnabled=YES;
        [imgView addGestureRecognizer:tapGes];
        
        
        
        [sView addSubview:imgView];
    }
    
    [self.view addSubview:sView];

    
    
}

//图片点击方法
-(void)tapGesClick:(UITapGestureRecognizer*)tap
{
    
    
}

@end
