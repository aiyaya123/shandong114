//
//  TwoNaviVC.m
//  Project114
//
//  Created by fosung_002 on 16/8/31.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "TwoNaviVC.h"
#import "UIImage+Extension.h"
@interface TwoNaviVC ()
/** 导航条View */
@property (nonatomic, weak) UIView *navBarView;
@end

@implementation TwoNaviVC

- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.backgroundColor = BXColor(253, 171, 47);
        navBarView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.navBarView];
}
-(void)leftBtClick{
    
    
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
