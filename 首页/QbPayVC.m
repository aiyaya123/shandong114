//
//  QbPayVC.m
//  Project114
//
//  Created by fosung_002 on 16/8/29.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "QbPayVC.h"
#import "TableViewCell.h"

@interface QbPayVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *secondLb;
@end

@implementation QbPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor brownColor];
    
    [self createView];
}
-(void)createView
{
    [self tableView];
    float origHeight=_tableView.frame.size.height;
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(20*pro,origHeight+20*pro , kScreenW-40*pro, 90*pro);
    button.backgroundColor=[UIColor orangeColor];
    button.layer.cornerRadius=6;
    button.layer.masksToBounds=YES;
    [button setTitle:@"确认付款 人民币1000" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, origHeight+150*pro, kScreenW-40*pro, 200*pro)];
    imgView.backgroundColor=[UIColor redColor];
    [self.view addSubview:imgView];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else{
    
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    
    if (cell==nil) {
        cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120*pro;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 60*pro)];
    headView.backgroundColor=[UIColor whiteColor];
    UILabel *firstLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW/2, 60*pro)];
//    firstLb.backgroundColor=[UIColor yellowColor];
    firstLb.font=[UIFont systemFontOfSize:16];
    
    self.secondLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2+20*pro, 0, kScreenW/2-40*pro, 60*pro)];
//    self.secondLb.textColor=[UIColor blueColor];
    self.secondLb.textAlignment=NSTextAlignmentRight;
    if (section==0) {
        firstLb.text=@"Q币充值";
        self.secondLb.text=[NSString stringWithFormat:@"¥%@",self.price];
        [headView addSubview:firstLb];
        [headView addSubview:self.secondLb];

    }else
    {
        firstLb.text=@"请选择支付方式";
    
        [headView addSubview:firstLb];
        
    }
    return headView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
   if(section==1)
   {
       
       UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 500*pro)];
       UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
       button.frame=CGRectMake(20*pro, 20*pro , kScreenW-40*pro, 90*pro);
       button.backgroundColor=[UIColor orangeColor];
       button.layer.cornerRadius=6;
       button.layer.masksToBounds=YES;
       [button setTitle:[NSString stringWithFormat:@"确认支付 ¥%@",self.price] forState:UIControlStateNormal];
       
       [footView addSubview:button];
       
       UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro,170*pro, kScreenW-40*pro, 150*pro)];
       imgView.backgroundColor=[UIColor redColor];
       [footView addSubview:imgView];
       return footView;
   }else
   {
       return nil;
   }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70*pro;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1) {
        return 500*pro;
    }else{
        return 0;
    }

}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
//        _tableView.backgroundColor=[UIColor lightGrayColor];
        
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
