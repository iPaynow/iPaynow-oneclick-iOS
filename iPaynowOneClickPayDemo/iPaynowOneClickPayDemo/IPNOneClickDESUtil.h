//
//  IPNOneClickDESUtil.h
//  iPaynowPluginDemo
//
//  Created by 现在 on 16/5/27.
//  Copyright © 2016年 Ipaynow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPNOneClickDESUtil : NSObject
+ (NSString *) encrypt:(NSString *)inputText;
+ (NSString *) decrypt:(NSString *)inputText;
/**
 * @brief 3DES加密方法（转Base64）.
 *
 * @param  plainText 加密原文.
 * @param  keyStr 加密秘钥.
 *
 * @return 返回base64(3DES(原文)).
 */

+ (NSString *) TripleDESEncrypt:(NSString *)plainText WithKey:(NSString *)keyStr;
+ (NSString *) TripleDESDecrypt:(NSString *)plainText WithKey:(NSString *)keyStr;

+ (NSData *) dataFromHexString:(NSString *)hexString;
+ (NSString *) hexStringFromString:(NSData *)data;
+ (NSString *) sortString:(NSString *) inputText;

/**
 * @brief Base64转码方法.
 *
 * @param  input 字符串原文.
 *
 * @return 返回Base64(原文).
 */
+ (NSString *) encodeBase64String:(NSString * )input ;
+ (NSString *) decodeBase64String:(NSString * )input ;

/**
 * @brief MD5加密方法.
 *
 * @param  inPutText 明文字符串.
 *
 * @return 返回MD5(原文).
 */
+ (NSString *) md5Encrypt: (NSString *) inPutText;
@end
