//
//  MainViewController.m
//  Project114
//
//  Created by fosung_002 on 16/8/4.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "MainViewController.h"
#import "HotlineVC.h"
#import "SearchVC.h"
#import "AFNetworking.h"
#import "MainModel.h"
#import "ServerVC.h"
#import "QuickSelectVC.h"
#import "DirectoryVC.h"
static CGFloat const startH = 0;
#define BXAlphaColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
@interface MainViewController ()<CLLocationManagerDelegate,UIScrollViewDelegate,ScrollImageDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UIScrollViewDelegate>
{
    UITextField *searchTF;
    NaviViewController *navi;
    float btnOrigin;
    float actOrigin;
    NSDictionary *leftDict;
    NSDictionary *rightDict1;
    NSDictionary *rightDict2;
    
}
@property(nonatomic,retain)CLLocationManager *locationManager;
@property(nonatomic,copy)NSString *cityName;
@property(nonatomic,strong)UILabel *label;

@property(nonatomic,copy)NSString *bb;
@property(nonatomic,strong)UIButton *button1;
@property(nonatomic,strong)UIButton *button2;
@property(nonatomic,strong)UIButton *button3;
@property(nonatomic,strong)ZZButton *leftBtn;
@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray *imgArr;

/** 导航条View */
@property (nonatomic, weak) UIView *navBarView;


