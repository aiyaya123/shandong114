//
//  ServerVC.m
//  Project114
//
//  Created by fosung_002 on 16/9/7.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "ServerVC.h"
#import "ZZButton.h"
#import "DetailVC.h"
@interface ServerVC ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,retain)CLLocationManager *locationManager;
@end

@implementation ServerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"服务到家";
    [self createServerView];
//    [self location];
}
-(void)location{
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        NSLog(@"没有开启定位");
    }
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
        
      
        
    }];
    
    //    [self.locationManager stopUpdatingLocation];
}

-(void)createServerView{
    
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenW, 70*pro)];
    headView.backgroundColor=[UIColor lightGrayColor];
    NSArray *titleArr=@[@"附近",@"类别",@"排序"];
    for (int i=0; i<3; i++) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(((kScreenW-4*pro)/3+2*pro)*i, 0, (kScreenW-4*pro)/3, 70*pro)];
        view.backgroundColor=[UIColor whiteColor];
        ZZButton *button=[ZZButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor yellowColor];
        button.frame=CGRectMake(50*pro, 0, (kScreenW-4*pro)/3-120*pro, 70*pro);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"zhankai@2x.png"] forState:UIControlStateNormal];

        
        [view addSubview:button];
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectClick:)]];
        
        
        [headView addSubview:view];
        
    }
    [self.view addSubview:headView];
    
    UIImageView *headImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64+70*pro, kScreenW, 300*pro)];
    headImg.backgroundColor=[UIColor orangeColor];
    self.tableView.tableHeaderView=headImg;
    [self.view addSubview:self.tableView];

}


-(void)selectClick:(UITapGestureRecognizer *)getsure{
    
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID=@"reuse id";
    ServerHomeCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell=[[ServerHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    }
    cell.fenLb.hidden=YES;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 70*pro)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(15*pro, 0, kScreenW, 70*pro)];
    label.text=@"推荐商家";
    label.font=[UIFont systemFontOfSize:15];
    label.textColor=[UIColor lightGrayColor];
    view.backgroundColor=[UIColor whiteColor];
    [view addSubview:label];
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160*pro;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70*pro;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailVC *detail=[[DetailVC alloc]init];
    [self.navigationController pushViewController:detail animated:NO];

}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64+60*pro, kScreenW, kScreenH) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;

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
