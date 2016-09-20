//
//  HotlineVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/1.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "HotlineVC.h"
#import "ShotVC.h"
@interface HotlineVC ()

@end

@implementation HotlineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"12345";
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    [self createView];
}
-(void)createView
{
     float ww=(kScreenW-400*pro)/3;
    NSArray *nameArr=@[@"拍摄上传",@"一键拨打"];
    for (int i=0; i<2; i++) {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(ww+(200*pro+ww)*i, 64+90*pro, 180*pro, 180*pro)];
        imgView.backgroundColor=[UIColor orangeColor];
        imgView.layer.cornerRadius=90*pro;
        imgView.layer.masksToBounds=YES;
        imgView.tag=300+i;
        imgView.userInteractionEnabled=YES;
        [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgClick:)]];
        
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(ww+(200*pro+ww)*i, 64+290*pro, 180*pro, 80*pro )];
        label.text=nameArr[i];
        label.textAlignment=NSTextAlignmentCenter;
      
        [self.view addSubview:label];
        [self.view addSubview:imgView];
    }

    UIImageView *footView=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenH/3*2, kScreenW, kScreenH/3)];
    footView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:footView];
}
-(void)imgClick:(UITapGestureRecognizer *)sender
{
    if (sender.self.view.tag==300) {
        
        ShotVC *shot=[[ShotVC alloc]init];
        [self.navigationController pushViewController:shot animated:NO];
        
    }
    else
    {
        UIWebView*callWebview =[[UIWebView alloc] init];
            NSURL *telURL =[NSURL URLWithString:@"tel:12345"];
            [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
            [self.view addSubview:callWebview];

    
    }

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