@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSMutableArray *mainSource;
@property(nonatomic,strong)NSMutableArray *spreadSource;
@property(nonatomic,strong)NSMutableArray *shopBanSource;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor colorWithRed:218/255.0 green:211/250.0 blue:213/255.0 alpha:1];
    
    self.imgArr=[[NSMutableArray alloc]init];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self setNavView];
    [self location];
    [self loadMainData];
    [self createView];
    
    
    
}
- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.frame = CGRectMake(0, 0, kScreenW, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}
-(void)createView
{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //    layout.headerReferenceSize=CGSizeMake(kScreenW, 350*pro);
    layout.itemSize=CGSizeMake((kScreenW-2)/2, 160*pro);
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, -64, kScreenW, kScreenH+64) collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor colorWithRed:218/255.0 green:211/250.0 blue:213/255.0 alpha:1];
    
    
    [_collectionView registerClass:[ServerCell class] forCellWithReuseIdentifier:@"ServerCell"];
    [_collectionView registerClass:[JujiaCell class] forCellWithReuseIdentifier:@"JujiaCell"];
    [_collectionView registerClass:[JingxuanCell class] forCellWithReuseIdentifier:@"JingxuanCell"];
    [_collectionView registerClass:[ShopCell class] forCellWithReuseIdentifier:@"ShopCell"];
    
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view1"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view2"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"view3"];
    [self.view addSubview:_collectionView];
    
    
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0||section==2) {
        return 0;
    }
    else if(section==1)
    {
        return self.dataSource.count;
    }else if (section==4)
    {
        
        return 5;
    }
    //    else if(section==2)
    //    {
    //        return self.shopBanSource.count;
    //    }
    else{
        
        return 1;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        return CGSizeMake((kScreenW-4)/2, 160*pro);
    }
    //    else if(indexPath.section==2)
    //    {
    //         return CGSizeMake(kScreenW,220*pro);
    //
    //    }
    else if (indexPath.section==3)
    {
        
        return CGSizeMake(kScreenW, 350*pro);
    }
    else
    {
        
        NSLog(@"111111-----%f",120*pro);
        return CGSizeMake(kScreenW,150*pro);
        
    }
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==1||indexPath.section==0) {
        static NSString *identify=@"ServerCell";
        ServerCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        //        NSDictionary *dic=self.dataSource[indexPath.row];
        
        //        cell.label1.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]];
        cell.backgroundColor=[UIColor whiteColor];
        cell.model=self.dataSource[indexPath.row];
        return cell;
    }
    else if (indexPath.section==2){
        static NSString *identify=@"ShopCell";
        ShopCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        NSDictionary *dd=self.shopBanSource[indexPath.row];
        
        [cell.centImg sd_setImageWithURL:[NSURL URLWithString:[dd objectForKey:@"picurl"]]];
        cell.backgroundColor=[UIColor orangeColor];
        return cell;
        
    }
    else if (indexPath.section==3){
        
        static NSString *identify=@"JingxuanCell";
        JingxuanCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        //        cell.backgroundColor=[UIColor purpleColor];
        return cell;
    }
    else
    {
        
        static NSString *identify=@"JujiaCell";
        JujiaCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        
        return cell;
    }
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"dianji%ld",indexPath.row);
    if (indexPath.section==2 && indexPath.row==1) {
        
    }else{
        //        RemoveVC *remVC=[[RemoveVC alloc]init];
        //        [self.navigationController pushViewController:remVC animated:NO];
        QbiVC *qbi=[[QbiVC alloc]init];
        [self.navigationController pushViewController:qbi animated:NO];
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,1,1,1);
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    //    UICollectionReusableView *reusableview=nil;
    
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        
        if (indexPath.section==0) {
            UICollectionReusableView *headerView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view" forIndexPath:indexPath];
            ScrollImage *scrl = [[ScrollImage alloc] initWithCurrentController:self
                                                                     urlString:self.imgArr
                                                                     viewFrame:CGRectMake(0,0, kScreenW, 320*pro)
                                                              placeholderImage:nil];
            scrl.delegate = self;
            scrl.timeInterval = 2.0;
            [headerView addSubview:scrl.view];
            
            headerView.backgroundColor=[UIColor whiteColor];
            float btnWidth=kScreenW/4;
            float btnHeigth=btnWidth+20*pro;
            NSLog(@"main=====%@",self.mainSource);
            for (int i=0; i<self.mainSource.count; i++) {
                self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
                self.button1.frame=CGRectMake(btnWidth*(i%4), 320*pro+btnHeigth*(i/4), btnWidth, btnHeigth);
                
                UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(40*pro, 30*pro, btnWidth-80*pro, btnWidth-80*pro)];
                self.button1.tag=2000+i;
                NSDictionary *mainDic=self.mainSource[i];
                [imgView sd_setImageWithURL:[NSURL URLWithString:[mainDic objectForKey:@"icon"]]];
                
                
                
                UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0,120*pro, kScreenW/4, 45*pro)];
                
                label.text=[mainDic objectForKey:@"title"];
                label.textAlignment=NSTextAlignmentCenter;
                label.font=[UIFont systemFontOfSize:14];
                
                [self.button1 addTarget:self action:@selector(cliclMainBtn:) forControlEvents:UIControlEventTouchUpInside];
                [self.button1 addSubview:imgView];
                [self.button1 addSubview:label];
                [self.button1 becomeFirstResponder];
                
                [headerView addSubview:self.button1];
                
                if (self.button1.tag>=2004) {
                    btnOrigin=self.button1.frame.origin.y+btnHeigth;
                    
                    NSLog(@"%lf",btnOrigin);
                }
                [headerView addSubview:self.button1];
                
            }
            
            
            UILabel *aa=[[UILabel alloc]initWithFrame:CGRectMake(0, 360*pro+kScreenW/2, kScreenW, 10*pro)];
            aa.backgroundColor=[UIColor colorWithRed:218/255.0 green:211/250.0 blue:213/255.0 alpha:1];
            ;
            
            UIImageView *leftView=[[UIImageView alloc]initWithFrame:CGRectMake(0,370*pro+kScreenW/2,kScreenW/2-1*pro, 300*pro)];
            leftView.backgroundColor=[UIColor orangeColor];
            UILabel *titleLef=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 20*pro,kScreenW/4 , 40*pro)];
            titleLef.backgroundColor=[UIColor yellowColor];
            
            UILabel *detailLef=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 70*pro,kScreenW/4 , 30*pro)];
            detailLef.backgroundColor=[UIColor yellowColor];
            
            UIImageView *imgLef=[[UIImageView alloc]initWithFrame:CGRectMake(20*pro, 110*pro, kScreenW/2-40*pro, 170*pro)];
            imgLef.backgroundColor=[UIColor blueColor];
            
            [leftView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftViewClick)]];
            
            
            
            
            UIView *rightV1=[[UIView alloc]initWithFrame:CGRectMake(kScreenW/2+2*pro,370*pro+kScreenW/2, kScreenW/2-1*pro, 147*pro)];
            float viewHeight=rightV1.bounds.size.height;
            rightV1.backgroundColor=[UIColor blueColor];
            
            UILabel *titleRig1=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 20*pro,kScreenW/4 , 40*pro)];
            titleRig1.backgroundColor=[UIColor redColor];
            
            UILabel *detailRig1=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 70*pro,kScreenW/4 , 30*pro)];
            detailRig1.backgroundColor=[UIColor yellowColor];
            
            UIImageView *imgRig1=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2-200*pro, viewHeight/2, 200*pro, viewHeight/2)];
            imgRig1.backgroundColor=[UIColor redColor];
            [rightV1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftViewClick)]];
            
            UIView *rightV2=[[UIView alloc]initWithFrame:CGRectMake(kScreenW/2+2*pro,520*pro+kScreenW/2, kScreenW/2-1*pro, 147*pro)];
            rightV2.backgroundColor=[UIColor blueColor];
            UILabel *titleRig2=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 20*pro,kScreenW/4 , 40*pro)];
            titleRig2.backgroundColor=[UIColor yellowColor];
            
            UILabel *detailRig2=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 70*pro,kScreenW/4 , 30*pro)];
            detailRig2.backgroundColor=[UIColor yellowColor];
            UIImageView *imgRig2=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW/2-200*pro, viewHeight/2, 200*pro, viewHeight/2)];
            imgRig2.backgroundColor=[UIColor redColor];
            
            [rightV2 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftViewClick)]];
            NSLog(@"不失控的把2222222===%@",self.spreadSource);
            for (NSDictionary *dic in self.spreadSource) {
                NSLog(@"ccccc%@",dic);
            }
            
            titleLef.text=[leftDict objectForKey:@"title"];
            titleRig1.text=[rightDict1 objectForKey:@"title"];
            titleRig2.text=[rightDict2 objectForKey:@"title"];
            //
            detailLef.text=[leftDict objectForKey:@"title"];
            detailRig1.text=[rightDict1 objectForKey:@"title"];
            detailRig2.text=[rightDict2 objectForKey:@"title"];
            //
            [imgLef sd_setImageWithURL:[leftDict objectForKey:@"picurl"] placeholderImage:nil];
            [imgRig1 sd_setImageWithURL:[rightDict1 objectForKey:@"picurl"] placeholderImage:nil];
            [imgRig2 sd_setImageWithURL:[rightDict2 objectForKey:@"picurl"] placeholderImage:nil];
            
            
            [leftView addSubview:titleLef];
            [leftView addSubview:detailLef];
            [leftView addSubview:imgLef];
            
            [rightV1 addSubview:imgRig1];
            [rightV1 addSubview:titleRig1];
            [rightV1 addSubview:detailRig1];
            
            
            [rightV2 addSubview:imgRig2];
            [rightV2 addSubview:titleRig2];
            [rightV2 addSubview:detailRig2];
            
            
            [headerView addSubview:aa];
            [headerView addSubview:leftView];
            [headerView addSubview:rightV1];
            [headerView addSubview:rightV2];
            
            
            return headerView;
            
        }else if(indexPath.section==1){
            UICollectionReusableView *headerView1 =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view1" forIndexPath:indexPath];
            
            UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 60*pro)];
            head.backgroundColor=[UIColor whiteColor];
            
            UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW-40*pro, 60*pro)];
            titleLb.text=@"热门服务";
            
            [head addSubview:titleLb];
            [headerView1 addSubview:head];
            
            return headerView1;
            
        } else if (indexPath.section==2){
            
            UICollectionReusableView *headerView2 =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view2" forIndexPath:indexPath];
            
            headerView2.backgroundColor=[UIColor whiteColor];
            
            UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0, kScreenW-40*pro, 60*pro)];
            titleLb.text=@"114商城";
            titleLb.textColor=[UIColor lightGrayColor];
            
            UIScrollView *shopScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(20*pro, 60*pro, kScreenW-40*pro,200*pro)];
            
            float width=CGRectGetWidth(shopScrollView.frame);
            float height=CGRectGetHeight(shopScrollView.frame);
            for (int i=0; i<self.shopBanSource.count; i++) {
                UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(width*i, 0, width, height)];
                NSDictionary *dd=self.shopBanSource[i];
                
                
                [imageView sd_setImageWithURL:[NSURL URLWithString:[dd objectForKey:@"picurl"]]];
                
                
                [shopScrollView addSubview:imageView];
                shopScrollView.contentSize=CGSizeMake(CGRectGetMaxX(imageView.frame), 0);
            }
            NSLog(@"%@",NSStringFromCGSize(shopScrollView.contentSize));
            shopScrollView.pagingEnabled=YES;
            shopScrollView.contentOffset=CGPointMake(0, 0);
            //
            
            
            
            [headerView2 addSubview:titleLb];
            [headerView2 addSubview:shopScrollView];
            
            
            //            [headerView2 addSubview:head];
            
            return headerView2;
        }
        
        
        else {
            
            return nil;
        }
    }
    else
    {
        
        UICollectionReusableView *footerView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"view3" forIndexPath:indexPath];
        
        UIView *foot=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 10*pro)];
        foot.backgroundColor=[UIColor colorWithRed:218/255.0 green:211/250.0 blue:213/255.0 alpha:1];
        
        
        [footerView addSubview:foot];
        
        
        return footerView;
        
    }
    
}

