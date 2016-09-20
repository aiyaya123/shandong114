//
//  RemoveVC.m
//  Project114
//
//  Created by fosung_002 on 16/8/30.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "RemoveVC.h"
#import "ZZButton.h"
@interface RemoveVC ()<UITableViewDelegate,UITableViewDataSource>
{
    float tableH;
    float tableW;
    float footH;
}
@property(nonatomic,strong)UILabel *typeLb;
@property(nonatomic,strong)ZZButton *xzBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITableView *typeTabView;
@property(nonatomic,strong)NSArray *dataSource1;

@property(nonatomic,strong)UIView *alertView;
@property(nonatomic,strong)UIView *centerView;
@property(nonatomic,strong)NSArray *dataSource2;
@property(nonatomic,strong)UIImageView *selectImg;
@property(nonatomic,strong)UITextField *numText;

@end

@implementation RemoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     _dataSource2=@[@"鲁A",@"鲁B",@"鲁C",@"鲁D",@"鲁E",@"鲁F",@"鲁G",@"鲁H",@"鲁J",@"鲁K",@"鲁L",@"鲁M",@"鲁N",@"鲁P",@"鲁Q",@"鲁R",@"鲁S",@"鲁U",@"鲁Y"];
    _dataSource1=@[@"蓝色车牌",@"白色车牌",@"黑色车牌"];
    self.title=@"一键挪车";
    self.view.backgroundColor= [UIColor colorWithRed:232/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self createView];
}
-(void)createView
{
    UIView *lxView=[[UIView alloc]initWithFrame:CGRectMake(25*pro, 64+40*pro, kScreenW-50*pro, 90*pro)];
    lxView.backgroundColor=[UIColor whiteColor];
    lxView.layer.cornerRadius=6;
    lxView.layer.masksToBounds=YES;
    
    self.typeLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 0,kScreenW-100*pro , 90*pro)];
    self.typeLb.text=@"蓝色车牌（蓝底白字）";
    [lxView addSubview:self.typeLb];
    
    
    self.selectImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-100*pro, 30*pro, 30*pro, 30*pro)];
    self.selectImg.backgroundColor=[UIColor redColor];
    self.selectImg.userInteractionEnabled=YES;
    [self.selectImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectClick)]];
    
    
    [lxView addSubview:self.selectImg];
    [self.view addSubview:lxView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(25*pro,64+140*pro , kScreenW, 80*pro)];
    label.text=@"请选择挪车方式";
//    label.textColor=[UIColor lightGrayColor];
    [self.view addSubview:label];
    
    float ww=(kScreenW-400*pro)/3;
   
    NSArray *nameArr=@[@"手动输入",@"一键拨打"];
    for (int i=0; i<2; i++) {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(ww+(200*pro+ww)*i, 64+240*pro, 180*pro, 180*pro)];
        imgView.backgroundColor=[UIColor orangeColor];
        imgView.layer.cornerRadius=90*pro;
        imgView.layer.masksToBounds=YES;
        imgView.tag=1200+i;
        imgView.userInteractionEnabled=YES;
        [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgClick:)]];
        
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(ww+(200*pro+ww)*i, 64+410*pro, 200*pro, 80*pro )];
        label.text=nameArr[i];
        label.textAlignment=NSTextAlignmentCenter;
        footH=label.frame.origin.y;
        [self.view addSubview:label];
        [self.view addSubview:imgView];
    }
    
    UIImageView *footView=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenH-300*pro, kScreenW, 300*pro)];
    footView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:footView];
//    [self.view addSubview:lxView];
}
-(void)selectClick
{
    
    [self.view addSubview:self.typeTabView];
}
-(void)imgClick:(UITapGestureRecognizer *)sender
{
   
    if (sender.self.view.tag==1200) {
  
        self.alertView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenW,kScreenH)];
                                                                  
        self.alertView.backgroundColor=[UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:0.8];
        
       
        
        self.centerView=[[UIView alloc]initWithFrame:CGRectMake(100*pro, 200*pro, kScreenW-200*pro, 290*pro)];
        self.centerView.backgroundColor=[UIColor whiteColor];
        [self.alertView addSubview:self.centerView];
//        [self.centerView addSubview:_tableView];
        UILabel *titleLb=[[UILabel alloc]initWithFrame:CGRectMake(30*pro, 10*pro, kScreenW-260*pro, 70*pro)];
        titleLb.text=@"请输入需要挪车的车牌号";
        titleLb.textColor=[UIColor blackColor];
        
        UIView *numView=[[UIView alloc]initWithFrame:CGRectMake(30*pro, 90*pro, kScreenW-260*pro, 80*pro)];
        numView.backgroundColor=[UIColor blueColor];
        
        tableH=numView.frame.origin.y+100*pro;
       
