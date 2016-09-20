//
//  DirectoryVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/19.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "DirectoryVC.h"

@interface DirectoryVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *foldArray;
@end

@implementation DirectoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"114查号";
    self.view.backgroundColor=[UIColor whiteColor];
    [self createDirectView];
}
-(void)createDirectView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
       layout.itemSize=CGSizeMake((kScreenW-5)/3, 75*pro);
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64) collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor colorWithRed:218/255.0 green:211/250.0 blue:213/255.0 alpha:1];
    
    
    [_collectionView registerClass:[DirectoryCell class] forCellWithReuseIdentifier:@"DirectoryCell"];
   [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
     [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
    [self.view addSubview:_collectionView];
     

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSNumber *number=self.foldArray[section];
    BOOL isOPen=number.boolValue;
    return isOPen?3:12;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"DirectoryCell";
    DirectoryCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
   cell.nameLb.text=@"水电暖然";
    
    return cell;

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,1,1,1);
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
         UICollectionReusableView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
         UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 75*pro)];
         head.backgroundColor=[UIColor whiteColor];
         UIImageView *headImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 280*pro)];
         
         UIImageView *iconImg=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 20*pro, 35*pro, 35*pro)];
         iconImg.backgroundColor=[UIColor redColor];
         
         UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(70*pro, 0, kScreenW-60*pro, 75*pro)];
         label.font=[UIFont systemFontOfSize:14];
         label.textColor=[UIColor greenColor];
         label.text=@"生活服务";
         
         [head addSubview:iconImg];
         [head addSubview:label];
         [headerView addSubview:head];
         return headerView;
     }
    else
    {
        UICollectionReusableView *footerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot" forIndexPath:indexPath];
        
        UIView *foot=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 60*pro)];
        foot.backgroundColor=[UIColor whiteColor];
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2-15*pro, 15*pro, 30*pro, 30*pro)];
        imgView.backgroundColor=[UIColor redColor];
     
        [footerView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        //添加tag值
        footerView.tag=500+indexPath.section;

        [foot addSubview:imgView];
        [footerView addSubview:foot];
        return footerView;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(kScreenW,77*pro);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
   
        return CGSizeMake(kScreenW, 65*pro);
  
}
-(void)tapAction:(UITapGestureRecognizer *)tap

{
    
    
    
    //tap.view.tag-baseTag;
    NSNumber *number=self.foldArray[tap.view.tag-500];
    BOOL isOPen=number.boolValue;
    //改变状态数组中某一组的状态
    [self.foldArray replaceObjectAtIndex:tap.view.tag-500 withObject:@(!isOPen)];
    
  
    
    [_collectionView reloadData];
    
}
-(NSMutableArray *)foldArray
{
    if (!_foldArray) {
        _foldArray=[NSMutableArray array];
        
        //这个数组需要存什么内容？
        //每个组的状态
        for (int i=0; i<4; i++) {
            
            //初始化的时候，给数组中填充一些默认的状态
            [_foldArray addObject:@(YES)];
        }
    }
    return _foldArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
