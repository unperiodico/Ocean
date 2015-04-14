//
//  CommunityViewController.h
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "UIDefine.h"
@interface CommunityViewController : UIViewController<UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *sView;
@property(strong,nonatomic) UIPageControl *pageControl;
//定时器
@property(strong,nonatomic)NSTimer *timer;


- (IBAction)showMenu;

@end
