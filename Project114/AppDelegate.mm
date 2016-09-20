//
//  AppDelegate.m
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "FirstEnterViewController.h"

#import <BaiduMapAPI_Base/BMKMapManager.h>
#import "BNCoreServices.h"
#import "BaseNavigationController.h"
#import "RegistVC.h"

@interface AppDelegate ()<UIAlertViewDelegate>
{
   
    
    MainViewController *_mainVC;
  
    MineViewController *_mineVC;
    
    SellerViewController *_sellerVC;
    FoundViewController *_foundVC;
    UITabBarController *TabVC;
    
    UINavigationController *_nav1;
    BaseNavigationController *_nav2;
    BaseNavigationController *_nav3;
    
    BaseNavigationController *_nav4;
    
    BMKMapManager* _mapManager;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self isFirst];
    IQKeyboardManager * manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification1 object:nil];
//    hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"] ;
//    //开始监听，会启动一个run loop
//    [hostReach startNotifier];
    
     [NSThread sleepForTimeInterval:2.0];
    
    
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"10cqUKIFZ2Qt64Ys8tT5lpXWBTNaenBM"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    [BNCoreServices_Instance initServices:@"10cqUKIFZ2Qt64Ys8tT5lpXWBTNaenBM"];
    [BNCoreServices_Instance startServicesAsyn:nil fail:nil];
    
    
      [UMSocialData setAppKey:YMAppKey];
      [UMSocialWechatHandler setWXAppId:@"wxf7ac6839b29c501d" appSecret:@"11602ee12f1c9cb4a70c4416408ac89b" url:@"http://www.umeng.com/social"];
        //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
      [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:YMAppKey url:@"http://www.umeng.com/social"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
      [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"819272468"
                                              secret:@"da00667b7bad3ffd8038a93078eef975"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    return YES;
}

-(void)isFirst{
    NSUserDefaults *userDedoults = [NSUserDefaults standardUserDefaults];
    BOOL isFirst = [userDedoults boolForKey:@"isFirst"];
    
    if (!isFirst) {
        FirstEnterViewController *firstVC = [[FirstEnterViewController alloc] init];
        self.window.rootViewController = firstVC;
        
        [userDedoults setBool:YES forKey:@"isFirst"];
        [self getAppKey];
    }else{
        [self createControllers];
    }
    
}
-(void)getAppKey
{
    NSString *body=@"http://app114.d6y.cn/index.php";
    NSDictionary *dic=@{@"method":@"hd100.app.Register",@"format":@"json",@"os_name":@"ios",@"app_ver":@"1.0"};
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger POST:body parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *aa=[diction objectForKey:@"data"];
        NSDictionary *bb=[aa objectAtIndex:0];
        NSString *cc=[bb objectForKey:@"appkey"];
        [userDaults setObject:cc forKey:@"appKey"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    



}

-(void)createControllers
{
    
   
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    _mainVC=[[MainViewController alloc]init];
    _nav1=[[UINavigationController alloc]initWithRootViewController:_mainVC];
    UITabBarItem *tabBarItem1=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"Shou.png"] selectedImage:[UIImage imageNamed:@"zhuye-p"]];
    _nav1.tabBarItem=tabBarItem1;
    
    
    
    _sellerVC=[[SellerViewController alloc]init];
    _nav2=[[BaseNavigationController alloc]initWithRootViewController:_sellerVC];
    UITabBarItem *tabBarItem2=[[UITabBarItem alloc]initWithTitle:@"商家" image:[UIImage imageNamed:@"Gou.png"] selectedImage:[UIImage imageNamed:@"购物车-拷贝"]];
    _nav2.tabBarItem=tabBarItem2;
    
  
    
    
    
    _foundVC=[[FoundViewController alloc]init];
    _nav3=[[BaseNavigationController alloc]initWithRootViewController:_foundVC];
    UITabBarItem *tabBarItem3=[[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"Wo.png"] selectedImage:[UIImage imageNamed:@"mine-p"]];
    _nav3.tabBarItem=tabBarItem3;
    
    _mineVC=[[MineViewController alloc]init];
    _nav4=[[BaseNavigationController alloc]initWithRootViewController:_mineVC];
    UITabBarItem *tabBarItem4=[[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"Wo.png"] selectedImage:[UIImage imageNamed:@"mine-p"]];
    _nav4.tabBarItem=tabBarItem4;
    
    TabVC=[[UITabBarController alloc]init];
    TabVC.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:59/255.0 blue:48/255.0 alpha:1];
    
    
    
    
    
    
    NSArray *array=@[_nav1,_nav2,_nav3,_nav4];
    TabVC.viewControllers=array;
    TabVC.tabBar.backgroundColor =[UIColor whiteColor];
    self.window.rootViewController=TabVC;
    [self.window makeKeyAndVisible];

}

//-(void)reachabilityChanged:(NSNotification *)note
//{
//    Reachability *currReach = [note object];
//    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
//    //对连接改变做出响应处理动作
//    NetworkStatus status = [currReach currentReachabilityStatus];
//    //如果没有连接到网络就弹出提醒实况
//    _isReachable = YES;
//    if(status == NotReachable)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络连接异常" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alert show];
//        _isReachable = NO;
//        return;
//    }
//    if (status==ReachableViaWWAN||status==ReachableViaWiFi)  {
//        _isReachable = YES;
//    }
//    
//}


//系统回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //开启网络状况的监听
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification1 object:nil];
//    
//    hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"] ;
//    //开始监听，会启动一个run loop
//    [hostReach startNotifier];
    
}
-(void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
