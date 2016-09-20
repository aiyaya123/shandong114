//
//  RecommendCell.m
//  Project114
//
//  Created by fosung_002 on 16/8/27.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "RecommendCell.h"

@implementation RecommendCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor blueColor];
        
        _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro,10*pro ,100*pro,100*pro)];
        _imgView.backgroundColor=[UIColor orangeColor];
        
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(140*pro, 0, kScreenW-160*pro, 120*pro)];
        _titleLb.text=@"期末考试来临了，让孩子掌握这些答题技巧，能让孩子考试时会事半功倍!";
        _titleLb.numberOfLines=0;
        
        
        [self addSubview:_imgView];
        [self addSubview:_titleLb];
    }
    return self;

}
@end
