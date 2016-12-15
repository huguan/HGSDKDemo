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
    
    [[HGSDK sharedHGSDK] setLogoutBlock:^{
        NSLog(@"用户注销了");
    }];
}


#pragma mark --支付按钮事件--
- (void)payButtonClick
{
    HGOrderModel *orderModel = [HGOrderModel new];
    [orderModel setServerId:@"serverId8"];
    [orderModel setAmount:199];
    [orderModel setRoleId:@"465689"];
    [orderModel setRoleName:@"锐雯"];
    [orderModel setProductName:@"冠军之刃"];
    [orderModel setProductDescription:@"皮肤"];
    [orderModel setOrderId:[self getOrderStringByTime]];
    [orderModel setCustomInfo:@"断剑重铸之日 骑士归来之时"];
    [orderModel setProductId:@"com.huguan.HGFrameworksSDKDemo.Riven"];
    [[HGSDK sharedHGSDK] payment:orderModel];
}


#pragma mark --登陆按钮事件--
- (void)loginButtonClick
{
    [[HGSDK sharedHGSDK] hgLogin:^(HGUserModel *userModel) {
        NSString *userId    = userModel.userId;
        NSString *userName  = userModel.userName;
        NSString *sessionId = userModel.sessionId;
        NSLog(@"userId    -- %@", userId);
        NSLog(@"userName  -- %@", userName);
        NSLog(@"sessionId -- %@", sessionId);
    }];
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
