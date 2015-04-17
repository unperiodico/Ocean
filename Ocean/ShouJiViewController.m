//
//  ShouJiViewController.m
//  Aihaiyang
//
//  Created by 爱海洋 on 15/4/10.
//  Copyright (c) 2015年 爱海洋. All rights reserved.
//

#import "ShouJiViewController.h"

@interface ShouJiViewController ()<UITextFieldDelegate>


@property(strong,nonatomic)UITextField *zhanghao;
@property(strong,nonatomic)UITextField *yanzhangma;

@property(strong,nonatomic)UIButton *xiayibu;

@property(strong,nonatomic)UITextField *mima;
@property(strong,nonatomic)UITextField *querenmima;

@property(strong,nonatomic)UILabel *tishi;
@property(strong,nonatomic)UILabel *label;
@property(strong,nonatomic)UILabel *label1;
@property(strong,nonatomic)UIButton *tijiao;

@end

@implementation ShouJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationItem.title=@"账号注册";
    
    UIBarButtonItem *fh=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(barBtClick:)];
    self.navigationItem.leftBarButtonItem=fh;
    
    
    UIButton *yzm=[UIButton buttonWithType:UIButtonTypeCustom];
    yzm.frame=CGRectMake(SelfView_W-75, 70, 70, 30);
    [yzm setTitle:@"获取验证码" forState:UIControlStateNormal];
    yzm.titleLabel.font=[UIFont boldSystemFontOfSize:14];
    yzm.layer.cornerRadius=5;
    yzm.backgroundColor=[UIColor blueColor];
    [yzm addTarget:self action:@selector(hqClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yzm];
    
    
    _zhanghao=[[UITextField alloc]initWithFrame:CGRectMake(0, 70, SelfView_W-75, 30)];
    _zhanghao.delegate=self;
    
    _zhanghao.placeholder=@"输入11位手机号";
    [self.view addSubview:_zhanghao];
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(0, 100, SelfView_W-75, 1);
    label.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:label];
    
    _yanzhangma=[[UITextField alloc]initWithFrame:CGRectMake(0, 101, SelfView_W, 30)];
    _yanzhangma.delegate=self;
    
    _yanzhangma.placeholder=@"输入验证码";
    
    [self.view addSubview:_yanzhangma];
    
    UILabel *label1=[[UILabel alloc]init];
    label1.frame=CGRectMake(0, 131, SelfView_W, 1);
    label1.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:label1];
    
    _xiayibu=[UIButton buttonWithType:UIButtonTypeSystem];
    _xiayibu.frame=CGRectMake(5, 137, SelfView_W-10, 30);
    
    _xiayibu.layer.cornerRadius=5;
    _xiayibu.clipsToBounds=YES;
    
    _xiayibu.backgroundColor=[UIColor blueColor];
    [_xiayibu setTitle:@"下一步" forState:UIControlStateNormal];
    [_xiayibu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_xiayibu addTarget:self action:@selector(xybClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_xiayibu];
    
    [self mimabuju];

    
}

