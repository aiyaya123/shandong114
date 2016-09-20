//
//  QueryVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/5.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "QueryVC.h"
#import "ZJButton.h"


@interface QueryVC ()

@end

@implementation QueryVC

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}
-(void)createView
{
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, kScreenH-100*pro, kScreenW, 100*pro)];
    footView.backgroundColor=[UIColor greenColor];
    
    
    for (int i=0; i<2; i++) {
        ZJButton *footBtn=[ZJButton buttonWithType:UIButtonTypeCustom];
        footBtn.frame=CGRectMake(200*pro*(i+1), 0,90*pro, 90*pro);
        [footBtn setImage:[UIImage imageNamed:@"ff@2x.png"] forState:UIControlStateNormal];
        [footBtn setTitle:@"测试" forState:UIControlStateNormal];
        [footBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 添加响应事件
        [footBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:footBtn];
        
    }

    [self.view addSubview:footView];

}
-(void)buttonAction{
    NSLog(@"asdasdasdasd");

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createView];
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
