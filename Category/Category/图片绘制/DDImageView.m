//
//  DDImageView.m
//  DDImageView
//
//  Created by 王力 on 15/11/20.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import "DDImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DDImageView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.image drawInRect:rect];
}

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)]) {
        self.image = image;
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

- (void)roundHeadOldImage:(UIImage *)oldImage backgroundColor:(UIColor *)backgroundColor {
    self.backgroundColor = backgroundColor;
    //void UIGraphicsBeginImageContext(CGSize size);
    //参数size为新创建的位图上下文的大小。它同时是由UIGraphicsGetImageFromCurrentImageContext函数返回的图形大小。
    //该函数的功能同UIGraphicsBeginImageContextWithOptions的功能相同，相当与UIGraphicsBeginImageContextWithOptions的opaque参数为NO,scale因子为1.0。
    
    //size——同UIGraphicsBeginImageContext
    //opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
    //scale—–缩放因子
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 1.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, oldImage.size.width, oldImage.size.height));
    CGContextClip(ctx);
    [oldImage drawInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

//等比缩放
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

//合并两张图片(第二张图片添加到第一张上面)
- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 {
    UIGraphicsBeginImageContext(image1.size);
    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    // Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (UIImage *)imageFromView:(UIView *)theView {
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//存储image
- (void)saveImage:(UIImage *)image {
    //1.存储到app得文件里
    NSString *path = [[NSHomeDirectory() stringByAppendingString:@"Documents"] stringByAppendingString:@"image.png"];
    [UIImagePNGRepresentation(image) writeToFile:path atomically:YES];
    //2.存储到手机的图片库
    
}

- (void)takeTheRingHeadWithOldImage:(UIImage *)oldImage {
    CGFloat borderW = 2;
    CGFloat imageW = oldImage.size.width + borderW * 2;
    CGFloat imageH = oldImage.size.height + borderW * 2;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 圆环
    CGFloat centerX = imageW * 0.5;
    CGFloat centerY = imageH * 0.5;
    CGContextAddArc(ctx, centerX, centerY, centerX, 0, M_PI * 2, 0);
    [[UIColor grayColor] set];
    CGContextFillPath(ctx);
    
    // 裁剪
    CGFloat radius = oldImage.size.width * 0.5;
    CGContextAddArc(ctx, centerX, centerY, radius, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    
    // 画图
    [oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = newImage;
}
@end


































