//
//  DDImageView.h
//  DDImageView
//
//  Created by 王力 on 15/11/20.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDImageView : UIView

//image
@property (nonatomic, strong) UIImage *image;

/**
 *  图片绘制
 *
 *  @param image image
 *
 *  @return 返回绘制的图片
 */
- (instancetype)initWithImage:(UIImage *)image;

/**
 *  图片合并
 *
 *  @param image1 第一个图片
 *  @param image2 第二个图片
 *
 *  @return 第二个图片添加到第一张图片上
 */
- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;//图片合并

/**
 *  屏幕截图
 *
 *  @param theView 父视图(self.view)
 *
 *  @return image
 */
+ (UIImage *)imageFromView:(UIView *)theView;//屏幕截图

/**
 *  绘制圆形图像
 *
 *  @param oldImage 原图
 */
- (void)roundHeadOldImage:(UIImage *)oldImage backgroundColor:(UIColor *)backgroundColor;

/**
 *  绘制带圆环的圆形头像
 *
 *  @param oldImage 圆图
 */
- (void)takeTheRingHeadWithOldImage:(UIImage *)oldImage;

@end
