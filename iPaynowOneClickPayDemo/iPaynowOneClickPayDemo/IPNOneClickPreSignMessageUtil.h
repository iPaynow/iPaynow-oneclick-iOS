//
//  IPNOneClickPreSignMessageUtil.h
//  iPaynowPluginDemo
//
//  Created by 现在 on 16/5/27.
//  Copyright © 2016年 Ipaynow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPNOneClickPreSignMessageUtil : NSObject

@property (nonatomic,strong) NSString *appId;
@property (nonatomic,strong) NSString *mhtName;
@property (nonatomic,strong) NSString *mhtOrderNo;
@property (nonatomic,strong) NSString *mhtOrderName;
@property (nonatomic,strong) NSString *mhtOrderType;
@property (nonatomic,strong) NSString *mhtCurrencyType;
@property (nonatomic,strong) NSString *mhtOrderAmt;
@property (nonatomic,strong) NSString *mhtOrderDetail;
@property (nonatomic,strong) NSString *mhtOrderStartTime;
@property (nonatomic,strong) NSString *notifyUrl;
@property (nonatomic,strong) NSString *mhtReserved;
@property (nonatomic,strong) NSString *identifyCode;

@property (nonatomic,strong) NSString *userId;

- (NSString *)generatePresignMessage;







@end
