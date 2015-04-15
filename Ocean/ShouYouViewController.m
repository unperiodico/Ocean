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
    self.view.backgroundColor=[UIColor redColor];
    
    
    UIScrollView *sView=[[UIScrollView alloc]init];
    
    sView.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-40);
    sView.contentSize=CGSizeMake(0, 180*4);
    sView.bounces=NO;
    
    NSArray *arr=@[@"demo0.jpg",@"demo1.jpg",@"demo2.jpg",@"demo3.jpg"];
    
    for (int i=0; i<4; i++) {
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, i*180, SelfView_W, 180);
        imgView.image=[UIImage imageNamed:arr[i]];
        
        [sView addSubview:imgView];
    }
    
    [self.view addSubview:sView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
