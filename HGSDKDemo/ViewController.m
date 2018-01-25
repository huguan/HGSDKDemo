//
//  ViewController.m
//  HGSDKDemo
//
//  Created by 熙文 张 on 2016/11/07.
//  Copyright © 2016年 熙文 张. All rights reserved.
//

#import "ViewController.h"
#import <HGSDK/HGSDK.h>




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    UIImageView *bgImageView = [UIImageView new];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        [bgImageView setImage:[UIImage imageNamed:@"BG1_L"]];
    }
    else
    {
        [bgImageView setImage:[UIImage imageNamed:@"BG1"]];
    }
    [bgImageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:bgImageView];
    _bgImageView = bgImageView;
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"HG_SDK_Login_Button"];
    
    UIButton *loginButton = [UIButton new];
    [loginButton setFrame:CGRectMake(140, 140, 100, 40)];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    UIButton *payButton = [UIButton new];
    [payButton setFrame:CGRectMake(140, 200, 100, 40)];
    [payButton setTitle:@"买个皮肤" forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(payButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    
    UIButton *logOutButton = [UIButton new];
    [logOutButton setFrame:CGRectMake(140, 260, 100, 40)];
    [logOutButton setTitle:@"注销" forState:UIControlStateNormal];
    [logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logOutButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [logOutButton addTarget:self action:@selector(logOutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logOutButton];
    
    [[HGSDK sharedHGSDK] setLogoutBlock:^{
        NSLog(@"用户注销了");
    }];
}


#pragma mark --支付按钮事件--
- (void)payButtonClick {
    HGOrderModel *orderModel = [HGOrderModel new];
    [orderModel setServerId:@"serverId8"];
    [orderModel setAmount:98];
    [orderModel setRoleId:@"465689"];
    [orderModel setRoleName:@"锐雯"];
    [orderModel setProductName:@"冠军之刃"];
    [orderModel setProductDescription:@"皮肤"];
    [orderModel setOrderId:[self getOrderStringByTime]];
    [orderModel setCustomInfo:@"断剑重铸之日 骑士归来之时"];
    [orderModel setProductId:@"com.sg.chenzhan.lydg.zs9800"];
    [[HGSDK sharedHGSDK] payment:orderModel];
}


#pragma mark --登陆按钮事件--
- (void)loginButtonClick {
    [[HGSDK sharedHGSDK] hgLogin:^(HGUserModel *userModel) {
        NSString *userId    = userModel.userId;
        NSString *userName  = userModel.userName;
        NSString *sessionId = userModel.token;
        NSLog(@"userId    -- %@", userId);
        NSLog(@"userName  -- %@", userName);
        NSLog(@"sessionId -- %@", sessionId);
        
        // 初始化角色模型
        HGRole *role = [HGRole new];
        role.roleName = @"锐雯";
        role.roleLevel = @"99";
        role.serverId = @"1";
        
        // 模拟创角上报
        role.eventType = HGRoleEventTypeCreateRole;
        [[HGSDK sharedHGSDK] hgReportRole:role];
        
        // 模拟登录上报
        role.eventType = HGRoleEventTypeLogin;
        [[HGSDK sharedHGSDK] hgReportRole:role];
        
        // 模拟升级上报
        role.roleLevel = @"100";
        role.eventType = HGRoleEventTypeLevelUp;
        [[HGSDK sharedHGSDK] hgReportRole:role];
        
        // 模拟改名上报
        role.roleName = @"锐萌萌";
        role.eventType = HGRoleEventTypeChangeName;
        [[HGSDK sharedHGSDK] hgReportRole:role];
    }];
}

- (void)logOutButtonClick {
    [[HGSDK sharedHGSDK] hgLogOut];
}

- (NSString *)getOrderStringByTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddhhmmssSS"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"order:%@", dateString);
    return dateString;
}

@end
