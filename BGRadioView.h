//
//  BGRadioView.h
//  Listbingo
//
//  Created by Bishal Ghimire on 5/29/13.
//  Copyright (c) 2013 Bishal Ghimire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGRadioView;

@protocol BGRadioViewDelegate
-(void)radioView:(BGRadioView *)radioView didSelectOption:(int)optionNo fortag:(int)tagNo;
@end

@interface BGRadioView : UIView
<UITableViewDataSource, UITableViewDelegate>

//A variable to keep track of our current option.
@property (assign, nonatomic) int optionNo;

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincompatible-property-type"
//写在这个中间的代码,都不会被编译器提示-Wdeprecated-declarations类型的警告


@property (assign, nonatomic) int tag;
#pragma clang diagnostic pop

// A boolean to keep track of whether list item is editable or not.
// We may wish to just display a list without letting the user select it.
@property (assign) BOOL editable;

// numbers of rows eg - 5 , maybe we want 3  or 10 rows ? Also note the minimum is an assumed 0.
@property (assign, nonatomic) int maxRow;
@property (retain, nonatomic) NSMutableArray *rowItems;

// Variables to keep track of spacing in case our user wants to change it:
// the margin between images, the left margin, and a minimum image size.
@property (assign) int rowHeight;

// Finally a variable to keep track of our delegate.
@property (assign) id <BGRadioViewDelegate> delegate;

@end
