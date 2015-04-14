//
//  GameViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "GameViewController.h"
#import "AppDelegate.h"

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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YouXiCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.imgView.image=[UIImage imageNamed:@"王大锤.jpg"];
    cell.jianjie.text=@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    
    
    return cell;
    
}

//head 里面的布局
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]init];
    headView.frame=CGRectMake(0, 0, SelfView_W, 250);
    _sView=[[UIScrollView alloc]init];
    _sView.delegate=self;
    
    _sView.frame=CGRectMake(0, 0, SelfView_W, 150);
    
    _sView.contentSize=CGSizeMake(SelfView_W*2, 0);
    
    _sView.backgroundColor=[UIColor whiteColor];
    
    //分页
    _sView.pagingEnabled=YES;
    
    //取消反弹效果
    _sView.bounces=NO;
    
    //隐藏滚动条
    _sView.showsHorizontalScrollIndicator=NO;
    
    
    [headView addSubview:_sView];
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake((SelfView_W-20)/2, 130, 30, 20)];
    
    _pageControl.numberOfPages=2;
    _pageControl.currentPageIndicatorTintColor=[UIColor blackColor];//选中颜色
    _pageControl.pageIndicatorTintColor=[UIColor grayColor];//默认颜色
    
    [headView addSubview:_pageControl];
    
    NSArray *arr=@[@"拯救鲸鱼",@"围住海盗王",@"蓝海卫士",@"蛟龙入海",@"冰雪王国",@"围住海盗王",@"蓝海卫士",@"蛟龙入海",@"海洋食物链",@"海啸逃生",@"海上丝路",@"大家来挑战",@"认识岛屿",@"海啸逃生",@"海上丝路",@"大家来挑战"];
    
    for (int i=0; i<16; i++) {
        UIImageView *img=[[UIImageView alloc]init];
        
        UILabel *label=[[UILabel alloc]init];
        
        if (i>7) {
            
            img.frame=CGRectMake((SelfView_W/4-40)/2*(i-7)+(i-8)*(40+(SelfView_W/4-40)/2), 70, 40, 40);
            
            label.frame=CGRectMake(SelfView_W/4*(i-8), 108, SelfView_W/4, 30);
            
            
        }else{
            
            img.frame=CGRectMake((SelfView_W/4-40)/2*(i+1)+i*(40+(SelfView_W/4-40)/2), 3, 40, 40);
            
            label.frame=CGRectMake(SelfView_W/4*i, img.frame.size.height, SelfView_W/4, 30);
            
        }
        
        img.tag=i+1;
        img.layer.cornerRadius=img.frame.size.width / 2;
        img.clipsToBounds=YES;
        img.image=[UIImage imageNamed:arr[i]];
        //允许用户交互
        img.userInteractionEnabled=YES;
        
        [_sView addSubview:img];
        
        label.textAlignment=NSTextAlignmentCenter;
        
        label.font=[UIFont systemFontOfSize:13];
        label.text=arr[i];
        
        [_sView addSubview:label];
        
        //创建点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        
        [img addGestureRecognizer:tapGesture];
        
    }
    
    
    UIView *gjView=[[UIView alloc]init];
    gjView.backgroundColor=[UIColor whiteColor];
    gjView.frame=CGRectMake(0, 160, SelfView_W, 200);
    
    NSArray *arr1=@[@"王大锤",@"李时珍",@"孙小喵",@"王大锤",@"李时珍",@"孙小喵"];
    NSArray *arr2=@[@"王大锤.jpg",@"李时珍.jpg",@"孙小喵.jpg",@"王大锤.jpg",@"李时珍.jpg",@"孙小喵.jpg"];
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
    return 370;
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
    NSLog(@"进入游戏下载");
}
//冠军简介
-(void)tapGesture1:(UITapGestureRecognizer*)tap
{
    NSLog(@"冠军简介");
}



@end