//        
//        UILabel *luLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80*pro, 100*pro)];
//        luLb.text=@"鲁W";
//        luLb.textAlignment=NSTextAlignmentCenter;
//        
//        UIImageView *laImg=[[UIImageView alloc]initWithFrame:CGRectMake(80*pro, 35*pro, 30*pro, 30*pro)];
//        laImg.backgroundColor=[UIColor redColor];
        self.xzBtn=[ZZButton buttonWithType:UIButtonTypeCustom];
        self.xzBtn.frame=CGRectMake(20*pro, 0, 100*pro, 80*pro);
        [self.xzBtn addTarget:self action:@selector(centerClick) forControlEvents:UIControlEventTouchUpInside];
        [self.xzBtn setTitle:@"鲁W" forState:UIControlStateNormal];
        self.xzBtn.titleLabel.font=[UIFont systemFontOfSize:17];
        
        
        [self.xzBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.xzBtn setImage:[UIImage imageNamed:@"zhankai@2x.png"] forState:UIControlStateNormal];
        [numView addSubview:self.xzBtn];
        
        self.numText=[[UITextField alloc]initWithFrame:CGRectMake(130*pro, 0, kScreenW-390*pro, 80*pro)];
        self.numText.backgroundColor=[UIColor whiteColor];
        self.numText.placeholder=@"请输入车牌号";
        self.numText.font=[UIFont systemFontOfSize:15];
        [numView addSubview:self.numText];
        
        

        
        
        float btnW=(kScreenW-265*pro)/2;
        NSArray *nameArr=@[@"取消",@"呼叫车主"];
        for (int i=0; i<2; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
            button.frame=CGRectMake(30*pro+(btnW+10*pro)*i, 190*pro, btnW, 70*pro);
            
            button.backgroundColor=[UIColor orangeColor];
            button.layer.cornerRadius=6;
            button.layer.masksToBounds=YES;
            button.tag=1300+i;
            [button addTarget:self action:@selector(telClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:nameArr[i] forState:UIControlStateNormal];
            
            [self.centerView addSubview:button];
        }
        
        
        [self.centerView addSubview:titleLb];
        [self.centerView addSubview:numView];
        
        
         [self.view addSubview:self.alertView];
    }
    else{
    
        
    
    }

}
-(void)telClick:(UIButton *)button
{
    if (button.tag==1300) {
        [self.alertView removeFromSuperview];
    }
    else{
        if (self.numText.text.length==0) {
            [[XBToastManager ShardInstance]showtoast:@"请输入车牌号"];
            return;
        }
        button.backgroundColor=[UIColor blueColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
//        UIWebView*callWebview =[[UIWebView alloc] init];
//        NSURL *telURL =[NSURL URLWithString:@"tel:12345"];
//        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
//        [self.alertView addSubview:callWebview];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://12345"]];
    }
    
    
}
-(void)centerClick
{
    NSLog(@"dajile");
     [self.alertView addSubview:self.tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",_dataSource2.count);
    if (tableView==self.tableView) {
        return _dataSource2.count;
    }
    else{
        
        return _dataSource1.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (tableView==self.tableView) {
        cell.textLabel.text=_dataSource2[indexPath.row];
    }else{
    
        cell.textLabel.text=_dataSource1[indexPath.row];
    }
    
    
    NSLog(@"%@",_dataSource2[indexPath.row]);
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80*pro;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.tableView) {
        NSString *string=_dataSource2[indexPath.row];
        [self.xzBtn setTitle:string forState:UIControlStateNormal];
        
        [_tableView removeFromSuperview];
    }else{
    
       self.typeLb.text=_dataSource1[indexPath.row];
        
        [_typeTabView removeFromSuperview];
    
    }
    
    

}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(130*pro, 390*pro, 140*pro, 350*pro) style:UITableViewStylePlain];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;
       
        _tableView.tableFooterView=[[UIView alloc]init];
        
    }
    return _tableView;
    
}
-(UITableView *)typeTabView
{
    if (!_typeTabView) {
        _typeTabView=[[UITableView alloc]initWithFrame:CGRectMake(25*pro, 64+110*pro, kScreenW-50*pro, 350*pro) style:UITableViewStylePlain];
        
        _typeTabView.delegate=self;
        _typeTabView.dataSource=self;
        
        _typeTabView.tableFooterView=[[UIView alloc]init];

        
    }
    return _typeTabView;
    
}

-(void)selectClick:(UIButton *)button
{
    

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
