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


@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        //tableView上方的空间
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        //头像图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(88, 40, 100, 100)];
        //如果需要自适应
//        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        NSURL *url=[NSURL URLWithString:[defaults objectForKey:@"touxiang"]];
        
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

        //用户名
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(58, 150, 160, 24)];

        NSString *name=[defaults objectForKey:@"zhmName"];
        
        label.text = name;
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        //刚好容纳文字
//        [label sizeToFit];

        
        [view addSubview:imageView];
        [view addSubview:label];
        [view addSubview:avatarButton];
        
        view;
    });
}

-(void)avatarButtonAction:(UIButton *)sender{
    
    [self performSegueWithIdentifier:@"toUserController" sender:self];
    
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

    } else if(indexPath.section == 1 && indexPath.row == 2){
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:nil forKey:@"UserID"];
        [self performSegueWithIdentifier:@"logout" sender:self];

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"                      充值", @"                      分享", @"                   帮助反馈"];
        cell.textLabel.text = titles[indexPath.row];
    } else {
        NSArray *titles = @[@"                   关于我们", @"                      设置", @"                   退出登录"];
        cell.textLabel.text = titles[indexPath.row];
        
        
    }
    
    return cell;
}

@end