//
//  ShangChengViewController.m
//  Ocean
//
//  Created by Nick on 15/5/12.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ShangChengViewController.h"
#import "UIDefine.h"
#import "RongYuGuanViewController.h"
#import "JiNianGuanViewController.h"
@interface ShangChengViewController ()



@end

@implementation ShangChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *vw=[[UIView alloc]initWithFrame:CGRectMake(0, 65, SelfView_W, SelfView_H-65)];
    vw.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:vw];
    NSArray *arr=@[@"rongyuguan.png",@"jinianguan.png",@"liwuguan.png"];
    for (int i=0; i<3; i++) {
        
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, vw.frame.size.height/3*i, SelfView_W, vw.frame.size.height/3);
        imgView.image=[UIImage imageNamed:arr[i]];
        [vw addSubview:imgView];
        imgView.tag=100+i;
        //创建点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        imgView.userInteractionEnabled=YES;
        
        [imgView addGestureRecognizer:tapGesture];

        
    }

}

-(void)tapGesture:(UITapGestureRecognizer*)tap
{
    UIImageView *img=(UIImageView*)tap.view;
    
    if (img.tag==100) {
        RongYuGuanViewController *ryg=[[RongYuGuanViewController alloc]init];
        [self.navigationController pushViewController:ryg animated:NO];
        
    }else if (img.tag==101){
        JiNianGuanViewController *jng=[[JiNianGuanViewController alloc]init];
        [self.navigationController pushViewController:jng animated:NO];
    }else{
        
    }
    
    
}

@end
