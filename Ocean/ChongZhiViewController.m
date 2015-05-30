//
//  ChongZhiViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/5/29.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ChongZhiViewController.h"
#import "UIDefine.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"
#import <AFNetworking.h>

#define PartnerID @"2088911502597733"
#define SellerID @"2355394546@qq.com"
#define PartnerPrivKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMgDah6Le79IbcDL26OCSOwkE/cUiAWJOZJYPYCl7//WUEyt8G98B9cniosTdxgwNS7r2XLIJgQNV0Ip2GrIlX/AoQ5iOV9r+YNNIMvjdQf4HZHpV5924A35pF4WIufSCV0XpReEo3orO/wue6r8mrjP8y8yHKbJt672Rw1VFP8bAgMBAAECgYEAmQRTuU6Iu4xTuv266NqRo2buh0aD0YhsLROo6bUJaTaydBdWLFQ9Q1MS4Ndhc3XeGimBUBjjTJJQQWP2F6uhAqJEj/37wv+qfWPTbfOUL+8rkCAoU53Mw0CQ00dB+TFY072lrqES7abOJ/ZTEeUGi1eAeopoCBngUybKwhCPFjECQQD0OkamCMMkb0Vu2iCRYtQOoIgTy+8GIDTn4/VZa0cAAM2qMLS3ohp9PBXcEo5EQ5EHZZD1hzvwm1fq/gOODzGfAkEA0aeKzwLyzAAE9Mn2svXJKTkSeYuMIwPfqM3rj3EiPP3smQVsRgSD6Z3+vwILEDiZivTZYQQ5Iy9enZSKPD+ZBQJAFGFsldxzVG4IsEh5oUhLA/F3iZdiGfPEFnnadpzSLvjiMMqhuhVH+p1yAYx23NF6n9Bk+WhQozKDcrPB3i/8ZwJAL/dXCLmx9v5iI+c5LASTu3y1P12v+Crgtuw14qGNpcqqoO/er75Et+RP7j93bISmjGYsfcfLksM5sG/VmKcsSQJAejDr4GsiEkMSbsDo9l9czX0F0U7ijWcndmMhETf3CBt289BB1QkQfqg3o9f+bBrv1uKDE8q3oL/UgCW5m/BiFw=="
@interface ChongZhiViewController ()<UIAlertViewDelegate>
@property(strong,nonatomic)NSArray *arr;
@property(strong,nonatomic)NSString *str;
@end

@implementation ChongZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.navigationItem.title=@"购买海币";
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(5, 64, 150, 30);
    label.text=@"请选择海币数量";
    [self.view addSubview:label];
    
    _arr=@[@"100",@"500",@"800",@"1000",@"2000",@"5000",];
    for (int i=0; i<6; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        if (i<3) {
            btn.frame=CGRectMake(i*(SelfView_W-20)/3+5*(i+1), 105, (SelfView_W-20)/3, 40);
        }else{
            btn.frame=CGRectMake((i-3)*(SelfView_W-20)/3+5*(i-2), 150, (SelfView_W-20)/3, 40);
        }
        btn.tag=i+1;
        NSString *str=[NSString stringWithFormat:@"%@海币",_arr[i]];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        
        [btn addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
    }
}

-(void)btClick:(UIButton*)bt
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (bt.tag==1) {
        _str=@"1";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }else if (bt.tag==2){
        _str=@"5";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }else if (bt.tag==3){
        _str=@"8";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }else if (bt.tag==4){
        _str=@"10";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }else if (bt.tag==5){
        _str=@"20";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }else{
        _str=@"50";
        NSString *czsl=_arr[bt.tag-1];
        [defaults setObject:czsl forKey:@"chongzhishuliang"];
    }
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"应付金额(元)" message:_str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    
    [alertView show];
}
//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        NSString *partner = PartnerID;
        NSString *seller = SellerID;
        NSString *privateKey = PartnerPrivKey;
        //partner和seller获取失败,提示
        if ([partner length] == 0 ||
            [seller length] == 0 ||
            [privateKey length] == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"缺少partner或者seller或者私钥。"
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
        
        Order *order = [[Order alloc] init];
        order.partner = partner;
        order.seller = seller;
        //订单号生成
        order.tradeNO =[self generateTradeNO];
        
        order.productName= @"2";
        order.productDescription=@"3";
        //价格
//        CGFloat flo = 0.1;
        order.amount = [NSString stringWithFormat:@"%@",_str];
        
        order.notifyURL=@"http://apk.hilzg.com/notify_url.php";
        
        order.paymentType = @"1";
        order.inputCharset = @"utf-8";
        order.itBPay = @"30m";
        order.showUrl = @"m.alipay.com";
        
        NSString *appScheme = @"haiyangzhishijingsai";
        
        
        order.service = @"mobile.securitypay.pay";
        
        NSString *orderSpec = [order description];
        
        
        id<DataSigner> signer = CreateRSADataSigner(privateKey);
        NSString *signedString = [signer signString:orderSpec];
        
        //将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = nil;
        if (signedString != nil) {
            orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                           orderSpec, signedString, @"RSA"];
            [[AlipaySDK defaultService]payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                NSLog(@"reslut = %@",resultDic);
                NSString *sss=[resultDic objectForKey:@"resultStatus"];
                if ([sss isEqualToString:@"9000"]) {
                    NSLog(@"成功");
                    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
                    NSString *UID=[defaults objectForKey:@"UserID"];
                    NSString *sl=[defaults objectForKey:@"chongzhishuliang"];
                    
                    NSString *body=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/AddGold?UserId=%@&mun=%@",UID,sl];
                    
                    
                    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
                    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
                    [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        
                        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                        
                        NSDictionary *dic=(NSDictionary *)arr[0];
                        NSLog(@"%@",dic);
                        
                        if ([[dic objectForKey:@"Result"] isEqual:@"true"]) {
                            
                            NSString *urlstr=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/SelGold?UserId=%@",UID];
                            
                            [openmanger GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                NSArray *arr4=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                                
                                NSDictionary *dicti=(NSDictionary*)arr4[0];
                                NSLog(@"%@",dicti);
                                
                                NSString *aaa=[dicti objectForKey:@"Gold"];
                                NSLog(@"111==;%@",aaa);
                                
                                
                                [defaults setObject:aaa forKey:@"jiabi"];
                                
                                [self performSegueWithIdentifier:@"loginSuccess" sender:self];
                                
                            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                
                            }];
                            
                        }
                        
                        
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        
                    }];
                    
                    
                }else{
                    NSLog(@"失败");
                    
                    
                    
                }
            }];
            
            
        }

    }
}
- (NSString *)generateTradeNO
{
    const int N = 15;
    
    NSString *sourceString = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *result = [[NSMutableString alloc] init] ;
    srand(time(0));
    for (int i = 0; i < N; i++)
    {
        unsigned index = rand() % [sourceString length];
        NSString *s = [sourceString substringWithRange:NSMakeRange(index, 1)];
        [result appendString:s];
    }
    
    NSLog(@"%@",result);
    return result;
}

@end
