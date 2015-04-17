//
//  ZhuCeViewController.h
//  Aihaiyang
//
//  Created by 爱海洋 on 15/1/14.
//  Copyright (c) 2015年 爱海洋. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShouJiViewController.h"


//注册页面
@interface ZhuCeViewController : UIViewController<UIAlertViewDelegate>
{
    //加载数据
    NSMutableData *_mutData;
    NSArray *_array;
}
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *elmil;
@property (weak, nonatomic) IBOutlet UIButton *tiJiao;
@property (weak, nonatomic) IBOutlet UIButton *sjzc;




//提交
- (IBAction)tiJiao:(id)sender;
//手机注册
- (IBAction)sjzc:(id)sender;



@end
