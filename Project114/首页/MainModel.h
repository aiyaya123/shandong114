//
//  MainModel.h
//  Project114
//
//  Created by fosung_002 on 16/9/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "JSONModel.h"

@interface MainModel : JSONModel

@end


@interface HotModel : MainModel

@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *title;


@end



@interface JujiaModel : MainModel



@end