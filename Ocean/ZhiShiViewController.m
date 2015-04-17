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
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
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
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"选择参赛入口" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"初中生入口",@"大学生入口", nil];
    alertView.tag=10;
    
    
    [alertView show];
}

//alert回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex ==0){

        //取消
        return;
    }
    else if(buttonIndex ==1){
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:@"chuzhong" forKey:@"nianji"];


        
        //初中生入口
    }
    else if(buttonIndex ==2){
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:@"daxue" forKey:@"nianji"];
        //大学生
    }
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"navigationController_dati"];
    [self presentViewController:next animated:NO completion:nil];
    
}

@end
