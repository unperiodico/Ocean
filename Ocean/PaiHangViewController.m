//
//  PaiHangViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/6/1.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "PaiHangViewController.h"
#import "UIDefine.h"
@interface PaiHangViewController ()

@end

@implementation PaiHangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"排行榜";
    
    
    
    CCSegmentedControl* segmentedControl = [[CCSegmentedControl alloc] initWithItems:@[@"总榜", @"小学组", @"中学组",@"大学组",@"公众组"]];
    segmentedControl.frame = CGRectMake(0, 65, SelfView_W, 50);
    
    //设置背景图片，或者设置颜色，或者使用默认白色外观
    segmentedControl.backgroundImage = [UIImage imageNamed:@"segment_bg.png"];
    //segmentedControl.backgroundColor = [UIColor grayColor];
    
    //阴影部分图片，不设置使用默认椭圆外观的stain
    segmentedControl.selectedStainView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stain.png"]];
    
    
    _zongbang=[[ZongBangViewController alloc]init];
    _xiaoxuezu=[[XiaoXueZuViewController alloc]init];
    _zhongxuezu=[[ZhongXueZuViewController alloc]init];
    _daxuezu=[[DaXueZuViewController alloc]init];
    _gongzhongzu=[[GongZhongZuViewController alloc]init];
    
    
    
    UIView *rootView=[[UIView alloc]initWithFrame:CGRectMake(0, 115, SelfView_W, SelfView_H-115)];
    rootView.tag=1;
    rootView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:rootView];
    
    _zongbang.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-115);
    [rootView addSubview:_zongbang.view];
    
    
    segmentedControl.selectedSegmentTextColor = [UIColor whiteColor];
    //    segmentedControl.segmentTextColor = [self colorWithHexString:@"#535353"];
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
}

- (void)valueChanged:(id)sender
{
    CCSegmentedControl* segmentedControl = sender;
    NSLog(@"%s line:%d segment has changed to %ld", __FUNCTION__, __LINE__, (long)segmentedControl.selectedSegmentIndex);
    
    
    
    UIView *rootView=(UIView*)[self.view viewWithTag:1];
    
    NSArray *array=[rootView subviews];
    if ([array count]!=0) {
        [array[0] removeFromSuperview];
    }
    
    if (segmentedControl.selectedSegmentIndex==0) {
        _zongbang.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_zongbang.view];
    }else if (segmentedControl.selectedSegmentIndex==1){
        _xiaoxuezu.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_xiaoxuezu.view];
    }else if(segmentedControl.selectedSegmentIndex==2){
        _zhongxuezu.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_zhongxuezu.view];
    }else if(segmentedControl.selectedSegmentIndex==3){
        _daxuezu.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_daxuezu.view];
    }else{
        _gongzhongzu.view.frame=CGRectMake(0, 0, SelfView_W, SelfView_H-165);
        [rootView addSubview:_gongzhongzu.view];
    }
    
    
}
@end
