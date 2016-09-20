//
//  SearchVC.m
//  Project114
//
//  Created by zhu jun on 16/9/1.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "SearchVC.h"
#import "ResultVC.h"
@interface SearchVC ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *searchTF;
@end

@implementation SearchVC
-(void)viewWillAppear:(BOOL)animated
{
//    self.tabBarController.tabBar.hidden=YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kScreenW-125, 30)];
    _searchTF.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    _searchTF.placeholder = @" 搜索喜欢的商品";
    _searchTF.tintColor=[UIColor blueColor];
    //     _searchTF.keyboardAppearance=UIKeyboardTypeWebSearch;
    _searchTF.keyboardType=UIKeyboardTypeWebSearch;
    _searchTF.layer.cornerRadius=5*pro;
    _searchTF.font = [UIFont systemFontOfSize:14];
    _searchTF.delegate = self;
    //    _searchTF.layer.borderWidth = 1.0f;
    //    _searchTF.layer.cornerRadius = 5;
    //    _searchTF.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    
    
    
    self.navigationItem.titleView=_searchTF;
    
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem=leftButton;
    [_searchTF becomeFirstResponder];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_searchTF resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _searchTF=textField;
    
    if ([_searchTF.text isEqualToString:@""]) {
        return;
    }
    
    ResultVC *result=[[ResultVC alloc]init];
    result.title=@"搜索";
    [self.navigationController pushViewController:result animated:YES];
    
}
-(void)backClick{
    
    [self.navigationController popViewControllerAnimated:NO];
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
