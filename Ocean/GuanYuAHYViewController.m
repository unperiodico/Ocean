//
//  GuanYuAHYViewController.m
//  Aihaiyang
//
//  Created by 爱海洋 on 15/2/6.
//  Copyright (c) 2015年 爱海洋. All rights reserved.
//

#import "GuanYuAHYViewController.h"

@interface GuanYuAHYViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)UITableView *tbView;
@property(copy,nonatomic)NSString *url;


@end

@implementation GuanYuAHYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"关于爱海洋";
    
    
    
    
    //UITableViewStyleGrouped
    _tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    
    _tbView.delegate=self;
    _tbView.dataSource=self;
    
    [self.view addSubview:_tbView];
    
    //注册cell的nib文件
    UINib *nib=[UINib nibWithNibName:@"GyahyCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:@"str"];
    
    
    
    
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GyahyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"str"];
    
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    NSArray *arr=@[@"yhxy",@"jrwm",@"jcxbb"];
    NSArray *arr1=@[@"用户协议",@"加入我们",@"检查新版本"];
    
    
    
    cell.imgView.image=[UIImage imageNamed:arr[indexPath.row]];
    cell.name.text=arr1[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==2) {
        
        
        
        NSString *url=@"http://itunes.apple.com/lookup?id=966484167";//   950920000//966484167
        
        AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
        
        openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
        
        openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
        
        [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
//            NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"33==:%@",arr);
            
            NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"1111111===:%@",diction);
            
            
            NSString *resu=[diction objectForKey:@"resultCount"];
            
            double resultCount=[resu doubleValue];
            
            if (resultCount==0) {
                NSString *titleStr=[NSString stringWithFormat:@"检查更新：海洋知识竞赛"];
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:@"暂无新版本" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                
                
                
                [alert show];
            }else{
                NSDictionary *dic=[diction objectForKey:@"results"][0];
                
                NSString *ysxbb=[dic objectForKey:@"version"];
                _url=[dic objectForKey:@"trackViewUrl"];
                NSLog(@"%@",_url);
                
                NSDictionary *infoDict=[[NSBundle mainBundle] infoDictionary];
                NSString *sss=[infoDict objectForKey:@"CFBundleVersion"];
                NSString *name=[dic objectForKey:@"trackName"];
                
                double doublecurrentversion=[sss doubleValue];
                double doubleUpdateVersion=[ysxbb doubleValue];
                
                
                NSLog(@"%@",[diction objectForKey:@"resultCount"]);
                
                
                if (doublecurrentversion < doubleUpdateVersion) {
                    NSString *titleStr=[NSString stringWithFormat:@"检查更新：%@",name];
                    NSString *messageStr=[NSString stringWithFormat:@"发现新版本（%@），是否升级？",ysxbb];
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:messageStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"升级", nil];
                    
                    alert.tag=10;
                    
                    [alert show];
                    
                }else{
                    NSString *titleStr=[NSString stringWithFormat:@"检查更新：%@",name];
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:@"暂无新版本" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                    
                    
                    
                    [alert show];
                }
                
            }
            
            

           
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];

        
    }
}



-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    
    UIImageView *imView=[[UIImageView alloc]initWithFrame:CGRectMake((view.frame.size.width-100)/2, 15, 100, 100)];
    imView.image=[UIImage imageNamed:@"海洋知识竞赛"];
    [view addSubview:imView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((view.frame.size.width-100)/2, 120, 100, 20)];
    label.text=@"爱海洋社区 1.5";
    label.font=[UIFont boldSystemFontOfSize:13];
    label.textAlignment=NSTextAlignmentCenter;
    [view addSubview:label];
    
    
    return view;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    
    UILabel *youxiang=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 15)];
    youxiang.text=@"邮箱:aihaiyang@qq.com";
    
    youxiang.font=[UIFont italicSystemFontOfSize:10];
    youxiang.textAlignment=NSTextAlignmentCenter;
    [view addSubview:youxiang];
    
    UILabel *weixin=[[UILabel alloc]initWithFrame:CGRectMake(0, 25, [UIScreen mainScreen].bounds.size.width, 15)];
    weixin.text=@"微信公众账号:aihaiyang";
    weixin.font=[UIFont italicSystemFontOfSize:10];
    weixin.textAlignment=NSTextAlignmentCenter;
    [view addSubview:weixin];
    
    
    UILabel *weibo=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 15)];
    weibo.text=@"新浪微博:@爱海洋";
    weibo.font=[UIFont italicSystemFontOfSize:10];
    weibo.textAlignment=NSTextAlignmentCenter;
    [view addSubview:weibo];
    
    
    return view;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}



-(void)requestFinished:(NSData *)requestData
{
    
    NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:requestData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"1111111===:%@",diction);
    
    //NSArray *arr=[dic objectForKey:@"results"];
//    if (![arr count]) {
//        
//    }
//    NSDictionary *dic=[diction objectForKey:@"results"][0];
//    
//    NSString *ysxbb=[dic objectForKey:@"version"];
//    _url=[dic objectForKey:@"trackViewUrl"];
//    NSLog(@"%@",_url);
//    
//    NSDictionary *infoDict=[[NSBundle mainBundle] infoDictionary];
//    NSString *sss=[infoDict objectForKey:@"CFBundleVersion"];
//    NSString *name=[dic objectForKey:@"trackName"];
//    
//    double doublecurrentversion=[sss doubleValue];
//    double doubleUpdateVersion=[ysxbb doubleValue];
//    
//    
//    NSLog(@"%@",[diction objectForKey:@"resultCount"]);
    NSString *resu=[diction objectForKey:@"resultCount"];
    
    double resultCount=[resu doubleValue];
    
    if (resultCount==0) {
        NSString *titleStr=[NSString stringWithFormat:@"检查更新：海洋知识竞赛"];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:@"暂无新版本" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        
        
        
        [alert show];
    }else{
        NSDictionary *dic=[diction objectForKey:@"results"][0];
        
        NSString *ysxbb=[dic objectForKey:@"version"];
        _url=[dic objectForKey:@"trackViewUrl"];
        NSLog(@"%@",_url);
        
        NSDictionary *infoDict=[[NSBundle mainBundle] infoDictionary];
        NSString *sss=[infoDict objectForKey:@"CFBundleVersion"];
        NSString *name=[dic objectForKey:@"trackName"];
        
        double doublecurrentversion=[sss doubleValue];
        double doubleUpdateVersion=[ysxbb doubleValue];
        
        
        NSLog(@"%@",[diction objectForKey:@"resultCount"]);
        
        
        if (doublecurrentversion < doubleUpdateVersion) {
            NSString *titleStr=[NSString stringWithFormat:@"检查更新：%@",name];
            NSString *messageStr=[NSString stringWithFormat:@"发现新版本（%@），是否升级？",ysxbb];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:messageStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"升级", nil];
            
            alert.tag=10;
            
            [alert show];
            
        }else{
            NSString *titleStr=[NSString stringWithFormat:@"检查更新：%@",name];
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:titleStr message:@"暂无新版本" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            
            
            
            [alert show];
        }

    }
    
    
    
}

//alertview回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==10) {
        if (buttonIndex==0) {
           
        }else{
            NSURL *iTunesURL = [NSURL URLWithString:_url];
            NSLog(@"%@",_url);
            [[UIApplication sharedApplication] openURL:iTunesURL];
        }
    }
    
    
}


-(void)requestFailed:(NSError *)error
{
    NSLog(@"%@",error);
}

@end
