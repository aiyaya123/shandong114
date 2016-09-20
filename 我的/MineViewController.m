//
//  MineViewController.m
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITextField *phoneText;
@property(nonatomic,strong)UITextField *yzmText;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.navigationController.navigationBar.hidden=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    [self creatView];
}
-(void)creatView
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 230*pro)];
    headView.backgroundColor=[UIColor redColor];
    
    self.tableView.tableHeaderView=headView;
    
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return 5;
    }
    else
    {
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strCellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strCellID];
    }
     NSArray *textLb=@[@"收货地址",@"我的积分",@"我的发布",@"我的分享",@"设置"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageNamed:@"itemImage"];
    if (indexPath.section==1) {
        cell.textLabel.text=textLb[indexPath.row];
    }
    else if (indexPath.section==0)
    {
        cell.textLabel.text=@"我的订单";
    }
    else
    {
        cell.textLabel.text=@"联系客服";
    }
    
    cell.detailTextLabel.text=@"哈哈";
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90*pro;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 110*pro)];
    footView.backgroundColor=[UIColor whiteColor];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 20*pro, kScreenW, 80*pro)];
    lab.text=@"测试";
    [footView addSubview:lab];
    if (section==0) {
        return footView;
    }
    else
    {
        return nil;
    }
//    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 116*pro;
    }
    else
    {
        return 6*pro;
    }
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenW,kScreenH ) style:UITableViewStyleGrouped];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
