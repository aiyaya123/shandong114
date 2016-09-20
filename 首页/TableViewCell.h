//
//  TableViewCell.h
//  Project114
//
//  Created by fosung_002 on 16/8/29.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)UILabel *nameLb;
@property(strong,nonatomic)UILabel *titleLb;
@property(strong,nonatomic)UIImageView *selImg;
@end

@interface QuickCheckCell : UITableViewCell
@property(nonatomic,strong)UILabel *leftLb;
@property(nonatomic,strong)UIImageView *iconImg;
@property(nonatomic,strong)UILabel *titleLb;
@end

@interface ServerHomeCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImg;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIImageView *starImg;
@property(nonatomic,strong)UILabel *numLb;
@property(nonatomic,strong)UILabel *locaLb;
@property(nonatomic,strong)UIImageView *ddImg;
@property(nonatomic,strong)UILabel *distanceLb;
@property(nonatomic,strong)UILabel *fenLb;
@end

@interface ProductCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImg;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UILabel *yuanLb;
@property(nonatomic,strong)UILabel *soldLb;

@end

@interface CommentCell : UITableViewCell
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *date;
@property(nonatomic,strong)UILabel *detail;
@property(nonatomic,strong)UIImageView *star;

@end

@interface InfoCell : UITableViewCell
@property(nonatomic,strong)UIImageView *mapImg;
@property(nonatomic,strong)UILabel *placeLb;
@property(nonatomic,strong)UILabel *distLb;
@property(nonatomic,strong)UILabel *lineLb;
@property(nonatomic,strong)UIImageView *telImg;

@end
