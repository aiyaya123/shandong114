//
//  BaseAppearance.m
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "FirstEnterViewController.h"
#import "AppDelegate.h"
#import "RegistVC.h"
@interface FirstEnterViewController ()<UIScrollViewDelegate>{

    UIImageView *image;
    NSTimer *timer;
    UIScrollView *scrollView;

    NSInteger _tempPage;
}
//@property (nonatomic, strong) UIPageControl *pageControl;
@end


@implementation FirstEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
   scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(kScreenW*4, kScreenH);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    NSArray *iphone4 = @[@"01",@"02",@"03",@"04"];  //3。5
    NSArray *iphone5 = @[@"11",@"12",@"13",@"14"];  //4
    NSArray *iphone6 = @[@"21",@"22",@"23",@"24"];  //4.7
    NSArray *iphone6p = @[@"31",@"32",@"33",@"34"]; //5.5
    
    for (int i = 0; i<4; i++) {
        
        
        image = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW*i, 0, kScreenW, kScreenH)];
        [scrollView addSubview:image];
        
        
        if (kScreenH == 480) {
            
            image.image = [UIImage imageNamed:iphone4[i]];
            
        }else if (kScreenH == 568){
            
            image.image = [UIImage imageNamed:iphone5[i]];
            
            
        }else if (kScreenH == 667){
            
            
            image.image = [UIImage imageNamed:iphone6[i]];
            
        }else if (kScreenH == 736){
          
            image.image = [UIImage imageNamed:iphone6p[i]];
            
        }

         }
    
   
    timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kScreenW/2-130*pro+kScreenW*3, kScreenH/2, 260*pro, 300*pro);
    [btn addTarget:self action:@selector(btnPushAction) forControlEvents:UIControlEventTouchUpInside];
//  btn.backgroundColor=[UIColor redColor];
    [scrollView addSubview:btn];
    
    
}

#pragma mark -PageControl Method-
- (void)turnPage:(NSInteger)page
{
    _tempPage = page;
    [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width * (page ), 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
}

#pragma mark -定时器 Method-
- (void)runTimePage
{
    static int page=0;
    page ++;
    
    [self turnPage:page];
    
    if (page==4) {
        [timer invalidate];
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        
        [appDelegate createControllers];

        
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{


    [timer invalidate];
    

}

-(void)btnPushAction{

//    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
//    
//    [appDelegate createControllers];
    
    RegistVC *regist=[[RegistVC alloc]init];
    [self presentViewController:regist animated:YES completion:nil];

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
