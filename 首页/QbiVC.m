//
//  QbiVC.m
//  Project114
//
//  Created by fosung_002 on 16/8/27.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "QbiVC.h"
#import "QbPayVC.h"
#import "ScrollImage.h"
#import "XBToastManager.h"
@interface QbiVC ()<UITextFieldDelegate,ScrollImageDelegate>
{
    float _price;
}

@property(nonatomic,strong)UITextField *numText;
@property(nonatomic,strong)UITextField *shuText;
@property(nonatomic,strong)UILabel *rightLb;
@property(nonatomic,strong)UIView *centView;
@property(nonatomic,strong)UILabel *priceLb;
@property(nonatomic,strong)UIButton *preButton;
@property(nonatomic,strong)NSArray *qbArr;
@property(nonatomic,strong)IQKeyboardReturnKeyHandler *returnKeyHandler;

@end

@implementation QbiVC
-(void)viewDidAppear:(BOOL)animated
{
    [_numText resignFirstResponder];
    [_shuText resignFirstResponder];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Q币充值";
    _price=9.5;
    self.qbArr=@[@10,@20,@100];
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//    self.navigationController.navigationBar.backgroundColor=[UIColor orangeColor];
    self.view.backgroundColor=[UIColor whiteColor];
    _returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc]init];
    _returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyNext;
//    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtClick)];
//    self.navigationItem.leftBarButtonItem=leftButton;
//    self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
    
    [self createView];
}
-(void)createView
{

    
    self.numText=[[UITextField alloc]initWithFrame:CGRectMake(20*pro,64+40*pro, kScreenW-40*pro, 80*pro)];
    self.numText.placeholder=@"请填写QQ号";
    self.numText.keyboardType=UIKeyboardTypeNumberPad;
    self.numText.clearButtonMode=UITextFieldViewModeWhileEditing;

    [self.view addSubview:self.numText];
    
    float btnWidth=(kScreenW-70*pro)/4;
    for (int i=0; i<4; i++) {
        UIButton *buton=[UIButton buttonWithType:UIButtonTypeSystem];
        buton.frame=CGRectMake(20*pro+(btnWidth+10*pro)*i, 64+130*pro, (kScreenW-70*pro)/4, 70*pro);
        [buton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buton.tag=1000+i;
        buton.layer.cornerRadius=6;
        buton.layer.masksToBounds=YES;
        buton.backgroundColor=[UIColor orangeColor];
        
        if (i==0) {
            self.preButton=buton;
            self.preButton.backgroundColor=[UIColor blueColor];
            [self.preButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if (i==3) {
            buton.backgroundColor=[UIColor whiteColor];
            self.shuText=[[UITextField alloc]initWithFrame:CGRectMake(50*pro+btnWidth*3, 64+130*pro, (kScreenW-70*pro)/4, 70*pro)];
            self.shuText.textAlignment=NSTextAlignmentCenter;
            self.shuText.placeholder=@"其他数额";
            self.shuText.keyboardType=UIKeyboardTypeNumberPad;
            self.shuText.delegate=self;
            [self.shuText addTarget:self action:@selector(showtextFiledContents) forControlEvents:UIControlEventEditingChanged];
            
            [self.view addSubview:self.shuText];
        }else
        {
            [buton setTitle:[NSString stringWithFormat:@"%@ Q币",_qbArr[i]] forState:UIControlStateNormal];
            [buton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
             [self.view addSubview:buton];
        }
    }
    
    self.priceLb=[[UILabel alloc]initWithFrame:CGRectMake(20*pro, 64+230*pro, kScreenW-40*pro, 80*pro)];
    self.priceLb.text=[NSString stringWithFormat:@"%.1f元(95折)",_price];
    self.priceLb.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:self.priceLb];

    UIButton *czBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    czBtn.backgroundColor=[UIColor orangeColor];
    czBtn.frame=CGRectMake(20*pro,64+340*pro , kScreenW-40*pro,80*pro);
    [czBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    [czBtn addTarget:self action:@selector(czBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *tsLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 64+430*pro, kScreenW, 70*pro)];
    tsLb.text=@"提示：小于18岁不能进行网络游戏虚拟货币交易";
    tsLb.textAlignment=NSTextAlignmentCenter;
    tsLb.font=[UIFont systemFontOfSize:14];
    
    
    NSArray *array1 = @[@"http://dl.bizhi.sogou.com/images/2012/09/30/44928.jpg", @"http://www.deskcar.com/desktop/star/world/20081017165318/27.jpg",
                        @"http://www.0739i.com.cn/data/attachment/portal/201603/09/120156l1yzzn747ji77ugx.jpg",
                        @"http://image.tianjimedia.com/uploadImages/2012/320/8N5IGLFH4HDY_1920x1080.jpg",
                       
                        ];
    ScrollImage *scrl = [[ScrollImage alloc] initWithCurrentController:self
                                                             urlString:array1
                                                             viewFrame:CGRectMake(20*pro,64+550*pro, kScreenW-40*pro, 200*pro)
                                                      placeholderImage:nil];
    
    if (array1.count==1) {
        scrl.view.userInteractionEnabled=NO;
    }
    scrl.delegate = self;
    scrl.timeInterval = 2.0;
    
    [self.view addSubview:czBtn];
    [self.view addSubview:tsLb];

    [self.view addSubview:scrl.view];
}
-(void)showtextFiledContents
{
   
    _price=[_shuText.text integerValue];
    self.priceLb.text=[NSString stringWithFormat:@"%.1f元(95折）",_price*0.95];
    
}

-(void)selectClick:(UIButton *)button
{
    self.preButton.backgroundColor=[UIColor orangeColor];
    [self.preButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.backgroundColor=[UIColor blueColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.preButton=button;
    NSLog(@"%ld",button.tag-1000);
    NSLog(@"%@",_qbArr[button.tag-1000]);
    _price=[_qbArr[button.tag-1000] integerValue];
    
//    _price=_qbArr[button.tag-1000];
    self.priceLb.text=[NSString stringWithFormat:@"%.1f元(95折）",_price*0.95];
    
}
-(void)czBtnClick
{
    if (self.numText.text.length==0) {
        [[XBToastManager ShardInstance]showtoast:@"请输入QQ号"];
        return;
    }
    QbPayVC *pay=[[QbPayVC alloc]init];
    pay.price=[NSString stringWithFormat:@"%.1f",_price*0.95];
    [self.navigationController pushViewController:pay animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
