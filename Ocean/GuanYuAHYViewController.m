//
//  GuanYuAHYViewController.m
//  Aihaiyang
//
//  Created by 爱海洋 on 15/2/6.
//  Copyright (c) 2015年 爱海洋. All rights reserved.
//

#import "GuanYuAHYViewController.h"

@interface GuanYuAHYViewController ()




@end

@implementation GuanYuAHYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"关于爱海洋";
    
    UIImageView *imView=[[UIImageView alloc]initWithFrame:CGRectMake((SelfView_W-100)/2, 75, 100, 100)];
    imView.image=[UIImage imageNamed:@"海洋知识竞赛"];
    [self.view addSubview:imView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((SelfView_W-100)/2, 180, 100, 20)];
    label.text=@"爱海洋社区 1.5";
    label.font=[UIFont boldSystemFontOfSize:13];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];

    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(5, 205, SelfView_W-10, 145)];
    
    label1.text=@"北京爱海洋文化传播有限公司，成立于2014年12月，主要研发、推广、运营 ，2015年全国海洋知识竞赛手游，全国大中学生海洋知识竞赛（以下简称“竞赛”）至今已成功举办七届。竞赛创办 以来，坚持普及海洋知识、传播海洋文化，引导大中学生树立现代海洋观念，切实提高了广大青少年的海洋意识，在 社会上产生了良好影响。 为深入贯彻党的十八大关于“建设海洋强国”的战略部署和习近平总书记“要进一步关心 海洋、认识海洋、经略海洋”的指示精神，引导青少年学习海洋知识、增强海洋意识，为实现中华民族伟大复兴而奋斗。";
    label1.numberOfLines=10;
    label1.font=[UIFont boldSystemFontOfSize:12];
    
    [self.view addSubview:label1];
    
    UILabel *youxiang=[[UILabel alloc]initWithFrame:CGRectMake(0, 355, SelfView_W, 15)];
    youxiang.text=@"邮箱:aihaiyang@qq.com";
    
    youxiang.font=[UIFont italicSystemFontOfSize:10];
    youxiang.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:youxiang];
    
    
    UILabel *weixin=[[UILabel alloc]initWithFrame:CGRectMake(0, 370, SelfView_W, 15)];
    weixin.text=@"微信公众账号:aihaiyang";
    weixin.font=[UIFont italicSystemFontOfSize:10];
    weixin.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:weixin];
    
    
    
    UILabel *weibo=[[UILabel alloc]initWithFrame:CGRectMake(0, 385, SelfView_W, 15)];
    weibo.text=@"新浪微博:@爱海洋";
    weibo.font=[UIFont italicSystemFontOfSize:10];
    weibo.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:weibo];
    
}



@end
