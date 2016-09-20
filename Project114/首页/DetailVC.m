//
//  DetailVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/6.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "DetailVC.h"
#import "ZZButton.h"
#import "UMSocial.h"
#import "TableViewCell.h"
#import "ServerDetailVC.h"
static CGFloat const startH = 0;
@interface DetailVC ()<UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *foldArray;
/** 导航条View */
@property (nonatomic, weak) UIView *navBarView;
@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self setNavView];
    [self createView];
}
- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.frame = CGRectMake(0, 0, kScreenW, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}
-(void)setNavView
{
    
    UIView *NavBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreenW, 54*pro)];
    self.navigationItem.titleView = NavBgView;
    
    
    UIButton *LBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    LBtn.frame = CGRectMake(0, 5, 30, 30);
    [LBtn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    LBtn.backgroundColor=[UIColor purpleColor];
  
    
    UIBarButtonItem *leftItem1=[[UIBarButtonItem alloc]initWithCustomView:LBtn];
    self.navigationItem.leftBarButtonItem=leftItem1;
    
      
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, 5, 30, 30);
    [collectBtn addTarget:self action:@selector(toCollect) forControlEvents:UIControlEventTouchUpInside];
    collectBtn.backgroundColor=[UIColor purpleColor];
     UIBarButtonItem *RItem1 = [[UIBarButtonItem alloc] initWithCustomView:collectBtn];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 5, 30, 30);
    [shareBtn addTarget:self action:@selector(toShare) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.backgroundColor=[UIColor purpleColor];
    UIBarButtonItem *RItem2 = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    
    self.navigationItem.rightBarButtonItems = @[RItem1,RItem2];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >startH) {
        CGFloat alpha= MIN(1, 1 - ((startH + 64 - offsetY) / 64));
        self.navBarView.backgroundColor = BXAlphaColor(253, 171, 47, alpha);
//        if (alpha==1) {
//            //             [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//            searchTF.backgroundColor=[UIColor blueColor];
//        }
//        else
//        {
//            searchTF.backgroundColor=[UIColor whiteColor];
//        }
        
        
    }else {
        //       [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.navBarView.backgroundColor = BXAlphaColor(253,171, 47, 0);
    }
    
    CGFloat down = - 250*pro - scrollView.contentOffset.y;
    if (down < 0) return;
 
    
}

-(void)createView{
    
    [self.view addSubview:self.tableView];
    
}
#pragma mark-------delegate-----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else
    {
        NSNumber *number=self.foldArray[section];
        BOOL isOPen=number.boolValue;
        return isOPen?4:5;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==1) {
        static NSString *reuse1=@"reuse1";
        ProductCell *cell=[tableView dequeueReusableCellWithIdentifier:reuse1];
        if (!cell) {
            cell=[[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse1];
        }
        return cell;
    }
    else if (indexPath.section==2)
    {
        static NSString *reuse2=@"reuse2";
        CommentCell *cell=[tableView dequeueReusableCellWithIdentifier:reuse2];
        if (!cell) {
            cell=[[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse2];
        }
        return cell;
    
    }
    else
    {
        static NSString *reuseID=@"reuse id";
        ServerHomeCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!cell) {
            cell=[[ServerHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
        }
        cell.numLb.hidden=YES;
        return cell;
 
    
    }
    
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.section==2) {
        return 180*pro;
    }
    else
    {
        return 160*pro;
 
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 90*pro)];
    
    UIImageView *iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 30*pro, 30*pro, 30*pro)];
    iconImg.backgroundColor=[UIColor redColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(70*pro, 0, kScreenW-60*pro, 90*pro)];
