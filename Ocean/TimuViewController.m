//
//  TimuViewController.m
//  Ocean
//
//  Created by Nick on 15/4/17.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "TimuViewController.h"

@interface TimuViewController ()

@end

@implementation TimuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark Radio List Delegate
-(void)radioView:(BGRadioView *)radioView didSelectOption:(int)optionNo fortag:(int)tagNo{
    NSLog(@"Optio No %d List No %d", optionNo, tagNo);
}

//-(void) allocRadioView {
//
//    
//    // Setup 2nd radio list
//    NSMutableArray *sortTypeArray = [[NSMutableArray alloc] init];
//    [sortTypeArray addObject:@"Ascending"];
//    [sortTypeArray addObject:@"Descending"];
//    self.radioViewSortingType.rowItems = sortTypeArray;
//    self.radioViewSortingType.optionNo = 1;
//    self.radioViewSortingType.tag = 2;
//    self.radioViewSortingType.delegate = self;
//    self.radioViewSortingType.maxRow = [sortTypeArray count];
//    self.radioViewSortingType.editable = YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wshorten-64-to-32"

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%lu%lu", [indexPath section], [indexPath row]];//以indexPath来唯一确定cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BGRadioView *radioView =  (BGRadioView*) [cell viewWithTag:3];
    UITextView *textView = (UITextView*) [cell viewWithTag:2];
    NSMutableArray *sortByItemsArray = [[NSMutableArray alloc]init];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    if ([[defaults objectForKey:@"nianji"] isEqualToString:@"chuzhong"] ){
        switch (indexPath.row) {
            case 0:
                textView.text= @"北极熊的皮肤是什么颜色？";
                
                
                [sortByItemsArray addObject:@"黑色"];
                [sortByItemsArray addObject:@"粉色"];
                [sortByItemsArray addObject:@"白色"];
                [sortByItemsArray addObject:@"黄色"];
                
                break;
                
            case 1:
                textView.text= @"我国第一大岛是？";
                
                
                [sortByItemsArray addObject:@"台湾岛"];
                [sortByItemsArray addObject:@"海南岛"];
                [sortByItemsArray addObject:@"崇明岛"];
                [sortByItemsArray addObject:@"南澳岛"];
                
                break;
                
            case 2:
                textView.text= @"珊瑚是哪种生物？";
                
                
                [sortByItemsArray addObject:@"动物"];
                [sortByItemsArray addObject:@"植物"];
                [sortByItemsArray addObject:@"微生物"];
                [sortByItemsArray addObject:@"外星生物"];
                
                break;
                
            case 3:
                textView.text= @"世界四大洋中面积最小的是";
                
                
                [sortByItemsArray addObject:@"太平洋"];
                [sortByItemsArray addObject:@"印度洋"];
                [sortByItemsArray addObject:@"大西洋"];
                [sortByItemsArray addObject:@"北冰洋"];
                
                break;
                
            case 4:
                textView.text= @"鱼类靠什么来平衡身体？";
                
                
                [sortByItemsArray addObject:@"鱼鳔"];
                [sortByItemsArray addObject:@"鱼鳃"];
                [sortByItemsArray addObject:@"鱼鳞"];
                [sortByItemsArray addObject:@"鱼尾"];
                
                break;
                
            default:
                
                
                break;
                
                
        }
    }else {
        
        switch (indexPath.row) {
            case 0:
                textView.text= @"火箭发动机的鱼雷，其最大航速为？";
                
                
                [sortByItemsArray addObject:@"接近50节"];
                [sortByItemsArray addObject:@"达到70节"];
                [sortByItemsArray addObject:@"超过90节"];
                [sortByItemsArray addObject:@"110节左右"];
                
                break;
                
            case 1:
                textView.text= @"第一位步行完成南极探险的中国人是？";
                
                
                [sortByItemsArray addObject:@"秦大河"];
                [sortByItemsArray addObject:@"位梦华"];
                [sortByItemsArray addObject:@"金乃千"];
                [sortByItemsArray addObject:@"郭坤"];
                
                break;
                
            case 2:
                textView.text= @"自1768年起，三闯南极圈的航海家库克船长国籍是？";
                
                
                [sortByItemsArray addObject:@"美国"];
                [sortByItemsArray addObject:@"英国"];
                [sortByItemsArray addObject:@"法国"];
                [sortByItemsArray addObject:@"挪威"];
                
                break;
                
            case 3:
                textView.text= @"按岛屿自然形成的成因，台湾岛属于";
                
                
                [sortByItemsArray addObject:@"大陆岛"];
                [sortByItemsArray addObject:@"火山岛"];
                [sortByItemsArray addObject:@"珊瑚岛"];
                [sortByItemsArray addObject:@"冲积岛"];
                
                break;
                
            case 4:
                textView.text= @"金枪鱼的体温比周围的水温高（ ）摄氏度";
                
                
                [sortByItemsArray addObject:@"1"];
                [sortByItemsArray addObject:@"3"];
                [sortByItemsArray addObject:@"9"];
                [sortByItemsArray addObject:@"15"];
                
                break;
                
            default:
                
                
                break;
                
                
        }
        
    }
    

    

    radioView.rowItems =  sortByItemsArray;
    radioView.maxRow = [sortByItemsArray count];
    
    textView.textAlignment = NSTextAlignmentCenter;
    
    radioView.editable = YES;
    radioView.delegate = self;
    radioView.tag = indexPath.row;
    radioView.optionNo = 3;
    // set defult optionNo = -1 to select none
    //self.radioView.optionNo = -1;
    

    return cell;
}

#pragma clang diagnostic pop
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)commitButton:(id)sender {

    UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"恭喜您" message:@"答题完毕" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    
    [alertview show];
    
}

//alertView的回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"goback" sender:self];
    
}
@end
