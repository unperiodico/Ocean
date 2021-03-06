//
//  LoginViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/4/15.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIColor *selfColor= [UIColor colorWithRed:38/255.0 green:176/255.0 blue:243/255.0 alpha:1];
    
    self.view.backgroundColor=selfColor;
    
    self.navigationItem.title=@"登陆页面";
    
    
    _zhanghao=[[UITextField alloc]initWithFrame:CGRectMake(3, 80, SelfView_W-6, 30)];
    
    _zhanghao.backgroundColor=[UIColor whiteColor];
    _zhanghao.layer.cornerRadius=5;
    _zhanghao.clipsToBounds=YES;
    
    _zhanghao.placeholder=@"请输入账号";
    
    [self.view addSubview:_zhanghao];
    
    _mima=[[UITextField alloc]initWithFrame:CGRectMake(3, 115, SelfView_W-6, 30)];
    
    _mima.backgroundColor=[UIColor whiteColor];
    _mima.layer.cornerRadius=5;
    _mima.clipsToBounds=YES;
    
    //保密样式
    _mima.secureTextEntry=YES;
    
    _mima.placeholder=@"请输入密码";
    
    [self.view addSubview:_mima];
    
    
    UIButton *dlbt=[UIButton buttonWithType:UIButtonTypeSystem];
    dlbt.frame=CGRectMake(3, 155, SelfView_W-6, 30);
    
    [dlbt setTitle:@"登录" forState:UIControlStateNormal];
    dlbt.backgroundColor=[UIColor blueColor];
    [dlbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    dlbt.layer.cornerRadius=5;
    dlbt.clipsToBounds=YES;
    
    [dlbt addTarget:self action:@selector(dengluClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dlbt];
    
    UIButton *kefu=[UIButton buttonWithType:UIButtonTypeSystem];
    
    kefu.frame=CGRectMake(5, 195, 70, 30);
    
    [kefu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [kefu setTitle:@"联系客服" forState:UIControlStateNormal];
    [kefu addTarget:self action:@selector(lxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kefu];
    
    
    UIButton *xinyonghu=[UIButton buttonWithType:UIButtonTypeSystem];
    
    xinyonghu.frame=CGRectMake(SelfView_W-55, 195, 50, 30);
    
    [xinyonghu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [xinyonghu setTitle:@"新用户" forState:UIControlStateNormal];
    
    [xinyonghu addTarget:self action:@selector(xyhClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:xinyonghu];
    
}

//联系客服
-(void)lxClick:(UIButton*)bt
{
    UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"联系客服" message:@"客服电话:010-51438222" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertview show];
}

//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://010-51438222"]];
    }
}

//新用户
-(void)xyhClick:(UIButton*)btn
{
    ZhuCeViewController *zc=[[ZhuCeViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:zc];
    
    [self presentViewController:nav animated:NO completion:nil];
}

//登录
-(void)dengluClick:(UIButton*)btn
{
    
    if ([_zhanghao.text isEqualToString:@""] || [_mima.text isEqualToString:@""]) {
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"用户名或密码不能为空" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertview show];
    }else{
        NSString *strUrl=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserLogin?userName=%@&userPass=%@",self.zhanghao.text,self.mima.text];
        
        AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
        
        openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
        
        openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
        
        [openmanger GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *dic=(NSDictionary *)arr[0];
            NSLog(@"%@",dic);
            
            if ([[dic objectForKey:@"Result"] isEqual:@"true"]) {
                
                //保存账号的ID
                NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                NSString *UID=[dic objectForKey:@"UserId"];
                [defaults setObject:UID forKey:@"UserID"];
                
//                NSString *str=@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelGold?UserId=23750";
                
                NSString *urlstr=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelGold?UserId=%@",UID];
                
                [openmanger GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSArray *arr4=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    
                    NSDictionary *dicti=(NSDictionary*)arr4[0];
                    NSLog(@"%@",dicti);
                    
                    NSString *aaa=[dicti objectForKey:@"Gold"];
                    NSLog(@"111==;%@",aaa);
                    
                   
                    [defaults setObject:aaa forKey:@"jiabi"];
                    
                    
                    NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserInfo?userId=%@",UID];
                    
                    [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        
                        NSArray *arr1=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                        NSLog(@"33==:%@",arr1);
                        NSDictionary *diction=(NSDictionary*)arr1[0];
                        NSString *yhm=[diction objectForKey:@"UserName"];
                        [defaults setObject:yhm forKey:@"yhmName"];
                        NSString *mima=[diction objectForKey:@"UserPass"];
                        [defaults setObject:mima forKey:@"mmPass"];
                        
                        NSString *str=[NSString stringWithFormat:@"http://ahy.cz5u.com/HeadImage/upload/2_%@",[diction objectForKey:@"HeadImage"]];
                        [defaults setObject:str forKey:@"touxiang"];
                        
                        
                        
                        if ([diction objectForKey:@"UserNickName"]==[NSNull null]) {
                            NSString *zhmName=[diction objectForKey:@"UserName"];
                            NSLog(@"%@",zhmName);
                            [defaults setValue:zhmName forKey:@"zhmName"];
                            
                        }else{
                            NSString *xgmName=[diction objectForKey:@"UserNickName"];
                            NSLog(@"%@",xgmName);
                            [defaults setValue:xgmName forKey:@"zhmName"];
                        }
                        
                        NSString *shouji=[diction objectForKey:@"UserPhone"];
                        if ([diction objectForKey:@"UserPhone"] !=[NSNull null]) {
                            [defaults setObject:shouji forKey:@"shouji"];
                        }
                        
                        NSLog(@"%@,%@",yhm,mima);
                        
                        
                        NSString *xzUrl=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelMedalRank?UserId=%@",UID];
                        
                        [openmanger GET:xzUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                            
                            NSArray *xzArr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                            NSLog(@"33==:%@",xzArr);
                            NSDictionary *xzdic=(NSDictionary*)xzArr[0];
                            NSString *xzdj=[xzdic objectForKey:@"MedalRank"];
                            NSLog(@"33==:%@",xzdj);
                            [defaults setObject:xzdj forKey:@"xunzhangdengji"];
                            
                            
                            [self performSegueWithIdentifier:@"loginSuccess" sender:self];

                        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                            
                        }];
                        
                        
                        
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        
                    }];

                    
                    
                    
                    
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                }];

                
                
                
                
                
                
                
                
                
            }else if ([[dic objectForKey:@"Result"] isEqual:@"noUser"]) {
                UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"用户不存在" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                
                [alertview show];
            }else{
                UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"用户名或密码错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                
                [alertview show];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];

    }
    
    
}


@end
