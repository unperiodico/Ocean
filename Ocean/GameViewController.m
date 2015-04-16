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
    headView.frame=CGRectMake(0, 0, SelfView_W, 175);//150
    _sView=[[UIScrollView alloc]init];
    _sView.delegate=self;
    
    _sView.frame=CGRectMake(0, 0, SelfView_W, 75);//150
    
    _sView.contentSize=CGSizeMake(SelfView_W*2, 0);
    
    _sView.backgroundColor=[UIColor whiteColor];
    
    //分页
    _sView.pagingEnabled=YES;
    
    //取消反弹效果
    _sView.bounces=NO;
    
    //隐藏滚动条
    _sView.showsHorizontalScrollIndicator=NO;
    
    
    [headView addSubview:_sView];
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake((SelfView_W-20)/2, 60, 30, 20)];//2  130
    
    _pageControl.numberOfPages=2;
    _pageControl.currentPageIndicatorTintColor=[UIColor blackColor];//选中颜色
    _pageControl.pageIndicatorTintColor=[UIColor grayColor];//默认颜色
    
    [headView addSubview:_pageControl];
    
    NSArray *arr=@[@"拯救鲸鱼",@"围住海盗王",@"蓝海卫士",@"蛟龙入海",@"冰雪王国",@"认识岛屿",@"大家来挑战"];

    
    for (int i=0; i<arr.count; i++) {
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
        img.tag=i;
        
        [_sView addSubview:label];
        
        //创建点击手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        
        [img addGestureRecognizer:tapGesture];
        
    }
    
    
    UIView *gjView=[[UIView alloc]init];
    gjView.backgroundColor=[UIColor whiteColor];
    gjView.frame=CGRectMake(0, 85, SelfView_W, 200);//2  160
    
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
    UIImageView *imageView = (UIImageView*)[tap view];
    
    NSArray *linkArr=@[@"https://itunes.apple.com/cn/app/zheng-jiu-jing-yu/id981062251?mt=8",
                       @"https://itunes.apple.com/cn/app/wei-zhu-hai-dao-wang/id981068868?mt=8",
                       @"https://itunes.apple.com/cn/app/lan-hai-wei-shi/id980454839?mt=8",
                       @"https://itunes.apple.com/cn/app/jiao-long-ru-hai/id981791615?mt=8",
                       @"https://itunes.apple.com/cn/app/bing-xue-wang-guo/id981047950?mt=8",
                       @"https://itunes.apple.com/cn/app/ren-shi-dao-yu/id981020696?mt=8",
                       @"https://itunes.apple.com/cn/app/da-jia-lai-tiao-zhan/id981036547?mt=8"];
    
    
    switch ((long)imageView.tag) {
        case 0:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[0]]];
            break;
            
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[1]]];
            break;
        case 2:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[2]]];
            break;
        case 3:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[3]]];
            break;
        case 4:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[4]]];
            break;
        case 5:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[5]]];
            break;
        case 6:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[6]]];
            break;
        case 7:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkArr[7]]];
            break;
        default:
            break;
    }
    
}
//冠军简介
-(void)tapGesture1:(UITapGestureRecognizer*)tap
{
    NSLog(@"冠军简介");
}



@end
