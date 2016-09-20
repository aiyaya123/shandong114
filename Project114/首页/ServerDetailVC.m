//
//  ServerDetailVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/9.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ServerDetailVC.h"
#import "UMSocial.h"
@interface ServerDetailVC ()<UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate>

{
    float height1;
    float height2;
    NSString * aa;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;


@end

@implementation ServerDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"服务详情";
    self.view.backgroundColor=[UIColor whiteColor];
    [self createView];
}
-(void)createView
{
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

    aa=@"iPhone7的背面就没有变化了吗？据传闻它的摄像头也变大了，意味着 iPhone 7 可能采用了全新的 CMOS 传感器，更大的 CMOS 传感器可以使得拍摄时进光亮更多，从而提升照片的质量。苹果在之前的 iPhone 就用过类似的摄像头提升";
     height1=[aa boundingRectWithSize:CGSizeMake(kScreenW-40*pro, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
    [self.view addSubview:self.tableView];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==5) {
        return 3;
    }
    else if(section==2)
    {
        return 1;
    }
    else
    {
        return 0;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.section==2) {
        static NSString *reuse1=@"reuse1";
        InfoCell *cell=[tableView dequeueReusableCellWithIdentifier:reuse1];
        if (!cell) {
            cell=[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse1];
        }
        return cell;
    }
    else
    {
        static NSString *reuse2=@"reuse2";
        CommentCell *cell=[tableView dequeueReusableCellWithIdentifier:reuse2];
        if (!cell) {
            cell=[[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse2];
        }
        return cell;

        
    }
   
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 90*pro)];
    UIImageView *iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 30*pro, 30*pro, 30*pro)];
    iconImg.backgroundColor=[UIColor redColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(70*pro, 0, kScreenW-60*pro, 90*pro)];
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor lightGrayColor];
    view.backgroundColor=[UIColor whiteColor];
   
    view.backgroundColor=[UIColor whiteColor];
    if (section==0) {
        UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 440*pro)];
        headView.backgroundColor=[UIColor whiteColor];
        
        
        UIImageView *headImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 280*pro)];
        headImg.backgroundColor=[UIColor yellowColor];
        
        UILabel *priceLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 290*pro,300*pro, 70*pro)];
        priceLb.text=@"¥300元";
        priceLb.font=[UIFont systemFontOfSize:20];
        priceLb.textColor=[UIColor orangeColor];
        
        
        UILabel *yuanLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 370*pro, 180*pro, 30*pro)];
        yuanLb.text=@"门市价:500元";
        yuanLb.font=[UIFont systemFontOfSize:13];
        yuanLb.textColor=[UIColor lightGrayColor];
        
        float x = CGRectGetMaxX(yuanLb.frame);
        
        UILabel *soldLb=[[UILabel alloc]initWithFrame:CGRectMake(x, 370*pro, 200*pro, 30*pro)];
        soldLb.text=@"已售:309份";
        soldLb.font=[UIFont systemFontOfSize:13];
        soldLb.textColor=[UIColor lightGrayColor];
        
        
        UIButton *payBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        payBtn.frame=CGRectMake(kScreenW-240*pro, 310*pro, 220*pro, 80*pro);
        payBtn.layer.cornerRadius=4;
        payBtn.layer.masksToBounds=YES;
        payBtn.backgroundColor=[UIColor orangeColor];
        [payBtn setTitle:@"立即预约" forState:UIControlStateNormal];
        [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [payBtn addTarget:self action:@selector(toPayClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        [headView addSubview:headImg];
        [headImg addSubview:priceLb];
        [headImg addSubview:yuanLb];
        [headImg addSubview:soldLb];
        [headImg addSubview:payBtn];
        
        return headView;
    }
    else if (section==1)
    {
        UIImageView *starView=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 30*pro, 180*pro, 30*pro)];
        starView.backgroundColor=[UIColor yellowColor];
        float x = CGRectGetMaxX(starView.frame);
        UILabel *fenLb=[[UILabel alloc]initWithFrame:CGRectMake(x+10*pro, 0, 80*pro, 90*pro)];
        fenLb.text=@"4.5分";
        fenLb.font=[UIFont systemFontOfSize:14];
        fenLb.textColor=[UIColor orangeColor];
        
        
        UILabel *commentLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2, 0, kScreenW/2-20*pro, 90*pro)];
        commentLb.text=@"1000人评价";
        commentLb.font=[UIFont systemFontOfSize:14];
        commentLb.textAlignment=NSTextAlignmentRight;
        [view addSubview:starView];
        [view addSubview:fenLb];
        [view addSubview:commentLb];
        
        return view;
    
    }
    else if(section==2)
    {
        
        label.text=@"商家信息";
        [view addSubview:iconImg];
        [view addSubview:label];
        return view;
    }
    else if (section==3)
    {
        label.text=@"服务";
        [view addSubview:iconImg];
        [view addSubview:label];
        return view;
    
    }
    else if (section==4)
    {
        label.text=@"购买须知";
        [view addSubview:iconImg];
        [view addSubview:label];
        return view;
        
    }
    
    else
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
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==3) {
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[UIColor lightGrayColor];
        UIView *footView=[[UIView alloc]init];
        footView.backgroundColor=[UIColor whiteColor];
        UILabel *nameLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW,80*pro)];
        nameLb.text=@"擦油烟机";
    
        nameLb.font=[UIFont systemFontOfSize:17];
        [footView addSubview:nameLb];
        NSArray *nameArr=@[@"门市价",@"优惠",@"实付"];
        for (int i=0; i<3; i++) {
            
            UILabel *leftLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 80*pro+70*pro*i, 150*pro, 70*pro)];
            
            leftLb.text=nameArr[i];
            leftLb.font=[UIFont systemFontOfSize:14];
            leftLb.textColor=[UIColor lightGrayColor];
            
            UILabel *rightLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-300*pro, 80*pro+70*pro*i, 280*pro, 70*pro)];
            rightLb.textAlignment=NSTextAlignmentRight;
            rightLb.text=nameArr[i];
            rightLb.font=[UIFont systemFontOfSize:14];
            rightLb.textColor=[UIColor lightGrayColor];
            if (i==2) {
                rightLb.textColor=[UIColor orangeColor];
            }

            
            [footView addSubview:leftLb];
            
            [footView addSubview:rightLb];
        }
        
        UILabel *detailLb=[[UILabel alloc]init];
        detailLb.font=[UIFont systemFontOfSize:13];
        detailLb.text=@"iPhone7的背面就没有变化了吗？据传闻它的摄像头也变大了，意味着 iPhone 7 可能采用了全新的 CMOS 传感器，更大的 CMOS 传感器可以使得拍摄时进光亮更多，从而提升照片的质量。苹果在之前的 iPhone 就用过类似的摄像头提升";

        detailLb.numberOfLines=0;
        detailLb.frame=CGRectMake(20*pro, 300*pro, kScreenW-40*pro, height1);
        NSLog(@"aaaaaaa=====%lf",height1);
        
       
        footView.frame=CGRectMake(0, 0, kScreenW, 320*pro+height1);
        view.frame=CGRectMake(0, 0, kScreenW, 330*pro+height1);
        
        NSLog(@"fffff===%lf",footView.frame.size.height);
        NSLog(@"vvv====%lf",view.frame.size.height);
        
        [footView addSubview:detailLb];
        
        [view addSubview:footView];
       
        
        return view;

    }
    else if (section==4)
    {
        
        NSArray *leftName=@[@"有效期",@"使用时间",@"使用规则"];
        UIView *view=[[UIView alloc]init];
        UIView *footView=[[UIView alloc]init];
        footView.backgroundColor=[UIColor whiteColor];
        for (int i=0; i<3; i++) {
            UILabel * leftLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 70*pro*i,150*pro, 70*pro)];
            leftLb.text=leftName[i];
            leftLb.font=[UIFont systemFontOfSize:14];
            leftLb.textColor=[UIColor lightGrayColor];
            
            [footView addSubview:leftLb];
            
            
        }
        
        for (int i=0; i<6; i++) {
            UILabel *rightLb=[[UILabel alloc]initWithFrame:CGRectMake(170*pro, 70*pro*i, kScreenW-190*pro, 70*pro)];
            rightLb.text=@"阿萨德法师法师法第三方";
            rightLb.font=[UIFont systemFontOfSize:14];
            
            [footView addSubview:rightLb];
            
            if (i==5) {
                
                height2=CGRectGetMaxY(rightLb.frame);
                NSLog(@"222====%lf",height2);
            }
        }
        
        footView.frame=CGRectMake(0, 0, kScreenW, 440*pro);
        view.frame=CGRectMake(0, 0, kScreenW, 450*pro);
        
        [view addSubview:footView];
        return view;
    }
    else
    {
        return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        return 110*pro;
    }
    else
    {
        return 180*pro;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==3) {
        NSLog(@"bbbbbbb======%lf",height1);
        return 330*pro+height1;
    }
    else if(section==4)
    {
        return 450*pro;
        NSLog(@"aaaaaaa======%lf",height2);
    }
    else
    {
        return 10*pro;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 420*pro;
    }
    else if(section==5)
    {
        return 130*pro;
    }
    else
    {
        return 90*pro;
    }
}
-(void)toPayClick
{
    

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
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH+64) style:UITableViewStyleGrouped];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor lightGrayColor];
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
