//
//  UserViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "UserViewController.h"


@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SelfView_W, SelfView_H) style:UITableViewStyleGrouped];
    
    _tbView.delegate=self;
    _tbView.dataSource=self;
    
    [self.view addSubview:_tbView];
    
    UINib *nib=[UINib nibWithNibName:@"MyCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //右侧的箭头
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *arr=@[@"手机",@"昵称",@"修改密码",@"注销登录"];
    cell.imgView.image=[UIImage imageNamed:arr[indexPath.row]];
    cell.name.text=arr[indexPath.row];
    
    
    
    
    return cell;
}



-(void)viewDidAppear:(BOOL)animated{
    [self hideTabBar];
    
}


- (IBAction)rightButton
{

    NSLog(@"right");
 
}

- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}

/*
 - (void)showTabBar
 
 {
 if (self.tabBarController.tabBar.hidden == NO)
 {
 return;
 }
 UIView *contentView;
 if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
 
 contentView = [self.tabBarController.view.subviews objectAtIndex:1];
 
 else
 
 contentView = [self.tabBarController.view.subviews objectAtIndex:0];
 contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
 self.tabBarController.tabBar.hidden = NO;
 
 }
 */



@end