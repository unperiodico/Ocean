//
//  GameViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "GameViewController.h"
#import "AppDelegate.h"
#import "PaiHangViewController.h"
@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SelfView_W, SelfView_H+35) style:UITableViewStyleGrouped];
    
    _tbView.delegate=self;
    _tbView.dataSource=self;
    
    [self.view addSubview:_tbView];
    
    //注册cell
    UINib *nib=[UINib nibWithNibName:@"YouXiCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    UIBarButtonItem *barBt=[[UIBarButtonItem alloc]initWithTitle:@"排行" style:UIBarButtonItemStylePlain target:self action:@selector(paihangClick:)];
    
    [barBt setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem=barBt;
    
}


//排行
-(void)paihangClick:(UIBarButtonItem*)bt
{
    PaiHangViewController *ph=[[PaiHangViewController alloc]init];
    [self.navigationController pushViewController:ph animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    appDelegate.tabbarLastTimeSelectedIndex =self.tabBarController.selectedIndex;

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YouXiCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.name.text=@"获奖感言";
    [cell.name setTextColor:[UIColor darkGrayColor]];
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    [@"张珊",@"刘向东",@"孙丽",@"王磊",@"李雪儿",@"陈志"];
    switch (indexPath.row) {
            

        case 0:

            cell.imgView.image=[UIImage imageNamed:@"张珊.jpg"];
            cell.jianjie.text=@"蛟龙入海，我每天晚上都玩啊。";
            break;
        case 1:
            cell.imgView.image=[UIImage imageNamed:@"刘向东.jpg"];
            cell.jianjie.text=@"我在这次比赛中认识了很多岛屿！";
            
            break;
        case 2:
            cell.imgView.image=[UIImage imageNamed:@"孙丽.jpg"];
            cell.jianjie.text=@"围住海盗王我玩了很久才通关。。";
            break;
        case 3:
            cell.imgView.image=[UIImage imageNamed:@"王磊.jpg"];
            cell.jianjie.text=@"海洋食物链真神奇啊。";
            break;
        case 4:
            cell.imgView.image=[UIImage imageNamed:@"李雪儿.jpg"];
            cell.jianjie.text=@"同桌推荐我玩的，没想到获奖了！真开心！";
            break;
        case 5:
            cell.imgView.image=[UIImage imageNamed:@"陈志.jpg"];
            cell.jianjie.text=@"我比较喜欢蓝海卫视～ 推荐大家试试～";
            break;

    }
    

    
    
    return cell;
    
}

//head 里面的布局
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]init];
    headView.frame=CGRectMake(0, 0, SelfView_W, 175);//150
    
    
    UIImageView *lianjietu=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SelfView_W, 75)];
    
    lianjietu.image=[UIImage imageNamed:@"连接图"];
    
    
    //创建点击手势
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    lianjietu.userInteractionEnabled=YES;
    
    [lianjietu addGestureRecognizer:tapGesture];
    
    [headView addSubview:lianjietu];
    

    
    
    
    
    UIView *gjView=[[UIView alloc]init];
    gjView.backgroundColor=[UIColor whiteColor];
    gjView.frame=CGRectMake(0, 85, SelfView_W, 200);//2  160
    
    
    UILabel *titlabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 50, 20)];
    titlabel.text=@"历届冠军";
    titlabel.font=[UIFont boldSystemFontOfSize:12];
    
    [gjView addSubview:titlabel];
    
    
    NSArray *arr1=@[@"张珊",@"刘向东",@"孙丽",@"王磊",@"李雪儿",@"陈志"];
    NSArray *arr2=@[@"张珊.jpg",@"刘向东.jpg",@"孙丽.jpg",@"王磊.jpg",@"李雪儿.jpg",@"陈志.jpg"];
    for (int i=0; i<6; i++) {
        UIImageView *imgView=[[UIImageView alloc]init];
        UILabel *lbName=[[UILabel alloc]init];
        if (i>2) {
            //img.frame=CGRectMake((SelfView_W/4-40)/2*(i-7)+(i-8)*(40+(SelfView_W/4-40)/2), 70, 40, 40);
            imgView.frame=CGRectMake((SelfView_W/3-60)/2*(i-2)+(i-3)*(60+(SelfView_W/3-60)/2), 115, 60, 60);
            
            lbName.frame=CGRectMake(SelfView_W/3*(i-3), 175, SelfView_W/3, 20);
            
            
        }else{
            
            imgView.frame=CGRectMake((SelfView_W/3-60)/2*(i+1)+i*(60+(SelfView_W/3-60)/2), 30, 60, 60);
            
            lbName.frame=CGRectMake(SelfView_W/3*i, 90, SelfView_W/3, 20);
            lbName.text=@"王大锤";
        }
        
        lbName.text=arr1[i];
        lbName.textAlignment=NSTextAlignmentCenter;
        lbName.font=[UIFont systemFontOfSize:13];
        [gjView addSubview:lbName];
        
        imgView.image=[UIImage imageNamed:arr2[i]];

        
        //允许用户交互
        imgView.userInteractionEnabled=YES;
        [gjView addSubview:imgView];
        
        
        //创建点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture1:)];
        
        [imgView addGestureRecognizer:tapGesture];
    }
    
    [headView addSubview:gjView];
    
    return headView;
    
}

//head的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 295;//370
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



#pragma - mark 代理方法

//当scrollerView正在滚动是调用的方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat scrollW=scrollView.frame.size.width;
    //    int page=scrollView.contentOffset.x / scrollW;
    int page=(scrollView.contentOffset.x + scrollW*0.5) / scrollW;
    
    self.pageControl.currentPage=page;
    
    
}

//进入游戏下载
-(void)tapGesture:(UITapGestureRecognizer*)tap
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ocean.cz5u.com"]];
}
//冠军简介
-(void)tapGesture1:(UITapGestureRecognizer*)tap
{
    NSLog(@"冠军简介");
}



@end
