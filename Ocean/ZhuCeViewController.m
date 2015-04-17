//
//  ZhuCeViewController.m
//  Aihaiyang
//
//  Created by 爱海洋 on 15/1/14.
//  Copyright (c) 2015年 爱海洋. All rights reserved.
//

#import "ZhuCeViewController.h"


@interface ZhuCeViewController ()

@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mutData =[[NSMutableData alloc]init];
    _array=[[NSArray alloc]init];
    
    
    self.navigationItem.title=@"新用户注册";
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor yellowColor]];
    
    UIBarButtonItem *fh=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(barBtClick:)];
    self.navigationItem.leftBarButtonItem=fh;
    
    
    //文本框占位信息
    _elmil.placeholder=@"用户名 (4-12位字母与数字组合)";
    _password.placeholder=@"密码 (6-16位字母与数字组合)";
    _pass.placeholder=@"确认密码";
    
    //保密样式
    _password.secureTextEntry=YES;
    _pass.secureTextEntry=YES;
    
    
    _tiJiao.layer.cornerRadius=5;
    _sjzc.layer.cornerRadius=5;
    
}

-(void)barBtClick:(UIBarButtonItem *)bt
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//提交注册信息
- (IBAction)tiJiao:(id)sender
{
    
//    NSString *regex = @"[a-z][A-Z][0-9]";
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    
//    if ([predicate evaluateWithObject:_elmil.text] == YES) {
//        NSLog(@"asddassff");
//    }
    
    if (_elmil.text.length>=4) {
        
        if([_password.text isEqualToString:_pass.text]){
            
            
            NSString *body=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserRegister?type=EM&emailOrPhone=%@&userPass=%@",self.elmil.text,self.password.text];
            
            
            AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
            openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
            [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSString *str=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSLog(@"%@",str);
                //NSRange range=[str rangeOfString:@"true"];
                if ([str rangeOfString:@"true"].location!=NSNotFound) {
                    
                    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"注册成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                    
                    alertView.delegate=self;
                    [alertView show];
                    
                    
                }else if ([str rangeOfString:@"exists"].location != NSNotFound){
                    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"用户已存在" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                    [alertView show];
                }else if ([str rangeOfString:@"false"].location != NSNotFound){
                    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"注册失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                    [alertView show];
                }

                
                
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];

            
        
        }else{
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"两次密码不一致" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            
            [alertView show];
        }
    
    }else{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"账号格式不正确" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [alertView show];
    }

}

//手机注册
- (IBAction)sjzc:(id)sender
{
    ShouJiViewController *sj=[[ShouJiViewController alloc]init];
    [self.navigationController pushViewController:sj animated:NO];
}


-(void)requestFinished:(NSData *)requestData
{
    
    NSString *str=[[NSString alloc]initWithData:requestData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    //NSRange range=[str rangeOfString:@"true"];
    if ([str rangeOfString:@"true"].location!=NSNotFound) {
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"注册成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        alertView.delegate=self;
        [alertView show];
        
        
    }else if ([str rangeOfString:@"exists"].location != NSNotFound){
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"用户已存在" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }else if ([str rangeOfString:@"false"].location != NSNotFound){
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"注册失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }
    
    
    
}

-(void)requestFailed:(NSError *)error
{
    NSLog(@"%@",error);
}

//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
       
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}


@end
