//
//  MainViewController.h
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResultCityControllerDelegate <NSObject>

-(void)didScroll;
-(void)didSelectedString:(NSString *)string;

@end

@interface ResultCityController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)NSMutableArray *dataArray;
@property (nonatomic,retain)UITableView *tableView;
@property (nonatomic,assign) id <ResultCityControllerDelegate>delegate;
@end
