//
//  QuickSelectVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/5.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "QuickSelectVC.h"
#import "TableViewCell.h"
#import "ServerCell.h"
#import "QueryVC.h"
@interface QuickSelectVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


{
    
    CGFloat _yOffset;
}
@property(nonatomic,strong)UIScrollView *scrollView;


@property (strong, nonatomic) UITableView *mainTableView; //主
@property (strong, nonatomic) UITableView *subTableView; //次
@property (strong, nonatomic) NSArray *cityList; //城市列表
@property (assign, nonatomic) NSIndexPath *selIndex;//主列表当前选中的行
@property (assign, nonatomic) NSIndexPath *subSelIndex;//子列表当前选中的行
@property (assign, nonatomic) BOOL clickRefresh;//是否是点击主列表刷新子列表,系统刚开始默认为NO
@property(nonatomic,strong)NSMutableArray *oneDataSource;
@property(nonatomic,strong)NSMutableArray *twoDataSource;
@property(nonatomic,strong)NSMutableArray *threeDataSource;
@property(nonatomic,strong)UICollectionView *subCollectionView;
@property(nonatomic,strong)UIImageView *headImg;
@end

@implementation QuickSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _selIndex = 0;
    [self createView];
//    [self loadData];
}
-(void)createView{
    
    self.scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH)];
    
    self.headImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 280*pro)];
    self.headImg.backgroundColor=[UIColor greenColor];
    //    _yOffset = self.headImg.centerY;
    
    [self.scrollView addSubview:self.headImg];
    self.scrollView.delegate=self;
    
    self.scrollView.contentSize=CGSizeMake(kScreenW, kScreenH+330*pro);
    
    [self.view addSubview:self.scrollView];
    
    
    _selIndex = 0;
    //    _province = _cityList.firstObject[@"state"]; //赋值
    
    [self.scrollView addSubview:self.mainTableView];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    
    layout.itemSize = CGSizeMake(kScreenW/2-120*pro, 120*pro);
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    // 两个cell之间的间距(10)
    layout.minimumLineSpacing = 2;         // 行之间的 间距
    layout.minimumInteritemSpacing = 2;     // 列之间的 间距
    
    
    self.subCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(260*pro, 310*pro,kScreenW-260*pro,kScreenH) collectionViewLayout:layout];
    self.subCollectionView.backgroundColor=[UIColor whiteColor];
    self.subCollectionView.delegate=self;
    self.subCollectionView.dataSource=self;
    [self .scrollView addSubview:self.subCollectionView];
    
    
    [self.subCollectionView registerClass:[ClassifyCell class] forCellWithReuseIdentifier:@"reuse"];
    
    
    [self.subCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
    
}
-(void)loadData{
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString* date = [formatter stringFromDate:[NSDate date]];
    
    NSDictionary *dic=@{@"method":@"hd100.app.quickcheck.Index",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"area":@"济南",@"sign_method":@"md5"};
    
    ZZString *md5String=[ZZString md5With:dic];
    NSLog(@"-------%@",md5String);
    NSString *sign=[ZYKMD5 getMd5_32Bit_String:md5String isUppercase:NO];
    NSLog(@"加密----%@",sign);
    NSDictionary *dict=@{@"area":@"济南"};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    
    NSString *aaaa= [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *num = [RSAUtil encryptString: aaaa publicKey:RSA_Public_key];
    
    
    
    NSDictionary *dic1=@{@"method":@"hd100.app.quickcheck.Index",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"sign_method":@"md5",@"sign":sign,@"rsadatas":num};
    NSLog(@"shijian---%@",date);
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger POST:PATH parameters:dic1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSString * success=[NSString stringWithFormat:@"%@",[diction objectForKey:@"success"]];
        
        
        NSArray *data=[diction objectForKey:@"data"];
        for (NSDictionary *dict in data) {
            [self.oneDataSource addObject:dict];
        }
        NSLog(@"---------%@",data);
        NSLog(@"第一列%@",self.oneDataSource);
        
        
        NSArray *aa=self.oneDataSource[0][@"childlist"];
        NSMutableDictionary *dictt=[[NSMutableDictionary alloc]init];
        for (NSDictionary *diccc in aa) {
            
            
            [self.twoDataSource addObject:diccc];
        }
        
        NSLog(@"第er个====%@",self.twoDataSource);
        
        [self.mainTableView reloadData];
        [self.subCollectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark-------tableViewDelegate-----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    return self.oneDataSource.count;
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuse = @"reuseID1";
    QuickCheckCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[QuickCheckCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    
    if (indexPath.row==0) {
        cell.leftLb.hidden=NO;
        cell.titleLb.textColor=[UIColor orangeColor];
    }
    else{
        cell.leftLb.hidden=YES;
    }
    
//    NSDictionary *data=self.oneDataSource[indexPath.row];
//    [cell.iconImg sd_setImageWithURL:[NSURL URLWithString:[data objectForKey:@"picurl"]]];
//    
//    cell.titleLb.text=data[@"title"];
    cell.titleLb.text=@"ceshishi";
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100*pro;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.twoDataSource removeAllObjects];
    
    
    
    self.scrollView.contentOffset=CGPointMake(0, 310*pro);
    self.scrollView.scrollEnabled=NO;
    
    QuickCheckCell *cell1=[tableView cellForRowAtIndexPath:_selIndex];
    //        cell1.leftLb.hidden=YES;
    cell1.leftLb.backgroundColor=[UIColor clearColor];
    cell1.titleLb.textColor=[UIColor blackColor];
    
    QuickCheckCell *cell2=[tableView cellForRowAtIndexPath:indexPath];
    //        cell2.leftLb.hidden=NO;
    cell2.leftLb.backgroundColor=[UIColor orangeColor];
    cell2.titleLb.textColor=[UIColor orangeColor];
    _selIndex=indexPath;
    _clickRefresh = YES;
    
    NSArray *aa=self.oneDataSource[_selIndex.row][@"childlist"];
    
    for (NSDictionary *diccc in aa) {
        
        
        [self.twoDataSource addObject:diccc];
    }
    
    NSLog(@"足组 ======%@",self.twoDataSource);
    
    
    
    [_subCollectionView reloadData];
    
    
}

#pragma mark--------collectionDelegate--------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
//    return  self.twoDataSource.count;
    return 10;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    NSArray *aaa=[self.twoDataSource[section] objectForKey:@"childlist"];
//    return aaa.count;
//    ;
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"reuse";
    
    // 在前面注册, 注册过后, 直接去复用池拿就行了, 不用考虑拿不到的情况
    ClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    
//    NSArray *aaa=[self.twoDataSource[indexPath.section] objectForKey:@"childlist"];
//    cell.nameLb.text=[aaa[indexPath.row] objectForKey:@"title"];
    cell.nameLb.text=@"吼吼";
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((kScreenW-290*pro)/2, (kScreenW-290*pro)/2);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"view" forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW-260*pro, 60*pro)];
    
    
    UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW-260*pro, 60*pro)];
    head.backgroundColor=[UIColor whiteColor];
    
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        
//        label.text=[self.twoDataSource[indexPath.section] objectForKey:@"title"];
        label.text=@"zutou";
        
        [head addSubview:label];
        
        [headView addSubview:head];
    }
    else {
        
    }
    
    
    return headView;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenW-260*pro, 60*pro);
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat aa=scrollView.contentOffset.y;
    if (scrollView==self.scrollView) {
        if (self.scrollView.frame.origin.y<300*pro) {
            self.scrollView.contentOffset=CGPointMake(0, 310*pro);
            self.scrollView.scrollEnabled=NO;
            self.mainTableView.scrollEnabled=YES;
            self.subCollectionView.scrollEnabled=YES;
        }
        
    }
    if (scrollView==self.mainTableView) {
        //        if (scrollView.contentOffset.y>aa) {
        ////
        ////            self.scrollView.contentOffset=CGPointMake(0, 64);
        //            NSLog(@"向上滑");
        //        }
        //        else
        //        {
        //            NSLog(@"向下滑");
        //            self.scrollView.scrollEnabled=YES;
        ////            self.mainTableView.scrollEnabled=NO;
        ////            self.subCollectionView.scrollEnabled=NO;
        //            self.scrollView.contentOffset=CGPointMake(0, 64);
        ////            self.mainTableView.contentOffset=CGPointMake(0, 310*pro);
        ////            self.subCollectionView.contentOffset=CGPointMake(0, 310*pro);
        //        }
        if (scrollView.contentOffset.y==0) {
            self.scrollView.contentOffset=CGPointMake(0, 64);
        }
    }
    
    
}

