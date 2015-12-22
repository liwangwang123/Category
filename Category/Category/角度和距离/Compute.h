//
//  Compute.h
//  Block
//
//  Created by 王力 on 15/11/19.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Compute : NSObject

/**
 *  两点之间的距离
 *
 *  @param point1 第一个点坐标
 *  @param point2 第二个点的坐标
 *
 *  @return 距离
 */
- (double)distanceBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;

/**
 *  两个点的夹角
 *
 *  @param point1 第一个点坐标
 *  @param point2 第二个点的坐标
 *
 *  @return 夹角
 */
- (double)angleBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;

/**
 *
 *  两条线的夹角
 *  @param line1StartPoint 第一条开始的坐标
 *  @param line1EndPoint   第一条结束的坐标
 *  @param line2StartPoint 第二条开始的坐标
 *  @param line2EndPoint   第一条结束的坐标
 *
 *  @return 夹角
 */
- (double)angleBetweenLines:(CGPoint)line1StartPoint line1EndPoint:(CGPoint)line1EndPoint line2StartPoint:(CGPoint)line2StartPoint line2EndPoint:(CGPoint)line2EndPoint;
@end













