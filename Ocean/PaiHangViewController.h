//
//  PaiHangViewController.h
//  Ocean
//
//  Created by 爱海洋 on 15/6/1.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSegmentedControl.h"
#import "ZongBangViewController.h"
#import "XiaoXueZuViewController.h"
#import "ZhongXueZuViewController.h"
#import "DaXueZuViewController.h"
#import "GongZhongZuViewController.h"
@interface PaiHangViewController : UIViewController
{
    ZongBangViewController *_zongbang;
    XiaoXueZuViewController *_xiaoxuezu;
    ZhongXueZuViewController *_zhongxuezu;
    DaXueZuViewController *_daxuezu;
    GongZhongZuViewController *_gongzhongzu;
}
@end
