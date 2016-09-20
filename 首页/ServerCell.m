//
//  ServerCell.m
//  Project114
//
//  Created by fosung_002 on 16/8/22.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ServerCell.h"
#import "UIImageView+WebCache.h"
#import "MainModel.h"
@interface ServerCell ()

@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *titleLb1;
@property(nonatomic,strong)UILabel *titleLb2;

@end
@implementation ServerCell

-(void)setModel:(HotModel *)model
{
    _model=model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.titleLb1.text=model.title;
    //    self.titleLb2.text=model.desc;
    
    
    
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(20*pro,20*pro ,100*pro,110*pro)];
        
        [self.contentView addSubview:_icon];
    }
    
    return _icon;
}

- (UILabel *)titleLb1 {
    if (!_titleLb1) {
        float x = CGRectGetMaxX(self.icon.frame);
        
        _titleLb1 = [[UILabel alloc] initWithFrame:CGRectMake(x + 20*pro,40*pro,kScreenW/2-130*pro , 30*pro)];
        
        _titleLb1.font = [UIFont systemFontOfSize:15];
        
        
        [self.contentView addSubview:_titleLb1];
    }
    
    return _titleLb1;
}

- (UILabel *)titleLb2 {
    if (!_titleLb2) {
        float x = CGRectGetMaxX(self.icon.frame);
        float y=CGRectGetMaxY(self.titleLb1.frame);
        _titleLb2 = [[UILabel alloc] initWithFrame:CGRectMake(x + 20*pro,y+25*pro,kScreenW/2-130*pro , 30*pro)];
        _titleLb2.text=@"亲自结婚";
        _titleLb2.font = [UIFont systemFontOfSize:14];
        
        
        [self.contentView addSubview:_titleLb2];
    }
    
    return _titleLb2;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
@implementation JujiaCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor orangeColor];
        
        //        float width=(kScreenW-4)/2/2;
        
        _icon=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 10*pro,130*pro, 130*pro)];
        _icon.backgroundColor=[UIColor redColor];
        
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(170*pro, 20*pro, 300*pro, 30*pro)];
        _titleLb.text=@"专业开锁，10分钟上门";
        _titleLb.font=[UIFont systemFontOfSize:15];
        
        _rzImg=[[UIImageView alloc]initWithFrame:CGRectMake(480*pro, 20*pro, 100*pro, 30*pro)];
        _rzImg.backgroundColor=[UIColor yellowColor];
        
        
        _starImg=[[UIImageView alloc]initWithFrame:CGRectMake(170*pro, 60*pro, 150*pro, 30*pro)];
        
        _starImg.backgroundColor=[UIColor yellowColor];
        
        _fenLb=[[UILabel alloc]initWithFrame:CGRectMake(330*pro, 60*pro, 60*pro, 30*pro)];
        _fenLb.text=@"5.0分";
        _fenLb.font=[UIFont systemFontOfSize:13];
        
        _numLb=[[UILabel alloc]initWithFrame:CGRectMake(170*pro, 100*pro, 200*pro, 30*pro)];
        _numLb.text=@"10000人咨询";
        _numLb.font=[UIFont systemFontOfSize:13];
        
        
        _cityLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-80*pro, 100*pro, 60*pro, 30*pro)];
        _cityLb.text=@"历程";
        _cityLb.textAlignment=NSTextAlignmentRight;
        _cityLb.font=[UIFont systemFontOfSize:13];
        
        
        [self addSubview:_icon];
        [self addSubview:_titleLb];
        [self addSubview:_rzImg];
        [self addSubview:_starImg];
        [self addSubview:_fenLb];
        [self addSubview:_numLb];
        [self addSubview:_starImg];
        [self addSubview:_cityLb];
        
        
    }
    return self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end

@implementation JingxuanCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor orangeColor];
        
        //        float width=(kScreenW-4)/2/2;
        
        _lableTitle=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW-40*pro, 60*pro)];
        _lableTitle.text=@"精选·居家维修";
        _lableTitle.font=[UIFont systemFontOfSize:16];
        _lableTitle.textColor=[UIColor lightGrayColor];
        
        _imgae1=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 60*pro, kScreenW-40*pro, 200*pro)];
        _imgae1.backgroundColor=[UIColor yellowColor];
        
        
        _imgae2=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 270*pro, 200*pro, 30*pro)];
        _imgae2.backgroundColor=[UIColor yellowColor];
        
        _shuLb=[[UILabel alloc]initWithFrame:CGRectMake(230*pro, 270*pro, 100*pro, 30*pro)];
        _shuLb.text=@"5.0分";
        _shuLb.font=[UIFont systemFontOfSize:13];
        
        _zixunLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 310*pro, 200*pro, 30*pro)];
        _zixunLb.text=@"5123人咨询";
        _zixunLb.font=[UIFont systemFontOfSize:13];
        
        _wzLb=[[UILabel alloc]initWithFrame:CGRectMake(kScreenW-150*pro, 310*pro, 130*pro, 30*pro)];
        _wzLb.text=@"5123人咨询";
        _wzLb.textAlignment=NSTextAlignmentCenter;
        _wzLb.font=[UIFont systemFontOfSize:13];
        
        
        [self addSubview:_lableTitle];
        [self addSubview:_imgae1];
        [self addSubview:_imgae2];
        [self addSubview:_shuLb];
        [self addSubview:_zixunLb];
        [self addSubview:_wzLb];
        
        
        
        
        
    }
    return self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
@implementation ShopCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        
        _centImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW-40*pro,150*pro)];
        
        
        [self addSubview:_centImg];
        
    }
    return self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end



@implementation ClassifyCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        float width=(kScreenW-260*pro)/2/3;
        
        _icon=[[UIImageView alloc]initWithFrame:CGRectMake(width, 20*pro, width, width)];
        
        _icon.backgroundColor=[UIColor yellowColor];
        
        
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 40*pro+width, width*3, 30*pro)];
        _nameLb.textAlignment=NSTextAlignmentCenter;
        _nameLb.font=[UIFont systemFontOfSize:15];
        _nameLb.textColor=[UIColor lightGrayColor];
        
        
        
        [self addSubview:_icon];
        [self addSubview:_nameLb];
    }
    return self;
    
}


@end

@implementation DirectoryCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        float width=(kScreenW-260*pro)/2/3;
        
        
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenW/3, 60*pro)];
        _nameLb.textAlignment=NSTextAlignmentCenter;
        _nameLb.font=[UIFont systemFontOfSize:15];
        _nameLb.textColor=[UIColor lightGrayColor];
        
        
        [self addSubview:_nameLb];
    }
    return self;
    
}


@end




