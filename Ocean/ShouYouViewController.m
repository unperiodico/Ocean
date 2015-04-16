//
//  ShouYouViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/4/15.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ShouYouViewController.h"

@interface ShouYouViewController ()

@end

@implementation ShouYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor=[UIColor redColor];
    
    
    UIScrollView *sView=[[UIScrollView alloc]init];
    
    sView.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
    sView.contentSize=CGSizeMake(0, 180*4);
    sView.bounces=NO;
    
    NSArray *arr=@[@"demo0.jpg",@"demo1.jpg",@"demo2.jpg",@"demo3.jpg"];
    
    for (int i=0; i<4; i++) {
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
    
    
    
    [self tishi];
    
}
//提示活动结束
-(void)tishi
{
    
    _jieshu=[[UILabel alloc]initWithFrame:CGRectMake((SelfView_W-250)/2, SelfView_H-230, 250, 30)];

    _jieshu.text=@"活动已结束，请关注下期活动";
    _jieshu.backgroundColor=[UIColor orangeColor];
    _jieshu.textAlignment=NSTextAlignmentCenter;
    _jieshu.layer.cornerRadius=5;
    _jieshu.clipsToBounds=YES;
    _jieshu.textColor=[UIColor whiteColor];
    _jieshu.hidden=YES;
    [self.view addSubview:_jieshu];
    

}

//图片点击方法
-(void)tapGesClick:(UITapGestureRecognizer*)tap
{
    _jieshu.hidden=NO;
    //定时器
    _timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}


-(void)nextImage
{
    _jieshu.hidden=YES;
    [self removeTimer];
}
//移除定时器
-(void)removeTimer
{
    
    //停止定时器（一旦定时器停止了，就不能在使用）
    [self.timer invalidate];
    self.timer=nil;
}

@end
