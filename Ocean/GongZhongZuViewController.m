//
//  GongZhongZuViewController.m
//  Ocean
//
//  Created by 爱海洋 on 15/6/1.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "GongZhongZuViewController.h"
#import "UIDefine.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "PaiHangCell.h"
@interface GongZhongZuViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(strong,nonatomic)NSArray *arr;

@property(strong,nonatomic)UIActivityIndicatorView *activity;


@end

@implementation GongZhongZuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    //创建Activity控件对象
    _activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activity.frame=CGRectMake((SelfView_W-50)/2, SelfView_H/3, 50, 50);
    
    //    activity.tag=1;
    
    //启动动画
    [_activity startAnimating];
    
    [self.view addSubview:_activity];
    
    _tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SelfView_W, SelfView_H-165)];
    
    _tbView.delegate=self;
    _tbView.dataSource=self;
    _tbView.hidden=YES;
    //    //隐藏分割线
    //    _tbView.separatorStyle=NO;
    
    [self.view addSubview:_tbView];
    
    //注册cell的nib文件
    UINib *nib=[UINib nibWithNibName:@"PaiHangCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:@"str"];
    
    [self jiexi];
    
    
    
}

-(void)jiexi
{
    NSString *body=@"http://ahy.cz5u.com/HaiYangBBSService.asmx/GetOneList";
    
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger GET:body parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",_arr);
        //        _dic=(NSDictionary *)arr[0];
        //        NSLog(@"%@",_dic);
        //
        //        NSLog(@"123456==:%@",[_dic objectForKey:@"Counts"]);
        
        [_tbView reloadData];
        _tbView.hidden=NO;
        [_activity stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaiHangCell *cell=[tableView dequeueReusableCellWithIdentifier:@"str"];
    
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    NSDictionary *dic=_arr[indexPath.row];
    
    cell.mingci.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"Place"]];
    
    if (![[dic objectForKey:@"UserNickName"] isKindOfClass:[NSNull class]]) {
        cell.name.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"UserNickName"]];
    }else{
        cell.name.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"UserName"]];;
    }
    
    cell.fenshu.text=[NSString stringWithFormat:@"%@分",[dic objectForKey:@"Counts"]];
    
    NSString *str=[NSString stringWithFormat:@"http://ahy.cz5u.com/HeadImage/upload/2_%@",[dic objectForKey:@"HeadImage"]];
    
    NSURL *url=[NSURL URLWithString:str];
    
    [cell.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"占位头像"]];
    
    
    
    
    
    return cell;
    
}

@end
