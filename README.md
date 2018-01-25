# 互冠iOS正版SDK客户端说明文档
==============
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/seven/HGSDKDemo/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=fla)](https://www.apple.com/nl/ios/)&nbsp;


演示项目
==============
查看并运行 `HGSDKDemo/HGSDKDemo.xcodeproj`


使用
==============


1. 下载 HGSDKDemo 文件夹内的所有内容。<br/>
<img src="https://raw.githubusercontent.com/huguan/HGSDKDemo/master/Snapshots/path.png"><br/>
2. 将 Frameworks 内的HGSDK.framework和HGSDK.xcassets添加(拖放)到你的工程目录中。
<img src="https://raw.githubusercontent.com/huguan/HGSDKDemo/master/Snapshots/ProductPath.png"><br/>

3. 在对应项目Targets下找到General，在Embedded Binaries链接 frameworks:
<img src="https://raw.githubusercontent.com/huguan/HGSDKDemo/master/Snapshots/framework.png"><br/>

选择互冠项目下的info.plist右键选择Open As -> Source Code
在最下面添加如下代码
```xml
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
	<key>NSCameraUsageDescription</key>
	<string>APP需要您的授权才能使用相机</string>
	<key>NSPhotoLibraryAddUsageDescription</key>
	<string>APP需要您的授权才能使用相册</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>APP需要您的授权才能使用相册</string>
```

<img src="https://raw.githubusercontent.com/huguan/HGSDKDemo/master/Snapshots/Infoplist.png"><br/>

如果使用微信分享功能，请在URL Types中添加对应的URL Schemes
<img src="https://raw.githubusercontent.com/huguan/HGSDKDemo/master/Snapshots/URLTypes.png"><br/>
4. 导入 `<HGSDK/HGSDK.h>`。<br/>
5. 初始化SDK。并更改对应的参数

#### 初始化SDK

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[HGSDKParameters sharedHGSDKParameters] setGameId:@"37"];
    [[HGSDKParameters sharedHGSDKParameters] setSecretKey:@"91b44lkdfeirf6ad596b4e71b76ff07f"];
    [[HGSDKParameters sharedHGSDKParameters] setChannelId:@"9"];
    [[HGSDKParameters sharedHGSDKParameters] setCpId:@"343"];
    [[HGSDKParameters sharedHGSDKParameters] setWxAppId:@"wx7dsfsd5867ea4dddd3"];
    [[HGSDK sharedHGSDK] hgInitWithSDKParameters:[HGSDKParameters sharedHGSDKParameters]];
    return YES;
}
```

#### 登陆方法

```objective-c
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
```

#### 支付方法

```objective-c
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
```


#### 用户注销回调方法

```objective-c
[[HGSDK sharedHGSDK] setLogoutBlock:^{
    NSLog(@"用户注销了");
}];
```

#### 微信跳转回调

```objective-c
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([sourceApplication isEqualToString:@"com.tencent.xin"])
    {
        return [[HGSDK sharedHGSDK] handleOpenURL:url];
    }
    return YES;
}
```

#### 横竖屏支持

```objective-c
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return [[HGSDK sharedHGSDK] supportedInterface];
}
```

系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 7.0`。

许可证
==============
HGSDK 使用 MIT 许可证，详情见 LICENSE 文件。



