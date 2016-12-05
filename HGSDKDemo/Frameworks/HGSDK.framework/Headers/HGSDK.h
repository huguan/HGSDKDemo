//
//  HGSDK.h
//  HGSDK
//
//  Created by 熙文 张 on 2016/11/07.
//  Copyright © 2016年 熙文 张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "HGSDKParameters.h"
#import "HGOrderModel.h"
#import "HGUserModel.h"


//! Project version number for HGSDK.
FOUNDATION_EXPORT double HGSDKVersionNumber;

//! Project version string for HGSDK.
FOUNDATION_EXPORT const unsigned char HGSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <HGSDK/PublicHeader.h>



@class HGSDKParameters;
@class HGUserModel;
@class HGOrderModel;


typedef void (^loginSuccessBlock)(HGUserModel *userModel);
typedef void (^logoutBlock)();

@interface HGSDK : NSObject

/**
 *  获取HGSDK单例
 *
 *  @return HGSDK单例对象
 */
+ (HGSDK *)sharedHGSDK;


@property (nonatomic, strong) NSString *currentSessionId;

@property (nonatomic, strong) NSString *currentUserName;

@property (nonatomic, copy) loginSuccessBlock loginSuccessBlock;

@property (nonatomic, copy) logoutBlock logoutBlock;

/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param key       游戏密钥
 *  @param cpid      合作商编号
 *  @param channelId 游戏渠道
 */
- (void)hgInitWithSDKParameters:(HGSDKParameters *)sdkParameters;


/**
 *   用户登陆
 *
 *  @param successBlock 登陆成功回调
 */
- (void)hgLogin:(loginSuccessBlock)successBlock;


/**
 *  支付
 *
 *  @param orderInfo    订单信息
 *  @param successBlock 成功回调
 *  @param hgLoginOut   失败回调 错误码和错误信息
 */
- (void)payment:(HGOrderModel *)orderInfo
        success:(void (^)())successBlock
        failure:(void (^)(HGSDKErrorFailed errcode, NSString *errorMessage))errorBlock;



/**
 *  注销用户回调
 *
 *  @param logoutBlock 回调
 */
- (void)setLogoutBlock:(logoutBlock)logoutBlock;

@end

