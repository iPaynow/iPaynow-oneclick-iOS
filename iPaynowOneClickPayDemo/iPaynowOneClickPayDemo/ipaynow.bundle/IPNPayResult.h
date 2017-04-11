//
//  IPNPayResult.h
//  IPNOneClickPayPlugin
//
//  Created by Aslan on 23/3/16.
//  Copyright © 2016 ipaynow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IPNPayResultCode) {
    IPNPayResultSuccess   ,  //成功
    IPNPayResultFail           ,  //失败
    IPNPayResultNetError,     // 网络错误
    IPNPayResultCancel      ,  //取消
    IPNPayResultUnknown     //未知
};

@interface IPNPayResult : NSObject

@property (nonatomic, strong) NSString *resultMsg;
@property (nonatomic, assign) IPNPayResultCode resultCode;

@end
