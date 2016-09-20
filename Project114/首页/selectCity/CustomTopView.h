//
//  MainViewController.h
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTopViewDelegate <NSObject>

-(void)didSelectBackButton;

@end

@interface CustomTopView : UIView
@property (nonatomic,assign) id <CustomTopViewDelegate>delegate;
@end