-(void)barBtClick:(UIButton*)btn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)mimabuju
{
    _tishi=[[UILabel alloc]init];
    _tishi.frame=CGRectMake(5, 137, 150, 20);
    _tishi.textColor=[UIColor blueColor];
    _tishi.font=[UIFont systemFontOfSize:15];
    _tishi.text=@"请输入以下信息";
    _tishi.hidden=YES;
    
    [self.view addSubview:_tishi];
    
    
    _mima=[[UITextField alloc]initWithFrame:CGRectMake(0, 160, SelfView_W, 30)];
    _mima.placeholder=@"密码";
    _mima.delegate=self;
    _mima.hidden=YES;
    //保密样式
    _mima.secureTextEntry=YES;
    [self.view addSubview:_mima];
    
    
    _label=[[UILabel alloc]init];
    _label.frame=CGRectMake(0, 191, SelfView_W, 1);
    _label.backgroundColor=[UIColor groupTableViewBackgroundColor];
    _label.hidden=YES;
    [self.view addSubview:_label];
    
    _querenmima=[[UITextField alloc]initWithFrame:CGRectMake(0, 191, SelfView_W, 30)];
    _querenmima.placeholder=@"确认密码";
    _querenmima.delegate=self;
    _querenmima.hidden=YES;
    //保密样式
    _querenmima.secureTextEntry=YES;
    [self.view addSubview:_querenmima];
    
    _label1=[[UILabel alloc]init];
    _label1.frame=CGRectMake(0, 221, SelfView_W, 1);
    _label1.hidden=YES;
    _label1.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_label1];
    
    
    _tijiao=[UIButton buttonWithType:UIButtonTypeSystem];
    _tijiao.frame=CGRectMake(5, 230, SelfView_W-10, 30);
    
    _tijiao.hidden=YES;
    _tijiao.layer.cornerRadius=5;
    _tijiao.clipsToBounds=YES;
    
    _tijiao.backgroundColor=[UIColor blueColor];
    [_tijiao setTitle:@"提交" forState:UIControlStateNormal];
    [_tijiao setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_tijiao addTarget:self action:@selector(tjClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tijiao];
    
}

//获取验证码
-(void)hqClick:(UIButton*)btn
{
    
    if ([[_zhanghao.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==11) {
        
        
        NSString *body=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SendPhoneCAPTCHA?phone=%@",_zhanghao.text];
        
        AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
        openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
        [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dic=(NSDictionary*)arr[0];
            
            if ([[dic objectForKey:@"Result"] isEqual:@"errorSendNoPhone"]) {
                UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"手机格式不正确" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                
                [alView show];
            }
            
            if ([[dic objectForKey:@"Result"] isEqual:@"false"]) {
                UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"请输入正确的手机号或密码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                
                [alView show];
            }
            
            if ([[dic objectForKey:@"Result"] isEqual:@"phoneExist"]) {
                UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"用户已存在" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                
                [alView show];
            }

            
            
            
            
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];

        
        
        
    }else{
        UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"请输入11位手机号" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [alView show];
    }
    
}

//下一步
-(void)xybClick:(UIButton*)btn
{
    
    
    NSString *body=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/JudgePhoneCAPTCHA?phone=%@&captcha=%@",_zhanghao.text,_yanzhangma.text];
    
   
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"111==%@",arr);
        NSDictionary *dic=(NSDictionary*)arr[0];
        if ([[dic objectForKey:@"Result"] isEqual:@"true"]) {
            
            _xiayibu.hidden=YES;
            _tishi.hidden=NO;
            _label.hidden=NO;
            _label1.hidden=NO;
            _mima.hidden=NO;
            _querenmima.hidden=NO;
            
            _tijiao.hidden=NO;
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
    
}
//提交
-(void)tjClick:(UIButton*)bt
{
    
    if ([[_mima.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ) {
        
        UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"请输入密码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [alView show];
        
    }else{
        if ([_mima.text isEqualToString:_querenmima.text]){
            
            
            NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserRegister?type=EM&emailOrPhone=%@&userPass=%@",_zhanghao.text,_mima.text];
            
            //            NSString *url=@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserRegister?type=PH&emailOrPhone=13810133832&userPass=111111";
            NSString *ahy= [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@",url);
            //            NSLog(@"%@,%@,%@",_zhanghao.text,_mima.text,ahy);
            
            AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
            openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
            
            [openmanger GET:ahy parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"111==%@",arr);
                NSDictionary *dic=(NSDictionary*)arr[0];
                NSLog(@"222==%@",dic);
                
                if ([[dic objectForKey:@"Result"] isEqual:@"true"]) {
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
            
            
            
        }else{
            UIAlertView *alView=[[UIAlertView alloc]initWithTitle:nil message:@"请输入密码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            
            [alView show];
        }
        
    }
    
}




//隐藏软键盘的方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //取消第一响应者
    //光标在那个控件上，那个控件就是第一响应者
    [textField resignFirstResponder];
    return YES;
}


@end
