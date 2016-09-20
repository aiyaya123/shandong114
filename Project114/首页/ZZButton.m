//
//  ZZButton.m
//  Project114
//
//  Created by fosung_002 on 16/8/19.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ZZButton.h"

@implementation ZZButton

//设置文字位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    
    return CGRectMake(0, 0, self.frame.size.width*0.5+10, self.frame.size.height);
    
}

//设置图片的位置
- (CGRect)imageRectForContentRect:(CGRect)bounds{
    
    return CGRectMake(CGRectGetMaxX(self.titleLabel.frame)-3, (self.frame.size.height-22)/2 , 22, 22);
    
}


- (id)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    
    return self;
}


@end