-(void)scrollImage:(ScrollImage *)scrollImage clickedAtIndex:(NSInteger)index
{
    NSLog(@"dianlekouk---%ld",index);
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    
    if (section==0) {
        return CGSizeMake(kScreenW, 675*pro+kScreenW/2);
    }
    else  if (section==1 ) {
        return CGSizeMake(kScreenW, 60*pro);
    }
    else if (section==2){
        return CGSizeMake(kScreenW, 280*pro);
    }
    else{
        return CGSizeMake(kScreenW, 0);
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    return CGSizeMake(kScreenW, 10*pro);
    
    
}



-(void)cliclMainBtn:(UIButton *)button{
    
    switch (button.tag-2000) {
        case 0:{
            HotlineVC *hotVC=[[HotlineVC alloc]init];
            [self.navigationController pushViewController:hotVC animated:NO];}
            break;
        case 1:{
            QuickSelectVC *quickSelect=[[QuickSelectVC alloc]init];
            [self.navigationController pushViewController:quickSelect animated:NO];}
            break;
        case 2:{
            ServerVC *server=[[ServerVC alloc]init];
            [self.navigationController pushViewController:server animated:NO];}
            break;
        case 4:{
            RemoveVC *remove=[[RemoveVC alloc]init];
            [self.navigationController pushViewController:remove animated:NO];}
            
            break;
        case 6:{
            QbiVC *qbi=[[QbiVC alloc]init];
            [self.navigationController pushViewController:qbi animated:NO];}
            break;
        case 7:{
            DirectoryVC *quickSelect=[[DirectoryVC alloc]init];
            [self.navigationController pushViewController:quickSelect animated:NO];}
            
            break;
        default:{
            [[XBToastManager ShardInstance] showtoast:@"暂未开通此功能"];
        }
            
            break;
    }
    //    UIWebView*callWebview =[[UIWebView alloc] init];
    //    NSURL *telURL =[NSURL URLWithString:@"tel:15965318092"];
    //    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //    [self.view addSubview:callWebview];
    
    //    mapViewController *mapView=[[mapViewController alloc]init];
    //    [self.navigationController pushViewController:mapView animated:NO];
    
    //    BusViewController *mapView=[[BusViewController alloc]init];
    //    [self.navigationController pushViewController:mapView animated:NO];
    //   NaviViewController * aa1=[[NaviViewController alloc]init];
    //    GoverController *gover=[[GoverController alloc]init];
    //    [self.navigationController pushViewController:gover animated:NO];
    //    HotlineVC *hotVC=[[HotlineVC alloc]init];
    //    [self.navigationController pushViewController:hotVC animated:NO];
    
    //    QuickSelectVC *quickSelect=[[QuickSelectVC alloc]init];
    //    [self.navigationController pushViewController:quickSelect animated:NO];
    
    //    DirectoryVC *quickSelect=[[DirectoryVC alloc]init];
    //    [self.navigationController pushViewController:quickSelect animated:NO];
}
-(void)setNavView
{
    
    UIView *NavBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, kScreenW, 54*pro)];
    self.navigationItem.titleView = NavBgView;
    
    
    self.leftBtn=[ZZButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame=CGRectMake(0, 0, 50, 30);
    [self.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setTitle:@"济南" forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"zhankai@2x.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem1=[[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem1;
    
    searchTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kScreenW-150, 30)];
    searchTF.backgroundColor=[UIColor whiteColor];
    searchTF.placeholder = @"请输入关键字...";
    
    searchTF.layer.cornerRadius=5*pro;
    searchTF.font = [UIFont systemFontOfSize:14];
    searchTF.delegate = self;
    
    
    UIImageView *sImage = [[UIImageView alloc] initWithFrame:CGRectMake(30*pro, 10*pro, 45*pro, 35*pro)];
    sImage.image = [UIImage imageNamed:@"sousuo"];
    
    searchTF.leftView=sImage;
    searchTF.leftViewMode=UITextFieldViewModeAlways;
    
    [NavBgView addSubview:searchTF];
    
    
    //    UIButton *RBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    RBtn.frame = CGRectMake(0, 5, 30, 30);
    //    [RBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    //    RBtn.backgroundColor=[UIColor purpleColor];
    //    UIBarButtonItem *RItem = [[UIBarButtonItem alloc] initWithCustomView:RBtn];
    //
    //    self.navigationItem.rightBarButtonItem = RItem;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    SearchVC * searchV=[[SearchVC alloc]init];
    
    [self.navigationController pushViewController:searchV animated:YES];
}
-(void)leftViewClick
{
    
    
}
-(void)leftBtnClick
{
    CityViewController *controller = [[CityViewController alloc] init];
    controller.currentCityString = self.leftBtn.titleLabel.text;
    controller.selectString = ^(NSString *string){
        [self.leftBtn setTitle:string forState:UIControlStateNormal];
    };
    [self presentViewController:controller animated:YES completion:nil];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >startH) {
        CGFloat alpha= MIN(1, 1 - ((startH + 64 - offsetY) / 64));
        self.navBarView.backgroundColor = BXAlphaColor(253, 171, 47, alpha);
        if (alpha==1) {
            //             [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            searchTF.backgroundColor=[UIColor blueColor];
        }
        else
        {
            searchTF.backgroundColor=[UIColor whiteColor];
        }
        
        
    }else {
        //       [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.navBarView.backgroundColor = BXAlphaColor(253,171, 47, 0);
    }
    
    CGFloat down = - 250*pro - scrollView.contentOffset.y;
    if (down < 0) return;
    
    
    
    
    
}
-(void)rightBtn
{
    
    //    mapViewController *map=[[mapViewController alloc]init];
    //
    //    [self.navigationController pushViewController:map animated:YES];
    
    ServerVC *server=[[ServerVC alloc]init];
    [self.navigationController pushViewController:server animated:NO];
    
    //    CustomTableView *aa=[[CustomTableView alloc]init];
    //    [self.navigationController pushViewController:aa animated:NO];
}
-(void)location{
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    if ([CLLocationManager locationServicesEnabled]) {
        // 请求验证是否允许开启定位服务
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
        
        // 开始定位
        [self.locationManager startUpdatingLocation];
        self.locationManager.delegate=self;
        
        // 可以设置定位服务的精度
        self.locationManager.distanceFilter=kCLLocationAccuracyBest;
        
        
    }else{
        
        NSLog(@"无法定位");
        
    }
    
}