//    label.text=@"服务产品";
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor lightGrayColor];
    view.backgroundColor=[UIColor whiteColor];
    
    if (section==0) {
        UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 480*pro)];
        headView.backgroundColor=[UIColor whiteColor];
        
        
        UIImageView *headImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 280*pro)];
        headImg.backgroundColor=[UIColor yellowColor];
        
        UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(10*pro, 290*pro, kScreenW, 50*pro)];
        titleLb.text=@"爱君家政";
        titleLb.font=[UIFont systemFontOfSize:15];
        
        UIImageView *starImg=[[UIImageView alloc]initWithFrame:CGRectMake(10*pro, 345*pro,180*pro , 30*pro)];
        starImg.backgroundColor=[UIColor yellowColor];
        
        UILabel *fenLb=[[UILabel alloc]initWithFrame:CGRectMake(200*pro, 345*pro, 70*pro, 30*pro)];
        fenLb.text=@"5.0分";
        fenLb.font=[UIFont systemFontOfSize:13];
        
        UILabel *lineLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 390*pro, kScreenW, 1*pro)];
        lineLb.backgroundColor=[UIColor lightGrayColor];
        
        
        UIImageView *mapImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 420*pro, 20*pro, 20*pro)];
        mapImg.backgroundColor=[UIColor orangeColor];
        
        UILabel *positionLb=[[UILabel alloc]initWithFrame:CGRectMake(60*pro, 395*pro,kScreenW/2, 80*pro)];
        positionLb.text=@"市中区八一银座北陵海威广场小区一号楼商铺";
        positionLb.numberOfLines=0;
        positionLb.font=[UIFont systemFontOfSize:13];
        
        UIImageView *telImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-85*pro, 400*pro, 60*pro, 60*pro)];
        telImg.backgroundColor=[UIColor greenColor];
        telImg.userInteractionEnabled=YES;
        [telImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(telClick)]];
       
        
        [headView addSubview:headImg];
        [headView addSubview:titleLb];
        [headView addSubview:starImg];
        
        [headView addSubview:fenLb];
        [headView addSubview:lineLb];
        [headView addSubview:mapImg];
        [headView addSubview:positionLb];
        [headView addSubview:telImg];
        
        return headView;
    }
    else if (section==1)
    {
        label.text=@"服务产品";
        [view addSubview:iconImg];
        [view addSubview:label];
        return view;
    }
    else if (section==2)
    {
        
        label.text=@"评价（300条）";
        UIImageView *starImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 80*pro, 180*pro, 30*pro)];
        starImg.backgroundColor=[UIColor yellowColor];
        
        float x = CGRectGetMaxX(starImg.frame);
        UILabel *fenLb=[[UILabel alloc]initWithFrame:CGRectMake(x+10*pro, 80*pro, 70*pro, 30*pro)];
        fenLb.text=@"3.5分";
        fenLb.textColor=[UIColor orangeColor];
        fenLb.font=[UIFont systemFontOfSize:13];
        
        
        UILabel *compareLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2+30*pro, 80*pro, kScreenW/2-30*pro, 30*pro)];
        compareLb.text=@"高于100%同行";
        compareLb.font=[UIFont systemFontOfSize:15];
        
        [view addSubview:iconImg];
        [view addSubview:label];
        [view addSubview:starImg];
        [view addSubview:fenLb];
        [view addSubview:compareLb];
    
        return view;
    }
    else
    {
       label.text=@"更多商家";
        [view addSubview:iconImg];
        [view addSubview:label];
        return view;
    }

}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return nil;
    }
    else
    {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 90*pro)];
        view.tag=3000+section;
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 70*pro)];
        label.backgroundColor=[UIColor whiteColor];
        label.text=@"查看其他产品";
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:14];
        
        [view addSubview:label];
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        

        return view;

    }
   

}
-(void)tapAction:(UITapGestureRecognizer *)tap

{
    
    
    
    //tap.view.tag-baseTag;
    NSNumber *number=self.foldArray[tap.view.tag-3000];
    BOOL isOPen=number.boolValue;
    //改变状态数组中某一组的状态
    [self.foldArray replaceObjectAtIndex:tap.view.tag-3000 withObject:@(!isOPen)];
    
    
    [self.tableView reloadData];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 480*pro;
    }
    else if(section==2)
    {
        return 130*pro;
    }
    else
    {
        return 90*pro;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 10*pro;
    }
    else
    {
        return 90*pro;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServerDetailVC *detail=[[ServerDetailVC alloc]init];
    [self.navigationController pushViewController:detail animated:NO];
                            
}
-(void)leftBtn
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)telClick
{
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSURL *telURL =[NSURL URLWithString:@"tel:12345"];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.tableView addSubview:callWebview];

}
-(void)toCollect
{
    [[XBToastManager ShardInstance]showtoast:@"收藏成功"];
    return;
}
-(void)toShare
{
    
    //    OneViewController *aa=[[OneViewController alloc]init];
    //    [self.navigationController pushViewController:aa animated:YES];
    [UMSocialData defaultData].extConfig.title = @"测试分享";
    [UMSocialData defaultData].extConfig.qzoneData.url = @"https://www.baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5744171667e58e89d80015ae"
                                      shareText:@"来自114分享http://news.baidu.com"
                                     shareImage:[UIImage imageNamed:@"19.png"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
    
    NSLog(@"蹦蹦蹦蹦");
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, -64, kScreenW, kScreenH) style:UITableViewStyleGrouped];

        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor lightGrayColor];
    }
    return _tableView;
}
-(NSMutableArray *)foldArray
{
    if (!_foldArray) {
        _foldArray=[NSMutableArray array];
        
        //这个数组需要存什么内容？
        //每个组的状态
        for (int i=0; i<4; i++) {
            
            //初始化的时候，给数组中填充一些默认的状态
            [_foldArray addObject:@(YES)];
        }
    }
    return _foldArray;
    
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
