//
//  RongYuGuanViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/5/25.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "RongYuGuanViewController.h"
#import "UIDefine.h"
#import "ChongZhiViewController.h"
#import "WuPinXiangQingViewController.h"
@interface RongYuGuanViewController ()<UIScrollViewDelegate>


@property(strong,nonatomic)UIScrollView *sView;
@property(strong,nonatomic)NSArray *arr;
@property(strong,nonatomic)NSArray *arr1;
@property(strong,nonatomic)NSArray *arr2;
@end

@implementation RongYuGuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.navigationItem.title=@"商城";
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *czView=[[UIView alloc]init];
    czView.frame=CGRectMake(0, 64, SelfView_W, 40);
    
    czView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:czView];
    
    UILabel *hblabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 260, 30)];
    
    NSString *asdad=[NSString stringWithFormat:@"你的海币余额:%@",[defaults objectForKey:@"jiabi"]];
    hblabel.text=asdad;
    
    [czView addSubview:hblabel];
    
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame=CGRectMake(SelfView_W-50, 5, 40, 30);
    bt.layer.cornerRadius=8;
    bt.clipsToBounds=YES;
    [bt setTitle:@"充值" forState:UIControlStateNormal];
    
    [bt setTintColor:[UIColor whiteColor]];
    
    [bt setBackgroundColor:[UIColor blueColor]];
    [bt addTarget:self action:@selector(btclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [czView addSubview:bt];
    _sView=[[UIScrollView alloc]init];
    _sView.frame=CGRectMake(0, 105, SelfView_W, SelfView_H-105);
    _sView.delegate=self;
    _sView.backgroundColor=[UIColor redColor];
    
    _arr=@[@"v0.png",@"v1.png",@"v2.png",@"v3.png",@"v4.png",@"v5.png"];
    _arr1=@[@"海军新兵勋章",@"海军大兵勋章",@"海军中尉勋章",@"海军少校勋章",@"海军大将勋章",@"海军元帅勋章"];
    _arr2=@[@"0",@"100",@"350",@"500",@"800",@"1500"];
    for (int i=0; i<6; i++) {
        UIView *zView=[[UIView alloc]init];
        UILabel *name=[[UILabel alloc]init];
        name.frame=CGRectMake(0, 190, (SelfView_W-30)/2, 30);
        name.text=_arr1[i];
        name.textAlignment=NSTextAlignmentCenter;
        UILabel *jiage=[[UILabel alloc]init];
        jiage.frame=CGRectMake(0, 170, (SelfView_W-30)/2, 30);
        jiage.text=[NSString stringWithFormat:@"%@海币",_arr2[i]];
        jiage.textAlignment=NSTextAlignmentCenter;
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, 0, (SelfView_W-30)/2, 170);
        imgView.image=[UIImage imageNamed:_arr[i]];
        if (i%2==0) {
            zView.frame=CGRectMake(10, 220*(i/2)+10*(i/2), (SelfView_W-30)/2, 220);
        }else{
            zView.frame=CGRectMake((SelfView_W-30)/2+20, 220*((i-1)/2)+10*((i-1)/2), (SelfView_W-30)/2, 220);
            
        }
        //tag值
        imgView.tag=100+i;
        
        //创建点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        imgView.userInteractionEnabled=YES;
        
        [imgView addGestureRecognizer:tapGesture];
        
        [zView addSubview:imgView];
        [zView addSubview:name];
        [zView addSubview:jiage];
        
        zView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_sView addSubview:zView];
    }
    
    _sView.contentSize=CGSizeMake(0, 3*220+3*10);
    
    _sView.backgroundColor=[UIColor whiteColor];
    
    //取消反弹效果
    _sView.bounces=NO;
    
    //隐藏滚动条
    //    _sView.showsHorizontalScrollIndicator=NO;
    
    
    
    [self.view addSubview:_sView];
}
//购买
-(void)tapGesture:(UITapGestureRecognizer*)tap
{
    UIImageView *img=(UIImageView*)tap.view;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (img.tag==100) {
        NSString *tpimg=_arr[img.tag-100];
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"0";
        [defaults setObject:xz forKey:@"xzdengji"];
    }else if (img.tag==101){
        NSString *tpimg=_arr[img.tag-100];
        
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"1";
        [defaults setObject:xz forKey:@"xzdengji"];
    }else if (img.tag==102){
        NSString *tpimg=_arr[img.tag-100];
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"2";
        [defaults setObject:xz forKey:@"xzdengji"];
    }else if (img.tag==103){
        NSString *tpimg=_arr[img.tag-100];
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"3";
        [defaults setObject:xz forKey:@"xzdengji"];
    }else if (img.tag==104){
        NSString *tpimg=_arr[img.tag-100];
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"4";
        [defaults setObject:xz forKey:@"xzdengji"];
    }else{
        NSString *tpimg=_arr[img.tag-100];
        [defaults setObject:tpimg forKey:@"tpimg"];
        NSString *tpName=_arr1[img.tag-100];
        [defaults setObject:tpName forKey:@"tpName"];
        NSString *tpJiage=_arr2[img.tag-100];
        [defaults setObject:tpJiage forKey:@"tpJiage"];
        NSString *xz=@"5";
        [defaults setObject:xz forKey:@"xzdengji"];
    }
    
    WuPinXiangQingViewController *wpxq=[[WuPinXiangQingViewController alloc]init];
    [self.navigationController pushViewController:wpxq animated:NO];
    
}

//充值
-(void)btclick:(UIButton*)bt
{
    ChongZhiViewController *cz=[[ChongZhiViewController alloc]init];

    [self.navigationController pushViewController:cz animated:NO];
}

@end