-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 310*pro,260*pro,kScreenH ) style:UITableViewStylePlain];
        
        _mainTableView.delegate=self;
        _mainTableView.dataSource=self;
        _mainTableView.scrollEnabled=NO;
        [_mainTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone]; //默认
    }
    
    return _mainTableView;
}
-(UITableView *)subTableView
{
    if (!_subTableView) {
        _subTableView=[[UITableView alloc]initWithFrame:CGRectMake(260*pro, 310*pro,kScreenW-260*pro,kScreenH ) style:UITableViewStyleGrouped];
        
        
        _subTableView.delegate=self;
        _subTableView.dataSource=self;
        _subTableView.scrollEnabled=NO;
        
        
    }
    
    return _subTableView;
}

-(NSMutableArray *)oneDataSource
{
    if (!_oneDataSource) {
        _oneDataSource=[[NSMutableArray alloc]init];
    }
    return _oneDataSource;
}

-(NSMutableArray *)twoDataSource
{
    if (!_twoDataSource) {
        _twoDataSource=[[NSMutableArray alloc]init];
    }
    return _twoDataSource;
}
-(NSMutableArray *)threeDataSource
{
    if (!_threeDataSource) {
        _threeDataSource=[[NSMutableArray alloc]init];
    }
    return _threeDataSource;
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
