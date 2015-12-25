//
//  Heaper.h
//  Test1
//
//  Created by 王力 on 15/12/25.
//  Copyright © 2015年 王力. All rights reserved.
//

#import <Foundation/Foundation.h>

//http://www.tuicool.com/articles/6RNnqaI#c-14913 (博客地址)
@interface WLEncryption : NSObject

//MD5(不可逆加密, 生成一串不可逆的密文，经常用其效验数据传输过程中是否经过修改，因为相同的生成算法对于同一明文只会生成唯一的密文，若相同算法生成的密文不同，则证明传输数据进行过了修改)
+ (NSString *) md5:(NSString *)str;

//Base64(不是加密,只是编码方式)
+ (NSString *)base64StringFromText:(NSString *)text;
+ (NSString *)textFromBase64String:(NSString *)base64;
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

//DES加密
+(NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes;

//DES解密
+(NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;

//AES加密
+ (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;

//AES解密
+ (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;


/*
 //使用方法
 //MD5
 NSString *md5Str = [WLEncryption md5:@"我爱你"];
 NSLog(@"md5Str is %@",md5Str);//Log is 4F2016C6B934D55BD7120E5D0E62CCE3
 
 //Base64
 NSString *Base64Str = [WLEncryption base64StringFromText:@"我爱你"];
 NSLog(@"Base64Str is %@",Base64Str);//Log is 5oiR54ix5L2g
 
 NSString *oriBase64Str = [WLEncryption textFromBase64String:Base64Str];
 NSLog(@"oriBase64Str is %@",oriBase64Str);//Log is  我爱你
 
 //DES
 NSString *desEnStr = [WLEncryption encryptSting:@"我爱你" key:@"521" andDesiv:@"521"];
 NSLog(@"desEnStr is %@",desEnStr);//Log is  389280aa791ee933
 NSString *desDeStr =[WLEncryption decryptWithDESString:desEnStr key:@"521" andiV:@"521"];
 NSLog(@"desDeStr is %@",desDeStr);//Log is  我爱你
 
 //AES
 NSData *aesEnData = [WLEncryption AES128EncryptWithKey:@"521" iv:@"521" withNSData:[@"我爱你" dataUsingEncoding:NSUTF8StringEncoding]];
 NSString *aesEnStr = [WLEncryption base64EncodedStringFrom:aesEnData];
 NSLog(@"aesEnStr is %@",aesEnStr);//Log is HZKhnRLlQ8XjMjpelOAwsQ==
 
 NSData *aesDeData = [WLEncryption AES128DecryptWithKey:@"521" iv:@"521" withNSData:aesEnData];
 NSString *aesDEStr = [WLEncryption base64EncodedStringFrom:aesDeData];
 NSString *result = [WLEncryption textFromBase64String:aesDEStr];
 NSLog(@"aesDEStr is %@ and result is %@",aesDEStr,result);//Log is aesDEStr is 5oiR54ix5L2gAAAAAAAAAA== and result is 我爱你

 */
@end
