//
//  JiNianGuanViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/5/25.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "JiNianGuanViewController.h"
#import "UIDefine.h"
@interface JiNianGuanViewController ()<UIScrollViewDelegate>

@property(strong,nonatomic)UIScrollView *sView;

@end

@implementation JiNianGuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];

    self.navigationItem.title=@"商城";
    UIView *czView=[[UIView alloc]init];
    czView.frame=CGRectMake(0, 64, SelfView_W, 40);
    
    czView.backgroundColor=[UIColor whiteColor];
    
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
    _sView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    NSArray *arr=@[@"g0.png",@"g1.png",@"g2.png",@"g3.png",@"g4.png",@"g5.png",@"g6.png",@"g7.png",@"g8.png",@"g9.png",@"g10.png",@"g11.png",@"g12.png",@"g13.png",@"g14.png",@"g15.png",@"g16.png",@"g17.png",@"g18.png",@"g19.png",@"g20.png",@"g21.png",@"g22.png"];
    NSArray *arr1=@[@"金赞",@"牛人证书",@"贝壳",@"红玫瑰",@"香吻",@"冰淇淋",@"棒棒糖",@"可爱熊",@"手表",@"女神",@"金玫瑰",@"超级明星",@"豪宅",@"海洋手链",@"海洋之心耳钉",@"海洋之心项链",@"戒指",@"apple watch",@"iPhone6 plus",@"战斗机",@"豪华快艇",@"蛟龙号",@"宝马敞篷车",];
    NSArray *arr2=@[@"1",@"5",@"20",@"50",@"80",@"100",@"150",@"150",@"180",@"180",@"220",@"220",@"220",@"250",@"250",@"250",@"300",@"500",@"800",@"1000",@"1200",@"1200",@"2000"];
    for (int i=0; i<23; i++) {
        UIView *zView=[[UIView alloc]init];
        UILabel *name=[[UILabel alloc]init];
        name.frame=CGRectMake(0, 190, (SelfView_W-30)/2, 30);
        name.text=arr1[i];
        name.textAlignment=NSTextAlignmentCenter;
        UILabel *jiage=[[UILabel alloc]init];
        jiage.frame=CGRectMake(0, 170, (SelfView_W-30)/2, 30);
        jiage.text=arr2[i];
        jiage.textAlignment=NSTextAlignmentCenter;
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, 0, (SelfView_W-30)/2, 170);
        imgView.image=[UIImage imageNamed:arr[i]];
        if (i%2==0) {
            zView.frame=CGRectMake(10, 220*(i/2)+10*(i/2), (SelfView_W-30)/2, 220);
        }else{
            zView.frame=CGRectMake((SelfView_W-30)/2+20, 220*((i-1)/2)+10*((i-1)/2), (SelfView_W-30)/2, 220);
            
        }
        [zView addSubview:imgView];
        [zView addSubview:name];
        [zView addSubview:jiage];
        
        zView.backgroundColor=[UIColor whiteColor];
        [_sView addSubview:zView];
    }
    
    _sView.contentSize=CGSizeMake(0, 12*220+12*10);
    
    _sView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    //取消反弹效果
    _sView.bounces=NO;
    
    //隐藏滚动条
    //    _sView.showsHorizontalScrollIndicator=NO;
    
    
    
    [self.view addSubview:_sView];
    
    
}

-(void)btclick:(UIButton*)bt
{
    
}

@end
