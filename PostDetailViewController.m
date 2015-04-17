//
//  PostDetailViewController.m
//  Ocean
//
//  Created by Nick on 15/4/16.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "PostDetailViewController.h"

@interface PostDetailViewController ()

@end

@implementation PostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"详情页";
    
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *tzid=[defaults objectForKey:@"tzxqID"];
    
    
    
    NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/PostDetails?articleID=%@",tzid];
    
    self.url=url;
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",arr);
        
        NSDictionary *dic=(NSDictionary*)arr[0];
       
            
        
        UILabel *title=[[UILabel alloc]init];
        title.frame=CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 60);
        NSString *titName=[dic objectForKey:@"ArticleTitle"];
        //    NSString *titName=@"你好，这是UILabel的自动换行测试内容，主要实现多行数据的自动换行，自适应不同行数的数据";
        title.text=titName;
        title.font=[UIFont systemFontOfSize:15];
        CGSize labelSize = {0, 0};
        labelSize =[titName sizeWithFont:[UIFont systemFontOfSize:15]
                       constrainedToSize:CGSizeMake(200.0, 5000)
                           lineBreakMode:UILineBreakModeWordWrap];
        
        
        title.numberOfLines = 0;//表示label可以多行显示
        
        title.lineBreakMode = UILineBreakModeCharacterWrap;//换行模式，与上面的计算保持一致。
        
        title.frame = CGRectMake(title.frame.origin.x, title.frame.origin.y, title.frame.size.width, labelSize.height);//保持原来Label的位置和宽度，只是改变高度。
        
        title.textAlignment=NSTextAlignmentCenter;
        
        [self.view addSubview:title];
        
        UILabel *name=[[UILabel alloc]init];
        name.frame=CGRectMake(0, title.frame.origin.y+title.frame.size.height, [UIScreen mainScreen].bounds.size.width/2-15, 30);
        name.font=[UIFont systemFontOfSize:15];
        name.textAlignment=NSTextAlignmentRight;
        
        if (![[dic objectForKey:@"UserNickName"] isKindOfClass:[NSNull class]]){
            name.text=[dic objectForKey:@"UserNickName"];
            //        NSLog(@"123456==:%@",[dic objectForKey:@"UserNickName"]);
        }else{
            name.text=[dic objectForKey:@"UserName"];
            //NSLog(@"qweasd==:%@",[diction objectForKey:@"UserNickName"]);
        }
        
        [self.view addSubview:name];
        
        UILabel *riqi=[[UILabel alloc]init];
        riqi.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2+5, title.frame.origin.y+title.frame.size.height, [UIScreen mainScreen].bounds.size.width/2-3, 30);
        riqi.font=[UIFont systemFontOfSize:15];
        riqi.textAlignment=NSTextAlignmentLeft;
        
        riqi.text=[[dic objectForKey:@"Column1"] substringToIndex:10];
        
        [self.view addSubview:riqi];
        
        UILabel *ht=[[UILabel alloc]init];
        ht.frame=CGRectMake(0, name.frame.origin.y+name.frame.size.height, [UIScreen mainScreen].bounds.size.width, 1);
        ht.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.view addSubview:ht];
        
        UIWebView *webView=[[UIWebView alloc]init];
        
        
        NSString *str=[dic objectForKey:@"ArticleContent"];
        NSURL *url=[NSURL URLWithString:self.url];
        
        [webView loadHTMLString:str baseURL:url];
        webView.scalesPageToFit=YES;
        
        webView.frame=CGRectMake(0, ht.frame.origin.y+ht.frame.size.height, SelfView_W, SelfView_H-(ht.frame.origin.y+ht.frame.size.height)-50);//0 100
        
        
        
        [self.view addSubview:webView];

        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
