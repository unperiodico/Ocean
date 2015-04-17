//
//  PostListViewController.h
//  Ocean
//
//  Created by Nick on 15/4/16.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface PostListViewController : UITableViewController
{
    NSMutableArray *_mutArray;
    
    //帖子Id
    NSMutableArray *_tzIdArray;
}
@property(assign,nonatomic)NSInteger pageCount;
@property(strong,nonatomic)NSDictionary *dic;
@end
