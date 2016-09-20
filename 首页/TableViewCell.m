//
//  TableViewCell.m
//  Project114
//
//  Created by fosung_002 on 16/8/29.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 15*pro, 90*pro, 90*pro)];
        _imgView.backgroundColor=[UIColor greenColor];
        
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(130*pro, 15*pro, 150*pro, 40*pro)];
        _nameLb.text=@"微信支付";
        _nameLb.font=[UIFont systemFontOfSize:16];
        _nameLb.backgroundColor=[UIColor yellowColor];
        
        
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(130*pro, 60*pro, kScreenW-170*pro, 30*pro)];
        _titleLb.text=@"推荐安装微信5.0及以上版本的用户使用";
        _titleLb.font=[UIFont systemFontOfSize:14];
        
        
        _selImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-70*pro, 40*pro, 50*pro, 50*pro)];
        _selImg.backgroundColor=[UIColor redColor];
        
        [self addSubview:_imgView];
        [self addSubview:_nameLb];
        [self addSubview:_titleLb];
        [self addSubview:_selImg];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end


@implementation QuickCheckCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _leftLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10*pro, 100*pro)];
        _leftLb.backgroundColor=[UIColor orangeColor];
        
        _iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(25*pro, 30*pro, 40*pro, 40*pro)];

        
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(65*pro, 0, 180*pro,100*pro)];
       
        _titleLb.textAlignment=NSTextAlignmentCenter;
        _titleLb.font=[UIFont systemFontOfSize:15];
//       _titleLb.textColor = rgba(130, 130, 130, 1);
        _titleLb.highlightedTextColor = [UIColor orangeColor];

        
        [self addSubview:_leftLb];
        [self addSubview:_iconImg];
        [self addSubview:_titleLb];
        
    
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithWhite:0 alpha:0.1];
    self.highlighted = selected;
    _titleLb.highlighted = selected;
    _leftLb.hidden = !selected;
}

@end

@implementation ServerHomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 10*pro,140*pro, 140*pro)];
        _iconImg.backgroundColor=[UIColor orangeColor];
        
        
        
        _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(180*pro, 20*pro, 300*pro, 30*pro)];
        
        _titleLb.font = [UIFont systemFontOfSize:15];
        
        _titleLb.text=@"平安家政";
        
        _starImg=[[UIImageView alloc]initWithFrame:CGRectMake(180*pro, 60*pro, 150*pro, 30*pro)];
        _starImg.backgroundColor=[UIColor yellowColor];
        
        float x = CGRectGetMaxX(_starImg.frame);

        _fenLb=[[UILabel alloc]initWithFrame:CGRectMake(x+10*pro, 60*pro, 80*pro, 30*pro)];
        _fenLb.text=@"3.5分";
        _fenLb.font=[UIFont systemFontOfSize:14];
        _fenLb.textColor=[UIColor orangeColor];
        
        
        _locaLb=[[UILabel alloc]initWithFrame:CGRectMake(180*pro, 100*pro, 180*pro, 30*pro)];
        _locaLb.text=@"八一立交桥";
        _locaLb.textColor=[UIColor lightGrayColor];
        _locaLb.font = [UIFont systemFontOfSize:14];
        
      
        
        _numLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-300*pro, 60*pro, 280*pro, 30*pro)];
        _numLb.text=@"10000人浏览";
         _numLb.textColor=[UIColor lightGrayColor];
        _numLb.textAlignment=NSTextAlignmentRight;
        _numLb.font=[UIFont systemFontOfSize:14];
        
        
        _distanceLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-120*pro, 100*pro, 100*pro, 30*pro)];
        _distanceLb.text=@"200m";
         _distanceLb.textColor=[UIColor lightGrayColor];
        _distanceLb.textAlignment=NSTextAlignmentRight;
        _distanceLb.font=[UIFont systemFontOfSize:14];
        
        [self addSubview:_starImg];
        [self addSubview:_iconImg];
        [self addSubview:_titleLb];
        [self addSubview:_locaLb];
        [self addSubview:_numLb];
        [self addSubview:_distanceLb];
        [self addSubview:_fenLb];
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

