//
//  PostListViewController.m
//  Ocean
//
//  Created by Nick on 15/4/16.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "PostListViewController.h"

@interface PostListViewController ()

@end

@implementation PostListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _mutArray=[[NSMutableArray alloc]init];
    _tzIdArray=[[NSMutableArray alloc]init];
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *titname=[defaults objectForKey:@"titleName"];
    self.navigationItem.title=titname;
    
    _pageCount=1;
    
    [self jiexi:_pageCount];
    
}

-(void)jiexi:(NSInteger)pageCount
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *tzid=[defaults objectForKey:@"tzID"];
    
    
    
    NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/PostList?typeId=%@&souValue=&currPage=%li&pageCount=1&pageSize=10&tiao=",tzid,(long)pageCount];
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",arr);
        _dic=(NSDictionary*)arr[0];
        
        if (![[_dic objectForKey:@"Result"] isEqual:@"noPost"]) {
            
            for (int i=0; i<arr.count; i++) {
                [_mutArray addObject:[arr objectAtIndex:i]];
                NSDictionary *dic1=_mutArray[i];
                [_tzIdArray addObject:[dic1 objectForKey:@"ArticleID"]];
                
                //[_tbView reloadData];
            }
            NSLog(@"帖子ID======:::%@",_tzIdArray);
            
            [self.tableView reloadData];
            
        }

        
                
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    

}

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
    return _mutArray.count;
}

//点击cell事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self performSegueWithIdentifier:@"toPostDetailViewController" sender:self];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *diction=_mutArray[indexPath.row];
    
   cell.textLabel.text=[diction objectForKey:@"ArticleTitle"];

    return cell;
}


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

//head的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}


@end
