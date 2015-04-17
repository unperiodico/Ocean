//
//  UserViewController.m
//  Ocean
//
//  Created by Nick on 15/4/13.
//  Copyright (c) 2015年 xyzx5u. All rights reserved.
//

#import "UserViewController.h"


@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tbView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SelfView_W, SelfView_H) style:UITableViewStyleGrouped];
    
    _tbView.delegate=self;
    _tbView.dataSource=self;
    
    [self.view addSubview:_tbView];
    
    UINib *nib=[UINib nibWithNibName:@"MyCell" bundle:nil];
    [_tbView registerNib:nib forCellReuseIdentifier:@"Cell"];


    
}

-(void)jiexi
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *usID=[defaults objectForKey:@"UserID"];
    NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UserInfo?userId=%@",usID];
    
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
    
    [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"33==:%@",arr);
        _dic=(NSDictionary*)arr[0];
        NSLog(@"1111==:%@",_dic);
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        NSString *userName=[_dic objectForKey:@"UserNickName"];
        [defaults setObject:userName forKey:@"zhmName"];
        
        NSString *str=[NSString stringWithFormat:@"http://ahy.cz5u.com/HeadImage/upload/2_%@",[_dic objectForKey:@"HeadImage"]];
        [defaults setObject:str forKey:@"touxiang"];
        
        [_tbView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    //取消选中状态
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //右侧的箭头
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *arr=@[@"手机",@"昵称",@"修改密码",@"注销登录"];
    cell.imgView.image=[UIImage imageNamed:arr[indexPath.row]];
    cell.name.text=arr[indexPath.row];
  
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (indexPath.row==0) {

        _la=[[UILabel alloc]init];
        _la.frame=CGRectMake(130, 14, [UIScreen mainScreen].bounds.size.width-160, 20);
        _la.textAlignment=NSTextAlignmentRight;
        
        NSString *sj=[defaults objectForKey:@"shouji"];
        
        NSLog(@"1111==:%@",sj);
        if ([sj isKindOfClass:[NSNull class]]) {
            _la.text=sj;
        }else{
            
            _la.text=@"请绑定手机号";
        }
        
        
        [cell.contentView addSubview:_la];
        
    }else if (indexPath.row==1){

        
        _la=[[UILabel alloc]init];
        _la.frame=CGRectMake(130, 14, [UIScreen mainScreen].bounds.size.width-160, 20);
        _la.textAlignment=NSTextAlignmentRight;

        NSString *name=[defaults objectForKey:@"zhmName"];
        _la.text=name;
        NSLog(@"%@",name);
        [cell.contentView addSubview:_la];
        
        
    }
    
    
    return cell;
}

//cell选中时调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
    }else if (indexPath.row==1){
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"修改昵称" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=10;
        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
        
        [alertView show];
    }else if (indexPath.row==2){
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"输入新密码" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag=20;
        alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
        
        [alertView show];
    }else{
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        //        [defaults setObject:nil forKey:@"UserID"];
        [defaults removeObjectForKey:@"UserID"];
        [self performSegueWithIdentifier:@"zhuxiao" sender:self];
    }
}

//alert回调方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==10) {
        if (buttonIndex==1) {
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            NSString *usID=[defaults objectForKey:@"UserID"];
            
            UITextField *tf=[alertView textFieldAtIndex:0];
            
            NSString *str=[tf.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/UpdateUserInfo?userId=%@&nickname=%@&realname=&email=&gender=&birthday=&graduateschool=",usID,str];
            
            
            AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
            
            openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
            
            openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
            
            [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"33==:%@",arr);
                
                //删除cell上的label控件
                [_la removeFromSuperview];
                [self jiexi];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
            
        }

    }else{
        if (buttonIndex==1) {
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            NSString *usID=[defaults objectForKey:@"yhmName"];
            
            UITextField *tf=[alertView textFieldAtIndex:0];
            
            //        NSString *str=[tf.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *str=tf.text;
            [defaults setObject:str forKey:@"mmPass"];
            NSString *url=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/ChangePassword?userName=%@&userPass=%@",usID,str];
            
            
            AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
            
            openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
            
            openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
            
            [openmanger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"33==:%@",arr);
                
                
                
                
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
            }];
 
        }
        
    }



}


