//
//  MenuViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "UserViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "NavigationController.h"



#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboApi.h"
#import "WeiboSDK.h"
#import <RennSDK/RennSDK.h>

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    
    [self.tableView reloadData];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        //tableView上方的空间
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 230.0f)];
        //头像图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(88, 40, 100, 100)];
        //如果需要自适应
//        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        NSURL *url=[NSURL URLWithString:[defaults objectForKey:@"touxiang"]];
        NSLog(@"%@",url);
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"占位头像"]];
        
        
//        imageView.image = [UIImage imageNamed:@"avatar.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        //头像按钮
        UIButton *avatarButton = [[UIButton alloc]initWithFrame:CGRectMake(68, 30, 138, 153)];

//        [avatarButton setBackgroundColor:[UIColor blackColor]];
        [avatarButton addTarget:self action:@selector(avatarButtonAction:) forControlEvents:UIControlEventTouchUpInside];

        //vip
        UIImageView *vip=[[UIImageView alloc]initWithFrame:CGRectMake(125, 145, 24, 24)];
        vip.image=[UIImage imageNamed:@"vip"];
        
        [view addSubview:vip];
        
        
        //用户名
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(58, 175, 160, 24)];

        NSString *name=[defaults objectForKey:@"zhmName"];
        NSLog(@"%@",name);
        
        label.text = name;
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        //刚好容纳文字
//        [label sizeToFit];

        UIImageView *qian=[[UIImageView alloc]initWithFrame:CGRectMake(95, 205, 20, 20)];
        qian.image=[UIImage imageNamed:@"qian"];
        
        [view addSubview:qian];
        
        UILabel *haibi=[[UILabel alloc]initWithFrame:CGRectMake(115, 205, 160, 20)];
        haibi.text=@"231243";
        haibi.font=[UIFont boldSystemFontOfSize:13];
        
        
        
        [view addSubview:haibi];
        
        [view addSubview:imageView];
        [view addSubview:label];
        [view addSubview:avatarButton];
        
        view;
    });
}

-(void)avatarButtonAction:(UIButton *)sender{
    
//    [self performSegueWithIdentifier:@"toUserController" sender:self];
    
}


#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
//  //如果要在header中添加内容
//    if (sectionIndex == 0)
//        return nil;
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
//    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
//    label.text = @"     －－－－－－－－－－－－－－";
//    label.font = [UIFont systemFontOfSize:15];
//    label.textColor = [UIColor whiteColor];
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    [view addSubview:label];
//    
//    return view;
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 0;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == ([self numberOfSectionsInTableView:tableView]-1)){
        return [UIView new];
    }
    return nil;
}

//编辑菜单
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"toUserController" sender:self];

    } else if(indexPath.section == 0 && indexPath.row == 4){
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//        [defaults setObject:nil forKey:@"UserID"];
        [defaults removeObjectForKey:@"UserID"];
        [self performSegueWithIdentifier:@"logout" sender:self];

    }

    else if(indexPath.section == 0 && indexPath.row == 3){

   
        [self performSegueWithIdentifier:@"toGY" sender:self];
    
}
    
    
    else if(indexPath.section == 0 && indexPath.row == 2){
        
        
        
        
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"icon521" ofType:@"png"];
        
        //构造分享内容
        id<ISSContent> publishContent = [ShareSDK content:@"娱乐竞赛，玩手游、学知识，爱海洋，尽在海洋知识大赛，赶快来参加吧"
                                           defaultContent:@"测试一下"
                                                    image:[ShareSDK imageWithPath:imagePath]
                                                    title:@"海洋知识竞赛"
                                                      url:@"http://ahy.cz5u.com/HaiYangAPP.aspx"
                                              description:@""
                                                mediaType:SSPublishContentMediaTypeNews];
        //创建弹出菜单容器
        id<ISSContainer> container = [ShareSDK container];
        [container setIPadContainerWithView:self.view arrowDirect:UIPopoverArrowDirectionUp];
        
        //弹出分享菜单
        [ShareSDK showShareActionSheet:container
                             shareList:nil
                               content:publishContent
                         statusBarTips:YES
                           authOptions:nil
                          shareOptions:nil
                                result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                    
                                    if (state == SSResponseStateSuccess)
                                    {
                                        NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                                    }
                                    else if (state == SSResponseStateFail)
                                    {
                                        NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                    }
                                }];
        
        
    }
    
    else if(indexPath.section == 0 && indexPath.row == 1){
        
        
        [self performSegueWithIdentifier:@"toShangCheng" sender:self];
        
    }


    [self.frostedViewController hideMenuViewController];
}



#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"                      用户",@"                      商城",@"                      分享", @"                      关于", @"                   退出登录"];
        cell.textLabel.text = titles[indexPath.row];
    } else {
        NSArray *titles = @[@"                   关于我们", @"                      设置", @"                   退出登录"];
        cell.textLabel.text = titles[indexPath.row];
        
        
    }
    
    return cell;
}

@end