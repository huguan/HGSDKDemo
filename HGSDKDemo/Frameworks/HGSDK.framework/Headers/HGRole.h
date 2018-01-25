//
//  HGRole.h
//  HGSDK
//
//  Created by huguan-mac01 on 2017/9/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import <Foundation/Foundation.h>

// 事件类型
typedef enum : NSUInteger {
    HGRoleEventTypeCreateRole,  // 创建角色
    HGRoleEventTypeLogin,       // 登录游戏
    HGRoleEventTypeLevelUp,     // 等级提升
    HGRoleEventTypeChangeName,  // 更改名字
} HGRoleEventType;

@interface HGRole : NSObject
/**
 *  上报事件类型
 */
@property (nonatomic) HGRoleEventType eventType;
/**
 *  角色名称
 */
@property (nonatomic, strong) NSString *roleName;
/**
 *  角色等级
 */
@property (nonatomic, strong) NSString *roleLevel;
/**
 *  角色所在区服Id
 */
@property (nonatomic, strong) NSString *serverId;


@end
