//
//  WuPinXiangQingViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/5/29.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "WuPinXiangQingViewController.h"
#import "UIDefine.h"
#import "ChongZhiViewController.h"
#import <AFNetworking.h>
@interface WuPinXiangQingViewController ()<UIAlertViewDelegate>

@property(strong,nonatomic)UITextField *shuliang;

@property(strong,nonatomic)UILabel *hblabel;


@end

@implementation WuPinXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"勋章购买";
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *czView=[[UIView alloc]init];
    czView.frame=CGRectMake(0, 64, SelfView_W, 40);
    
    czView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:czView];
    
    _hblabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 260, 30)];
    
    NSString *asdad=[NSString stringWithFormat:@"你的海币余额:%@",[defaults objectForKey:@"jiabi"]];
    _hblabel.text=asdad;
    
    [czView addSubview:_hblabel];
    
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame=CGRectMake(SelfView_W-50, 5, 40, 30);
    bt.layer.cornerRadius=8;
    bt.clipsToBounds=YES;
    [bt setTitle:@"充值" forState:UIControlStateNormal];
    
    [bt setTintColor:[UIColor whiteColor]];
    
    [bt setBackgroundColor:[UIColor blueColor]];
    [bt addTarget:self action:@selector(btclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [czView addSubview:bt];
    
    UIView *xsView=[[UIView alloc]init];
    xsView.frame=CGRectMake(5, 114, SelfView_W-10, 250);
    xsView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:xsView];
    
    UIImageView *img=[[UIImageView alloc]init];
    img.frame=CGRectMake(5, 5, 100, 100);
    NSLog(@"%@",[defaults objectForKey:@"tpimg"]);
    
    img.image=[UIImage imageNamed:[defaults objectForKey:@"tpimg"]];
    
    [xsView addSubview:img];
    UILabel *name=[[UILabel alloc]init];
    name.frame=CGRectMake(110, 5, 150, 30);
    
    name.text=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"tpName"]];
    
    [xsView addSubview:name];
    
    
    UILabel *jiage=[[UILabel alloc]init];
    jiage.frame=CGRectMake(110, 35, 100, 30);
    jiage.text=[NSString stringWithFormat:@"%@海币",[defaults objectForKey:@"tpJiage"]];
    
    [xsView addSubview:jiage];
    
    
//    UILabel *label=[[UILabel alloc]init];
//    label.frame=CGRectMake(5, 130, 60, 30);
//    label.font=[UIFont systemFontOfSize:14];
//    label.layer.cornerRadius=5;
//    label.clipsToBounds=YES;
//    label.text=@"购买数量";
//    label.backgroundColor=[UIColor orangeColor];
//    [xsView addSubview:label];
//    
//    _shuliang=[[UITextField alloc]init];
//    _shuliang.frame=CGRectMake(65, 130, 100, 30);
//    _shuliang.layer.cornerRadius=5;
//    _shuliang.clipsToBounds=YES;
//    _shuliang.text=@"1";
//    _shuliang.backgroundColor=[UIColor whiteColor];
//    [xsView addSubview:_shuliang];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(5, 165, SelfView_W-20, 30);
    [btn setTitle:@"购买" forState:UIControlStateNormal];
    btn.layer.cornerRadius=5;
    btn.clipsToBounds=YES;
    btn.backgroundColor=[UIColor blueColor];
    [btn setTintColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(gmClick:) forControlEvents:UIControlEventTouchUpInside];
    [xsView addSubview:btn];
}

