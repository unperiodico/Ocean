//
//  WuPinXiangQingViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/5/29.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "WuPinXiangQingViewController.h"
#import "UIDefine.h"
#import "ChongZhiViewController.h"
@interface WuPinXiangQingViewController ()<UIAlertViewDelegate>

@property(strong,nonatomic)UITextField *shuliang;


@end

@implementation WuPinXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"勋章购买";
    
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
    
    UIView *xsView=[[UIView alloc]init];
    xsView.frame=CGRectMake(5, 114, SelfView_W-10, 400);
    xsView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:xsView];
    
    UIImageView *img=[[UIImageView alloc]init];
    img.frame=CGRectMake(5, 5, 100, 100);
    NSLog(@"%@",[defaults objectForKey:@"tpimg"]);
    
    img.image=[UIImage imageNamed:[defaults objectForKey:@"tpimg"]];
    
    [xsView addSubview:img];
    UILabel *name=[[UILabel alloc]init];
    name.frame=CGRectMake(110, 5, 150, 30);
    
    name.text=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"tpName"]];
    
    [xsView addSubview:name];
    
    
    UILabel *jiage=[[UILabel alloc]init];
    jiage.frame=CGRectMake(110, 35, 100, 30);
    jiage.text=[NSString stringWithFormat:@"%@海币",[defaults objectForKey:@"tpJiage"]];
    
    [xsView addSubview:jiage];
    
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(5, 130, 60, 30);
    label.font=[UIFont systemFontOfSize:14];
    label.layer.cornerRadius=5;
    label.clipsToBounds=YES;
    label.text=@"购买数量";
    label.backgroundColor=[UIColor orangeColor];
    [xsView addSubview:label];
    
    _shuliang=[[UITextField alloc]init];
    _shuliang.frame=CGRectMake(65, 130, 100, 30);
    _shuliang.layer.cornerRadius=5;
    _shuliang.clipsToBounds=YES;
    _shuliang.text=@"1";
    _shuliang.backgroundColor=[UIColor whiteColor];
    [xsView addSubview:_shuliang];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(5, 165, SelfView_W-20, 30);
    [btn setTitle:@"购买" forState:UIControlStateNormal];
    btn.layer.cornerRadius=5;
    btn.clipsToBounds=YES;
    btn.backgroundColor=[UIColor blueColor];
    [btn setTintColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(gmClick:) forControlEvents:UIControlEventTouchUpInside];
    [xsView addSubview:btn];
}

//购买
-(void)gmClick:(UIButton*)bt
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *asdad=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"jiabi"]];
    int haibi=[asdad intValue];
    
    NSString *jiage=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"tpJiage"]];
    int jiag=[jiage intValue];
    int shul=[_shuliang.text intValue];
    if (haibi<(jiag*shul)) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"您的海币不足" message:nil delegate:self cancelButtonTitle:@"获取海币" otherButtonTitles:@"取消购买", nil];
        
        [alertView show];
    }else{
        
    }
    
    
}


//充值
-(void)btclick:(UIButton*)bt
{
    ChongZhiViewController *cz=[[ChongZhiViewController alloc]init];
    
    [self.navigationController pushViewController:cz animated:NO];
}

//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        ChongZhiViewController *cz=[[ChongZhiViewController alloc]init];
        
        [self.navigationController pushViewController:cz animated:NO];
    
    
    }
}
@end
