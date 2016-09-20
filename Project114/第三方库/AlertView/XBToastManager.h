//
//  XBToastManager.h
//  XB
//
//

#import "MBProgressHUD.h"

//定义显示HUD的每个动作，当此东西不需要显示是值设为小于0
typedef enum
{
    HUDShowType_None = 0,
    HUDShowType_RegExistPhone ,
    HUDShowType_RegOrGetPassGetCode,
    HUDShowType_RegOrGetPassAction,
    HUDShowType_GetPassExitPhone,
    HUDShowType_LoginAction,
    HUDShowType_LogoutAction,
    HUDShowType_ChangePassAction,
    HUDShowType_GetEvaOptionAction,
    HUDShowType_EvaAction,
    HUDShowType_PickLocationAction,
    HUDShowType_SaveAddress,
    HUDShowType_DefaultAddress,
    HUDShowType_DeleteAddress
    
}HUDShowType;


@interface XBToastManager : NSObject

+ (XBToastManager *)ShardInstance;

// toast
- (void)showtoast:(NSString *)toastStr;
- (void)showtoast:(NSString *)toastStr wait:(double)wait;

// progress
- (void)hideprogress;
- (void)showprogress;
- (void)showHUD:(HUDShowType)type;






- (void)showSuccess:(NSString *)success toView:(UIView *)view;
-(void)showError:(NSString *)error toView:(UIView *)view;

- (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


- (void)showSuccess:(NSString *)success;
- (void)showError:(NSString *)error;

- (MBProgressHUD *)showMessage:(NSString *)message;
+(void)hideHUDForView:(UIView *)view;
+(void)hideHUD;

@end
