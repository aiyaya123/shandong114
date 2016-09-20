//
//  MainViewController.h
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSearchViewDelegate <NSObject>

-(void)searchBeginEditing;
-(void)didSelectCancelBtn;
-(void)searchString:(NSString *)string;
@end


@interface CustomSearchView : UIView<UISearchBarDelegate>
@property (nonatomic,retain)UISearchBar *searchBar;
@property (nonatomic,retain)UIButton *cancelBtn;
@property (nonatomic,assign) id <CustomSearchViewDelegate>delegate;
@end