//head布局
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]init];
    headView.frame=CGRectMake(0, 0, SelfView_W, 130);
//    UIColor *selfColor= [UIColor colorWithRed:38/255.0 green:176/255.0 blue:243/255.0 alpha:1];
    headView.backgroundColor=[UIColor whiteColor];
//    UIImageView *bjImage=[[UIImageView alloc]init];
//    bjImage.frame=CGRectMake(0, 0, SelfView_W, 130);
//    bjImage.image=[UIImage imageNamed:@"背景"];
//    [headView addSubview:bjImage];
    
    
    UIImageView *txImage=[[UIImageView alloc]initWithFrame:CGRectMake((SelfView_W-100)/2, 20, 100, 100)];
    
    txImage.layer.cornerRadius=txImage.frame.size.width/2;
    txImage.clipsToBounds=YES;
    
//    NSString *str=[NSString stringWithFormat:@"http://ahy.cz5u.com/HeadImage/upload/2_%@",[_dic objectForKey:@"HeadImage"]];
//    NSURL *url=[NSURL URLWithString:str];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    [defaults setObject:str forKey:@"touxiang"];
    NSURL *url=[NSURL URLWithString:[defaults objectForKey:@"touxiang"]];
    
    [txImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"占位头像"]];
    
    //头像点击事件
    UITapGestureRecognizer *tapGes=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick:)];
    //允许交互
    txImage.userInteractionEnabled=YES;
    [txImage addGestureRecognizer:tapGes];
    
    [headView addSubview:txImage];
    
    
    
    return headView;
}

//head的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 130;
    
}


//头像点击的方法
-(void)tapGesClick:(UITapGestureRecognizer*)tap
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"手机相册", nil];
    
    [actionSheet showInView:self.view];
    
    
}

//判断设备是否有摄像头
-(BOOL)isCamearAvailabel
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

//UIActionSheet 调用方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker=[[UIImagePickerController alloc]init];
    imagePicker.editing=YES;
    imagePicker.allowsEditing=YES;
    imagePicker.delegate=self;
    if (buttonIndex==0) {//照相机
        if ([self isCamearAvailabel]) {
            imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }else{
            NSLog(@"没有摄像头");
        }
        
    }
    
    if (buttonIndex==1) {
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
}



//UIImagePickerController 的代理方法
//选中图片  点击确定时调用
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [self performSelector:@selector(saveimage:) withObject:image afterDelay:0.5];
    
    
    
    
}
//在相册里点击返回(取消)时调用
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//头像
-(void)saveimage:(UIImage*)image
{
    //_txImgView.image=image;
    
    NSData *data=UIImageJPEGRepresentation(image, 0.5);
    
    NSString *str=[data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *strID=[defaults objectForKey:@"UserID"];
    
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:strID,@"userId",str,@"byteFile", nil];
    
    //    NSString *str=[NSString stringWithFormat:@"http://ahy.cz5u.com/HaiYangBBSService.asmx/FileUploadImage?userId=100013&byteFile=%@",data];
    
    NSString *str1=@"http://ahy.cz5u.com/HaiYangBBSService.asmx/FileUploadImage";
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    openmanger.requestSerializer=[AFHTTPRequestSerializer serializer];
    
    [openmanger POST:str1 parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *sss=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",operation);
        NSLog(@"%@",sss);
        [self jiexi];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}





-(void)viewDidAppear:(BOOL)animated{
    [self hideTabBar];
    
}




- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}

/*
 - (void)showTabBar
 
 {
 if (self.tabBarController.tabBar.hidden == NO)
 {
 return;
 }
 UIView *contentView;
 if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
 
 contentView = [self.tabBarController.view.subviews objectAtIndex:1];
 
 else
 
 contentView = [self.tabBarController.view.subviews objectAtIndex:0];
 contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
 self.tabBarController.tabBar.hidden = NO;
 
 }
 */



@end