//购买
-(void)gmClick:(UIButton*)bt
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *pdxz=[defaults objectForKey:@"xzdengji"];
    int intpd=[pdxz intValue];
    NSString *uid=[defaults objectForKey:@"UserID"];
    NSString *xzUrl=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelMedalRank?UserId=%@",uid];
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];

    [openmanger GET:xzUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *xzArr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"33==:%@",xzArr);
        NSDictionary *xzdic=(NSDictionary*)xzArr[0];
        NSString *xzdj=[xzdic objectForKey:@"MedalRank"];
        int  intjxdj=[xzdj intValue];
        
        if (intpd>intjxdj) {
            NSString *asdad=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"jiabi"]];
            int haibi=[asdad intValue];
            
            NSString *jiage=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"tpJiage"]];
            int jiag=[jiage intValue];
            //    int shul=[_shuliang.text intValue];
            if (haibi<jiag) {
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"您的海币不足" message:nil delegate:self cancelButtonTitle:@"获取海币" otherButtonTitles:@"取消购买", nil];
                alertView.tag=1;
                [alertView show];
            }else{
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"确认购买" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                
                [alertView show];
            }

        }else{
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"已拥有此勋章" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            [alertView show];
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
    
    
    
    
    
    
}


//充值
-(void)btclick:(UIButton*)bt
{
    ChongZhiViewController *cz=[[ChongZhiViewController alloc]init];
    
    [self.navigationController pushViewController:cz animated:NO];
}

//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (alertView.tag==1) {
        if (buttonIndex==0) {
            ChongZhiViewController *cz=[[ChongZhiViewController alloc]init];
            
            [self.navigationController pushViewController:cz animated:NO];
            
            
        }

    }else{
        if (buttonIndex==0) {
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//            NSString *hbye=[defaults objectForKey:@"jiabi"];
//            int zhaibi=[hbye intValue];
            NSString *xzjiage=[defaults objectForKey:@"tpJiage"];
            int wpjiage=[xzjiage intValue];
//            int shengyu=zhaibi-wpjiage;
//            NSLog(@"%d",shengyu);
            
            NSString *syhb=[NSString stringWithFormat:@"%d",wpjiage];
            
            NSString *uid=[defaults objectForKey:@"UserID"];
            
            NSString *body=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/DelGold?UserId=%@&mun=%@",uid,syhb];
            
            
            AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
            openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
            [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                
                NSDictionary *dic=(NSDictionary *)arr[0];
                NSLog(@"%@",dic);
                
                if ([[dic objectForKey:@"Result"] isEqual:@"true"]) {
                    
                    NSString *urlstr=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelGold?UserId=%@",uid];
                    
                    [openmanger GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        NSArray *arr4=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                        
                        NSDictionary *dicti=(NSDictionary*)arr4[0];
                        NSLog(@"%@",dicti);
                        
                        NSString *aaa=[dicti objectForKey:@"Gold"];
                        NSLog(@"111==;%@",aaa);
                        
                        _hblabel.text=[NSString stringWithFormat:@"你的海币余额:%@",aaa];
                        
                        [defaults setObject:aaa forKey:@"jiabi"];
                        
                        
                        NSString *xzdj=[defaults objectForKey:@"xzdengji"];
                        
                        NSString *xzsc=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/AddMedalRank?UserId=%@&MedalRank=%@",uid,xzdj];
                        
                        [openmanger GET:xzsc parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                            
                            NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                            
                            NSDictionary *dic=(NSDictionary *)arr[0];
                            NSLog(@"%@",dic);
                            
                            if ([[dic objectForKey:@"Result"] isEqual:@"true"]){
                                
                                
                                
                                NSString *xzUrl=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelMedalRank?UserId=%@",uid];
                                
                                [openmanger GET:xzUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    
                                    NSArray *xzArr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                                    NSLog(@"33==:%@",xzArr);
                                    NSDictionary *xzdic=(NSDictionary*)xzArr[0];
                                    NSString *xzdj=[xzdic objectForKey:@"MedalRank"];
                                    NSLog(@"33==:%@",xzdj);
                                    [defaults setObject:xzdj forKey:@"xunzhangdengji"];
                                    
                                    
//                                    [self performSegueWithIdentifier:@"loginSuccess" sender:self];
                                    
                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    
                                }];
                                
                                
                            }
                            
                            
                        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                            
                        }];
                        
                        
                        
                                                
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        
                    }];
                    
                }
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];

            
            
        }
    }
    
}
@end
