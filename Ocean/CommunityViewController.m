//
//  CommunityViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "CommunityViewController.h"
#import "AppDelegate.h"

@interface CommunityViewController ()

@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *roView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SelfView_W, 1)];
    
    [self.view addSubview:roView];
    
    
    
    _sView=[[UIScrollView alloc]init];
    _sView.frame=CGRectMake(0, 64, SelfView_W, SelfView_H/3);
    _sView.delegate=self;
    _sView.backgroundColor=[UIColor redColor];
    _sView.contentSize=CGSizeMake(SelfView_W*8, 0);
    
    [self.view addSubview:_sView];
    
    for (int i=0; i<8; i++) {
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*SelfView_W, 0, SelfView_W, SelfView_H/3)];
        NSString *name=[NSString stringWithFormat:@"demo%d.jpg",i+1];
        
        imageView.image=[UIImage imageNamed:name];
        
        [self.sView addSubview:imageView];
        
        
    }
    
    
    self.sView.delegate=self;
    
    //分页
    self.sView.pagingEnabled=YES;
    
    //隐藏滚动条
    self.sView.showsHorizontalScrollIndicator=NO;
    
    //取消反弹效果
    self.sView.bounces=NO;
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(SelfView_W-55, _sView.frame.size.height+40, 50, 30)];
    
    //pageControl总页数
    _pageControl.numberOfPages=4;
    
    //    _pageControl.currentPageIndicatorTintColor=[UIColor blackColor];//选中点颜色
    //    _pageControl.pageIndicatorTintColor=[UIColor grayColor];//默认颜色
    
    [self.view addSubview:_pageControl];
    
    [self addTimer];
    
    
    [self anniu];

    
}


-(void)anniu
{
    
    
    for (int i=0; i<6; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor=[UIColor whiteColor];
        btn.layer.cornerRadius=10;
        btn.clipsToBounds=YES;
        //点击方法
        [btn addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=i+1;
        if (i<3) {
            btn.frame=CGRectMake((SelfView_W-10)/3*i+(i+1)*5, _sView.frame.origin.y+_sView.frame.size.height+5, (SelfView_W-20)/3-5, (SelfView_W-20)/3-5);
        }else{
            btn.frame=CGRectMake((SelfView_W-10)/3*(i-3)+(i-2)*5, _sView.frame.origin.y+_sView.frame.size.height+5+((SelfView_W-20)/3-5)+10, (SelfView_W-20)/3-5, (SelfView_W-20)/3-5);
        }
        NSArray *arr=@[@"学生",@"教师",@"公众",@"开发者",@"商家",@"公告"];
        UIImageView *imView=[[UIImageView alloc]init];
        imView.frame=CGRectMake(20, 5, btn.frame.size.width-40, btn.frame.size.width-40);
        imView.image=[UIImage imageNamed:arr[i]];
        imView.layer.cornerRadius=imView.frame.size.width/2;
        imView.clipsToBounds=YES;
        
        [btn addSubview:imView];
        
        
        UILabel *label=[[UILabel alloc]init];
        label.frame=CGRectMake(0, imView.frame.size.height+5, btn.frame.size.width, btn.frame.size.height-imView.frame.size.height-5);
        label.text=arr[i];
        label.textColor=[UIColor purpleColor];
        label.textAlignment=NSTextAlignmentCenter;
        [btn addSubview:label];
        
        [self.view addSubview:btn];
    }
    
    
}

//进入帖子的方法
-(void)btClick:(UIButton*)btn
{
//    TieZiViewController *tz=[[TieZiViewController alloc]init];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:tz];
//    if (btn.tag==1) {
//        tz.titleText=@"学生";
//        tz.userId=@"11";
//    }else if (btn.tag==2){
//        tz.titleText=@"教师";
//        tz.userId=@"2";
//    }else if (btn.tag==3){
//        tz.titleText=@"公众";
//        tz.userId=@"7";
//    }else if (btn.tag==4){
//        tz.titleText=@"开发者";
//        tz.userId=@"8";
//    }else if (btn.tag==5){
//        tz.titleText=@"商家";
//        
//    }else if (btn.tag==6){
//        tz.titleText=@"公告";
//        tz.userId=@"5";
//    }
//    [self presentViewController:nav animated:YES completion:^{
//        
//    }];
}

//添加定时器
-(void)addTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    
}

//移除定时器
-(void)removeTimer
{
    //停止定时器（一旦定时器停止了，就不能在使用）
    [self.timer invalidate];
    self.timer=nil;
}


-(void)nextImage
{
    NSInteger page=0;
    if (self.pageControl.currentPage==3) {
        page=0;
    }else{
        page=self.pageControl.currentPage+1;
    }
    
    CGFloat offsetX=page *self.sView.frame.size.width;
    CGPoint offset=CGPointMake(offsetX, 0);
    //animated  是否需要动画
    [self.sView setContentOffset:offset animated:YES];
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

//开始拖拽的时候调用的方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    //停止定时器（一旦定时器停止了，就不能在使用）
    //    [self.timer invalidate];
    //    self.timer=nil;
    [self removeTimer];
    
}

//停止拖拽的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开启定时器
    [self addTimer];
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

@end
