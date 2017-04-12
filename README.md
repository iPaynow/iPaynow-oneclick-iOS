# iPaynow-OneClickPay-iOS:一键支付
## 一、版本要求
iOS SDK要求iOS6.0及以上

## 二、接入流程
### 1.自动接入(Cocoapods方式)
#### 1).添加`podfile`文件
```
pod 'ipaynowOneClickPay','~> 1.0.9' 
```
#### 2).运行`pod install`
#### 3).使用`.xcodespace`打开工程

### 2.手动接入
##### 导入文件至工程
* IPNOneClickDESUtil.h
* IPNOneClickPayDelegate.h
* IPNOneClickPayPlugin.h
* IPNOneClickPreSignMessageUtil.h
* libIPNOneClickPayPlugin.a
* ipaynow.bundle

## 三、工程设置
一键支付页面需要隐藏`status bar`,需要在工程`info.plist`中设置`View Controller-based status bar apperance`为`No`

## 四、调用支付接口
### 1.使用`IPNOneClickPreSignMessageUtil`生成待签名订单

```objc
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];[dateFormatter setDateFormat:@"yyyyMMddHHmmss"];IPNPreSignMessageUtil *preSign=[[IPNPreSignMessageUtil alloc]init];preSign.appId=kAppId;preSign.mhtOrderNo=[dateFormatter stringFromDate:[NSDate date]]; preSign.mhtName=@"我是商户"; 
preSign.mhtOrderName=_txtOrderName.text; 
preSign.mhtOrderType=@"01";preSign.mhtCurrencyType=@"156"; 
preSign.mhtOrderAmt=_txtOrdrAmt.text; 
preSign.mhtOrderDetail=_txtOrderDetail.text; preSign.mhtOrderStartTime=[dateFormatter stringFromDate:[NSDatedate]];preSign.notifyUrl=@"http://192.168.1.154:8080/api/mchnotify";preSign.mhtReserved=_txtMhtReserved.text;preSign.userId=_txtUserId.text;NSString *originStr=[preSign generatePresignMessage];
```
此处需要在服务端对`originStr`进行签名。

### 2.调用支付插件

```objc
[IPNOneClickPayPlugin payByData:payData viewController:self delegate:self];
```

### 3.实现插件通知接口

通知协议为`IPNOneClickPayDelegate`商户需要在调起支付的`ViewController`中遵守协议

```objc
- (void)oneClickPayPluginResult:(IPNOneClickPayResult)result errorInfo:(NSString *)errorInfo;
```

`result`支付结果枚举值为:

```objc
typedef NS_ENUM(NSInteger, IPNOneClickPayResult) { 
	IPNOneClickPayResultSuccess , //成功 
	IPNOneClickPayResultFail , //失败 
	IPNOneClickPayResultCancel , //取消 
	IPNOneClickPayResultUnknown //未知};
```

## 其他设置
### 1.主题控件风格设置

```objc
+ (void)setIPNStemeColor:(UIColor *)color;
```
默认为红色

### 2.设置是否显示返回结果页

```objc
+ (void)setIsShowIPNPayResultPage:(Bool)beShowIPNPayResultPage; 
```

**详见Demo及文档**


