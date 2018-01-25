//
//  HGSDKParameters.h
//  HGSDK
//
//  Created by 熙文 张 on 2016/11/08.
//  Copyright © 2016年 熙文 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGSDKParameters : NSObject

/**
 *  获取HGSDK参数单例
 *
 *  @return HGSDK参数单例对象
 */
+ (HGSDKParameters *)sharedHGSDKParameters;

/**
 *  合作商编号
 */
@property (nonatomic, strong) NSString *cpId;

/**
 *  互冠gameID
 */
@property (nonatomic, strong) NSString *gameID;

/**
 *  互冠payKey
 */
@property (nonatomic, strong) NSString *payKey;

/**
 *  互冠appKey
 */
@property (nonatomic, strong) NSString *appKey;

/**
 *  互冠subID
 */
@property (nonatomic, strong) NSString *subID;

/**
 *  WX分享ID
 */
@property (nonatomic, strong) NSString *wxAppId;
/**
 *  talkingDataAppID
 */
@property (nonatomic, strong) NSString *tdAppId;


/**
 *  DataEye AppID
 */
@property (nonatomic, strong) NSString *deAppId;

/**
 *  TTTracker AppID
 */
@property (nonatomic, strong) NSString *ttAppId;

@end
