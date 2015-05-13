//
//  ShangChengViewController.m
//  Ocean
//
//  Created by Nick on 15/5/12.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "ShangChengViewController.h"
#import "UIDefine.h"
@interface ShangChengViewController ()<UIScrollViewDelegate>
{
    NSInteger _js;
}
@property(strong,nonatomic)UIScrollView *sView;


@end

@implementation ShangChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _js=1;
    
    _sView=[[UIScrollView alloc]init];
    _sView.frame=CGRectMake(0, 3, SelfView_W, SelfView_H);
    _sView.delegate=self;
    
    for (int i=0; i<11; i++) {
        UIView *zView=[[UIView alloc]init];
        UILabel *name=[[UILabel alloc]init];
        name.frame=CGRectMake(0, 120, 50, 30);
        name.text=@"花";
        UILabel *jiage=[[UILabel alloc]init];
        jiage.frame=CGRectMake((SelfView_W-30)/2-50, 120, 50, 30);
        jiage.text=@"4元";
        UIImageView *imgView=[[UIImageView alloc]init];
        imgView.frame=CGRectMake(0, 0, (SelfView_W-30)/2, 120);
        imgView.image=[UIImage imageNamed:@"hua.jpg"];
        if (i%2==0) {
            zView.frame=CGRectMake(10, 150*(i/2)+10*(i/2), (SelfView_W-30)/2, 150);
        }else{
            zView.frame=CGRectMake((SelfView_W-30)/2+20, 150*((i-1)/2)+10*((i-1)/2), (SelfView_W-30)/2, 150);
            _js++;
        }
        [zView addSubview:imgView];
        [zView addSubview:name];
        [zView addSubview:jiage];
    
        zView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_sView addSubview:zView];
    }

    _sView.contentSize=CGSizeMake(0, _js*150+_js*10);
    
    _sView.backgroundColor=[UIColor whiteColor];
    
    //取消反弹效果
    _sView.bounces=NO;
    
    //隐藏滚动条
//    _sView.showsHorizontalScrollIndicator=NO;
    
    
    [self.view addSubview:_sView];
    
}



@end
