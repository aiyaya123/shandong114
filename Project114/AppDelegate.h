//
//  AppDelegate.h
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "MainViewController.h"

#import "MineViewController.h"
#import "FoundViewController.h"
#import "SellerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(assign,nonatomic)BOOL isReachable;
-(void)createControllers;
@end

