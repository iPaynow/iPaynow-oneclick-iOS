//
//  IPNOneClickPayPlugin.h
//  IPNOneClickPayPlugin
//
//  Created by 刘宁 on 15/10/12.
//  Copyright © 2015年 ipaynow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPNOneClickPayDelegate.h"

@interface IPNOneClickPayPlugin : NSObject


/**
 *  设置主题颜色
 *
 *  @param color default color is 0xC51821
 */
+ (void)setIPNStemeColor:(UIColor *)color;


/**
 *  设置支付完成后显示支付结果页面(YES)，还是回到最初页面(NO)
 *
 *  @param beShowIPNPayResultPage default value is YES
 */
+ (void)setIsShowIPNPayResultPage:(BOOL)beShowIPNPayResultPage;


/**
 *  调起支付
 *
 *  @param payData        支付参数字符串
 *  @param viewController viewController description
 *  @param delegate       delegate description
 *
 *  @return 成功与否
 */
+ (BOOL)payByData:(NSString*)payData viewController:(UIViewController*)viewController delegate:(id<IPNOneClickPayDelegate>)delegate;



@end
