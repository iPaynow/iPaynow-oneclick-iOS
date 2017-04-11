//
//  IPNOneClickPayDelegate.h
//  IPNOneClickPayPlugin
//
//  Created by 现在 on 15/10/13.
//  Copyright © 2015年 ipaynow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IPNOneClickPayResult) {
    IPNOneClickPayResultSuccess   ,  //成功
    IPNOneClickPayResultFail           ,  //失败
    IPNOneClickPayResultNetError,     // 网络错误
    IPNOneClickPayResultCancel      ,  //取消
    IPNOneClickPayResultUnknown     //未知
};

@protocol IPNOneClickPayDelegate <NSObject>

/**
 *  支付状态回调
 *
 *  @param result 支付状态
 *  @param errorInfo 错误信息，如果正确返回nil
 */
- (void)oneClickPayPluginResult:(IPNOneClickPayResult)result errorInfo:(NSString *)errorInfo;

@end
