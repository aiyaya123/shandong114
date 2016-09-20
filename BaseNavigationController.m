//
//  BaseNavigationController.m
//  Project114
//
//  Created by fosung_002 on 16/8/31.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor * color = [UIColor blackColor];
    
    UIFont *ff=[UIFont systemFontOfSize:17];
    //    UITextAttributeFont
    NSDictionary * dict=[[NSDictionary alloc] initWithObjectsAndKeys:color,UITextAttributeTextColor,ff,UITextAttributeFont, nil];
    //    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    
    self.navigationBar.titleTextAttributes = dict;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navar"] forBarMetrics:UIBarMetricsDefault];
    //  [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    
    //设置导航条样式
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    //    [self.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationBar setTintColor:[UIColor whiteColor]];

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
