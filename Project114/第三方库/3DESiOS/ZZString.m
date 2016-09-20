//
//  ZZString.m
//  paixu
//
//  Created by fosung_002 on 16/8/15.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ZZString.h"

@implementation ZZString
+(id)md5With:(NSDictionary *)dictionary
{
    NSArray *keys = [dictionary allKeys];
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSString *str=@"";
    for (NSString *categoryId in sortedArray) {
        NSString *value=[dictionary objectForKey:categoryId];
        
        str=[str stringByAppendingFormat:@"%@%@",categoryId,value];
    }
    
    NSLog(@"%@",str);
    return str;
}
@end