//定位代理方法
#pragma mark -coreLocation Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    
    CLLocation *location = locations[0];//取出第一个位置
    //    CLLocationCoordinate2D coordinate = location.coordinate;//位置坐标
    [_locationManager stopUpdatingLocation];
    CLGeocoder *_geocoder = [[CLGeocoder alloc] init];
    
    NSLog(@"%f,%f",location.coordinate.latitude,location.coordinate.longitude);
    
    CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    
    [_geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *place = placemarks[0];
        
        NSLog(@"name,%@",place.name);                       // 位置名
        NSLog(@"thoroughfare,%@",place.thoroughfare);       // 街道
        NSLog(@"subThoroughfare,%@",place.subThoroughfare); // 子街道
        NSLog(@"locality,%@",place.locality);               // 市
        NSLog(@"subLocality,%@",place.subLocality);         // 区
        NSLog(@"country,%@",place.country);                 // 国家
        NSLog(@"error %@",error);
        
        self.cityName = place.locality;
        NSLog(@"****%@",self.cityName);
        NSString *cccc = [self.cityName substringToIndex:[self.cityName length] - 1];
        
        [self.leftBtn setTitle:cccc forState:UIControlStateNormal];
        
    }];
    
    //    [self.locationManager stopUpdatingLocation];
}

