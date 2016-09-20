//
//  ShotVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/1.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ShotVC.h"

@interface ShotVC ()
@property(nonatomic,strong)UITextView *textView;
@end

@implementation ShotVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"12345";
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self createView];
}
-(void)createView
{
    self.textView=[[UITextView alloc]initWithFrame:CGRectMake(30*pro, 64+30*pro, kScreenW-60*pro,300*pro)];
    self.textView.layer.cornerRadius=10;
    self.textView.layer.masksToBounds=YES;
    [self.view addSubview:self.textView];
    
    

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
