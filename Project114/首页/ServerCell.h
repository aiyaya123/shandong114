//
//  ServerCell.h
//  Project114
//
//  Created by fosung_002 on 16/8/22.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotModel;
@interface ServerCell : UICollectionViewCell

@property(nonatomic,strong)HotModel *model;
@end


@interface JujiaCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *titleLb;
@property(nonatomic,strong) UIImageView *rzImg;
@property(nonatomic,strong) UIImageView *starImg;
@property(nonatomic,strong) UILabel *fenLb;
@property(nonatomic,strong) UILabel *numLb;
@property(nonatomic,strong) UILabel *cityLb;

@end

@interface JingxuanCell : UICollectionViewCell

@property(nonatomic,strong) UILabel *lableTitle;
@property(nonatomic,strong) UIImageView *imgae1;
@property(nonatomic,strong) UIImageView *imgae2;
@property(nonatomic,strong) UILabel *shuLb;
@property(nonatomic,strong) UILabel *zixunLb;
@property(nonatomic,strong) UILabel *wzLb;

@end

@interface ShopCell : UICollectionViewCell


@property(nonatomic,strong) UIImageView *centImg;


@end


@interface ClassifyCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong)UILabel *nameLb;
@end


@interface DirectoryCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *nameLb;

@end