-(void)click
{
    CityViewController *city=[[CityViewController alloc]init];
    
    [self presentViewController:city animated:YES completion:nil];
    
}
-(void)loadMainData
{
    [self.dataSource removeAllObjects];
    [self.shopBanSource removeAllObjects];
    [self.mainSource removeAllObjects];
    
    [self.spreadSource removeAllObjects];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString* date = [formatter stringFromDate:[NSDate date]];
    NSLog(@"guolellalallaal");
    NSDictionary *dic=@{@"method":@"hd100.app.Index",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"area":@"济南",@"sign_method":@"md5"};
    NSLog(@"%@",dic);
    ZZString *md5String=[ZZString md5With:dic];
    NSLog(@"-------%@",md5String);
    NSString *sign=[ZYKMD5 getMd5_32Bit_String:md5String isUppercase:NO];
    NSLog(@"加密----%@",sign);
    NSDictionary *dict=@{@"area":@"济南"};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    
    NSString *aaaa= [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *num = [RSAUtil encryptString: aaaa publicKey:RSA_Public_key];
    
    //    NSLog(@"手机号 %@",num);
    
    
    NSDictionary *dic1=@{@"method":@"hd100.app.Index",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"sign_method":@"md5",@"sign":sign,@"rsadatas":num};
    //    NSLog(@"shijian---%@",date);
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger POST:PATH parameters:dic1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //
        //        NSLog(@"denglu---%@",diction);
        
        NSDictionary *data=[diction objectForKey:@"data"];
        
        
        
        //        NSLog(@"banner%@",self.dataSource);
        for (NSDictionary *dic1 in [data objectForKey:@"banner"]) {
            NSString *imgUrl=[dic1 objectForKey:@"picurl"];
            [self.imgArr addObject:imgUrl];
        }
        for (NSDictionary *dict5 in [data objectForKey:@"spread"]) {
            [self.spreadSource addObject:dict5];
        }
        for (NSDictionary *dic2 in [data objectForKey:@"main"]) {
            [self.mainSource addObject:dic2];
            
        }
        for (NSDictionary *dict3 in [data objectForKey:@"hot"]) {
            
            HotModel *model=[[HotModel alloc]initWithDictionary:dict3 error:nil];
            [self.dataSource addObject:model];
        }
        for (NSDictionary *dict4 in [data objectForKey:@"shopbanner"]) {
            [self.shopBanSource addObject:dict4];
            
        }
        
        NSLog(@"tuiguang------%@",self.spreadSource[0]);
        leftDict=self.spreadSource[0];
        rightDict1=self.spreadSource[1];
        rightDict2=self.spreadSource[2];
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}
- (NSMutableArray *)mainSource {
    if (!_mainSource) {
        _mainSource = [[NSMutableArray alloc] init];
    }
    return _mainSource;
}
- (NSMutableArray *)shopBanSource {
    if (!_shopBanSource) {
        _shopBanSource = [[NSMutableArray alloc] init];
    }
    return _shopBanSource;
}
- (NSMutableArray *)spreadSource {
    if (!_spreadSource) {
        _spreadSource = [[NSMutableArray alloc] init];
    }
    return _spreadSource;
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
