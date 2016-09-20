//
//  RegistVC.m
//  Project114
//
//  Created by fosung_002 on 16/8/26.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "RegistVC.h"
#import "AppDelegate.h"

@interface RegistVC ()<UITextFieldDelegate>
{
    NSTimer *timer;
    int number;
    NSString *codePd;
}
@property(nonatomic,strong)UITextField *phoneText;
@property(nonatomic,strong)UITextField *codeText;
@property(nonatomic,strong)NSMutableArray *paramArr;
@property(nonatomic,strong)UIButton *codeBtn;
@property(nonatomic,strong)IQKeyboardReturnKeyHandler *returnKeyHandler;
@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor whiteColor];
    number =0;
    codePd=@"1";
    _returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc]init];
    _returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyNext;
    
    
    [self createView];
}
-(void)createView
{
    NSString *akk=[userDaults objectForKey:@"appKey"];
    NSLog(@"获取到了---%@",akk);
    self.phoneText=[[UITextField alloc]initWithFrame:CGRectMake(30*pro, 64+30*pro, kScreenW-60*pro, 60*pro)];
    self.phoneText.placeholder=@"请输入手机号";
    self.phoneText.keyboardType=UIKeyboardTypeNumberPad;
    self.phoneText.font = [UIFont systemFontOfSize:14];
    UIImageView *phoneImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60*pro, 60*pro)];
    phoneImg.backgroundColor=[UIColor greenColor];
    
    self.phoneText.leftView=phoneImg;
    self.phoneText.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:self.phoneText];
    
    
    
    
    self.codeText=[[UITextField alloc]initWithFrame:CGRectMake(30*pro, 64+110*pro, 300*pro, 60*pro)];
    self.codeText.placeholder=@"请输入验证码";
    self.codeText.keyboardType=UIKeyboardTypeNumberPad;
    self.codeText.font = [UIFont systemFontOfSize:14];
    UIImageView *codeImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60*pro, 60*pro)];
    
    codeImg.backgroundColor=[UIColor greenColor];
    self.codeText.leftView=codeImg;
    self.codeText.leftViewMode=UITextFieldViewModeAlways;
    
    [self.view addSubview:self.codeText];
    
    
    self.codeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.codeBtn.frame=CGRectMake(330*pro,64+110*pro, kScreenW-360*pro, 60*pro);
    self.codeBtn.backgroundColor=[UIColor blueColor];
    self.codeBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [self.codeBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    
    [self.codeBtn addTarget:self action:@selector(yzmClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.codeBtn];
    
    UIButton *loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame=CGRectMake(30*pro,64+200*pro,kScreenW-60*pro, 70*pro);
    loginBtn.backgroundColor=[UIColor blueColor];
    //    loginBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    UIButton *footBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    footBtn.frame=CGRectMake(0, kScreenH-70*pro, kScreenW, 70*pro);
    footBtn.backgroundColor=[UIColor whiteColor];
    [footBtn setTitle:@"进入首页" forState:UIControlStateNormal];
    [footBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [footBtn addTarget:self action:@selector(gogo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:footBtn];
    
}
-(void)gogo{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    [appDelegate createControllers];
    
}
-(void)yzmClick
{
    
    NSString *sjhStr=self.phoneText.text;
    if (sjhStr.length==11) {
        sjhStr=[sjhStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        
        if (sjhStr.length>0) {
            [[XBToastManager ShardInstance] showtoast:@"请输入正确手机号"];
        }else{
            if (number<=0) {
                [self getCode];
            }
        }
        
    }else{
        [[XBToastManager ShardInstance] showtoast:@"请输入正确手机号"];
    }
    
    
}
-(void)addTimer
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
//
-(void)nextImage
{
    number--;
    if ([codePd isEqualToString:@"1"]) {
        codePd=@"2";
        if (number==0) {
            
            number=150;
            [self.codeBtn setTitle:@"重新获得" forState:UIControlStateNormal];
            self.codeBtn.userInteractionEnabled=YES;
            
            [timer invalidate];
        }else{
            NSString *str = [NSString stringWithFormat:@"重新获得(%d)",number];
            
            [self.codeBtn setTitle:str forState:UIControlStateNormal];
            self.codeBtn.userInteractionEnabled=NO;
            
            
            
        }
        
    }else{
        if (number==0) {
            number=0;
            [self.codeBtn setTitle:@"重新获得" forState:UIControlStateNormal];
            self.codeBtn.userInteractionEnabled=YES;
            [timer invalidate];
            
            
        }else{
            NSString *str = [NSString stringWithFormat:@"重新获得(%d)",number];
            
            [self.codeBtn setTitle:str forState:UIControlStateNormal];
            self.codeBtn.userInteractionEnabled=NO;
            
        }
    }
    
}

-(void)getCode
{
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString* date = [formatter stringFromDate:[NSDate date]];
    
    
    
    
    NSDictionary *dic=@{@"method":@"hd100.app.Getcode",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"mobile":self.phoneText.text,@"sign_method":@"md5"};
    
    ZZString *md5String=[ZZString md5With:dic];
    NSLog(@"-------%@",md5String);
    NSString *sign=[ZYKMD5 getMd5_32Bit_String:md5String isUppercase:NO];
    NSLog(@"加密----%@",sign);
    NSDictionary *dict=@{@"mobile":self.phoneText.text};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    
    NSString *aaaa= [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *num = [RSAUtil encryptString: aaaa publicKey:RSA_Public_key];
    
    NSLog(@"手机号 %@",num);
    
    
    NSDictionary *dic1=@{@"method":@"hd100.app.Getcode",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"sign_method":@"md5",@"sign":sign,@"rsadatas":num};
    NSLog(@"shijian---%@",date);
    NSLog(@"shoushous%@",dic1);
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger POST:PATH parameters:dic1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSString *success=[NSString stringWithFormat:@"%@",[diction objectForKey:@"success"]];
        if ([success isEqualToString:@"1"]) {
            [[XBToastManager ShardInstance] showtoast:@"手机验证码已发送！"];
            
            if ([codePd isEqualToString:@"1"]) {
                [timer invalidate];
                [self addTimer];
                number =150;
            }else{
                [timer invalidate];
                [self addTimer];
                number =120;
            }
            
        }else{
            NSString *tishi=[NSString stringWithFormat:@"%@",[diction objectForKey:@"msg"]];
            [[XBToastManager ShardInstance] showtoast:tishi];
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}
-(NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
-(void)loginClick
{
    if (self.phoneText.text.length==0 || self.codeText.text.length==0) {
        [[XBToastManager ShardInstance] showtoast:@"请填写完整"];
        return;
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString* date = [formatter stringFromDate:[NSDate date]];
    
    NSDictionary *dic=@{@"method":@"hd100.app.Login",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"mobile":self.phoneText.text,@"sign_method":@"md5",@"code":self.codeText.text};
    
    ZZString *md5String=[ZZString md5With:dic];
    NSLog(@"-------%@",md5String);
    NSString *sign=[ZYKMD5 getMd5_32Bit_String:md5String isUppercase:NO];
    NSLog(@"加密----%@",sign);
    NSDictionary *dict=@{@"mobile":self.phoneText.text,@"code":self.codeText.text};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    
    NSString *aaaa= [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *num = [RSAUtil encryptString: aaaa publicKey:RSA_Public_key];
    
    NSLog(@"手机号 %@",num);
    
    
    NSDictionary *dic1=@{@"method":@"hd100.app.Login",@"format":@"json",@"timestamp":date,@"appkey":[userDaults objectForKey:@"appKey"],@"ver":@"1.0",@"sign_method":@"md5",@"sign":sign,@"rsadatas":num};
    NSLog(@"shijian---%@",date);
    
    AFHTTPRequestOperationManager *openmanger=[AFHTTPRequestOperationManager manager];
    openmanger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [openmanger POST:PATH parameters:dic1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *diction=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSString * success=[NSString stringWithFormat:@"%@",[diction objectForKey:@"success"]];
        NSLog(@"denglu---%@",diction);
        if ([success isEqualToString:@"1"]) {
            
            [userDaults setObject:self.phoneText.text forKey:@"mobile"];
            
            AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
            [appDelegate createControllers];
            
        }
        else
        {
            NSString *tishi=[NSString stringWithFormat:@"%@",[diction objectForKey:@"msg"]];
            [[XBToastManager ShardInstance] showtoast:tishi];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
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
