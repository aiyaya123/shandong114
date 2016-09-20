//
//  ZJButton.m
//  Project114
//
//  Created by fosung_002 on 16/9/6.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ZJButton.h"

static CGFloat kImageScale = 0.64f;

@implementation ZJButton

#pragma mark -
#pragma mark lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置文字字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        // 设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 调整图片
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


- (void)setHighlighted:(BOOL)highlighted{}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat pointX = 0;
    CGFloat pointY = contentRect.size.height * (kImageScale+0.03);
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kImageScale-0.03);
    return CGRectMake(pointX, pointY, width, height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat pointX = 0;
    CGFloat pointY = 0;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * kImageScale;
    return CGRectMake(pointX, pointY, width, height);
}


@end
