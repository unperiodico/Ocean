//
//  GameViewController.h
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "UIDefine.h"
#import "YouXiCell.h"
@interface GameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tbView;
}


@property(strong,nonatomic)UIScrollView *sView;
@property(strong,nonatomic)UIPageControl *pageControl;

@property(strong,nonatomic)NSTimer *timer;


- (IBAction)showMenu;

@end
