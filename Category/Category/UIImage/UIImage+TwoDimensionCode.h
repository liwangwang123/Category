//
//  UIImage+TwoDimensionCode.h
//  Tap
//
//  Created by 王力 on 15/11/2.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TwoDimensionCode)

//下面的方法和UIImage使用是一样的,1.初始化 2.添加imageView上 3.imageView添加到supView
/**
 *  创建黑白二维码 根据urlString和codeSize
 *
 *  @param networkAddress 网址
 *  @param codeSize       不知道什么玩意从0.1---1000都没有看出来变化
 *
 *  @return 二维码图
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress codeSize: (CGFloat)codeSize;

/**
 *  生成彩色二维码
 *
 *  @param networkAddress 网址
 *  @param codeSize       codeSize
 *  @param red            R
 *  @param green          G
 *  @param blue           B
 *
 *  @return 彩色二维码 空余部位是透明色
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue;

/**
 *  中间带有头像的彩色二维码
 *
 *  @param networkAddress 网址
 *  @param codeSize       codeSize
 *  @param red            R
 *  @param green          G
 *  @param blue           B
 *  @param insertImage    头像图片
 *  @param roundRadius    圆角
 *
 *  @return 中间带有头像的彩色二维码
 */
+ (UIImage *)imageOfQRFromURL: (NSString *)networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue insertImage: (UIImage *)insertImage roundRadius: (CGFloat)roundRadius;
@end