@implementation ProductCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 10*pro,140*pro, 140*pro)];
        _iconImg.backgroundColor=[UIColor orangeColor];
        
        
        
        _nameLb = [[UILabel alloc] initWithFrame:CGRectMake(180*pro, 25*pro, 300*pro, 30*pro)];
        _nameLb.font = [UIFont systemFontOfSize:15];
        _nameLb.text=@"平安家政";
        
        _priceLb=[[UILabel alloc]initWithFrame:CGRectMake(180*pro,60*pro , 300*pro, 60*pro)];
        _priceLb.text=@"¥180元";
        _priceLb.textColor=[UIColor orangeColor];
        _priceLb.font=[UIFont systemFontOfSize:18];
         float x = CGRectGetMaxX(_priceLb.frame);
       
        _yuanLb=[[UILabel alloc]initWithFrame:CGRectMake(180*pro, 120*pro, 260*pro, 30*pro)];
        _yuanLb.text=@"门市价：200元";
        _yuanLb.font=[UIFont systemFontOfSize:13];
        
        
        _soldLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-160*pro, 120*pro, 140*pro, 30*pro)];
        _soldLb.text=@"已售:200次";
        _soldLb.font=[UIFont systemFontOfSize:13];
        _soldLb.textAlignment=NSTextAlignmentRight;
        
        [self addSubview:_iconImg];
        [self addSubview:_nameLb];
        
        [self addSubview:_priceLb];
        [self addSubview:_yuanLb];
        
        [self addSubview:_soldLb];

        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

@implementation CommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _icon=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 35*pro,110*pro, 110*pro)];
        _icon.backgroundColor=[UIColor orangeColor];
        
        
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(150*pro, 20*pro, 300*pro, 30*pro)];
        _name.font = [UIFont systemFontOfSize:15];
        _name.text=@"爱妃的咖啡";
        
        _date=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-220*pro,20*pro , 200*pro, 30*pro)];
        _date.text=@"2016-11-11";
        _date.textAlignment=NSTextAlignmentRight;
        _date.font=[UIFont systemFontOfSize:15];
        
        
        _star=[[UIImageView alloc]initWithFrame:CGRectMake(150*pro, 65*pro, 180*pro, 30*pro)];
        _star.backgroundColor=[UIColor yellowColor];
        
        
        _detail=[[UILabel alloc]initWithFrame:CGRectMake(150*pro, 105*pro, kScreenW-170*pro, 70*pro)];
        _detail.text=@"在线翻译，一般是指在线翻译工具，如百度翻译，阿里翻译1688或Google翻译等";
        _detail.font=[UIFont systemFontOfSize:13];
        _detail.numberOfLines=0;
        
        
        [self addSubview:_icon];
        [self addSubview:_name];
        
        [self addSubview:_date];
        [self addSubview:_star];
        
        [self addSubview:_detail];
        
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


@implementation InfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _placeLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, 360*pro, 110*pro)];
        _placeLb.text=@"市中区八一银座碑林海威广场小区一号楼商铺";
        _placeLb.font=[UIFont systemFontOfSize:14];
        _placeLb.numberOfLines=0;
        
        _mapImg=[[UIImageView alloc]initWithFrame:CGRectMake(370*pro, 40*pro, 30*pro, 30*pro)];
        _mapImg.backgroundColor=[UIColor redColor];
        
        _distLb=[[UILabel alloc]initWithFrame:CGRectMake(410*pro, 35*pro,90*pro,40*pro)];
        _distLb.text=@"200m";
        _distLb.font=[UIFont systemFontOfSize:14];
        
        
        _lineLb=[[UILabel alloc]initWithFrame:CGRectMake(510*pro, 15*pro, 1*pro, 80*pro)];
        _lineLb.backgroundColor=[UIColor lightGrayColor];
        
        _telImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-100*pro, 15*pro, 80*pro,80*pro)];
        _telImg.backgroundColor=[UIColor greenColor];
        
        
        
        [self addSubview:_placeLb];
        [self addSubview:_mapImg];
        
        [self addSubview:_distLb];
        [self addSubview:_lineLb];
        
        [self addSubview:_telImg];
        
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

