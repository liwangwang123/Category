//
//  Compute.m
//  Block
//
//  Created by 王力 on 15/11/19.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import "Compute.h"

#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)
#define radiansToDegrees(x) (180.0 * x / pi)//根据弧度求角度

@implementation Compute

- (double)distanceBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2 {
    CGFloat X = point1.x - point2.x;
    CGFloat Y = point1.y - point2.y;
    return sqrt(X * X + Y * Y);//平方根
}

- (double)angleBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2 {
    CGFloat width = point2.y - point1.y;
    CGFloat height = point2.x - point1.x;
    CGFloat rads = atan(height / width);//弧度
    return radiansToDegrees(rads);//角度
    //在C语言的math.h或C++中的cmath中有两个求反正切的函数atan(double x)与atan2(double y,double x)  他们返回的值是弧度 要转化为角度再自己处理下。
    //前者接受的是一个正切值（直线的斜率）得到夹角，但是由于正切的规律性本可以有两个角度的但它却只返回一个，因为atan的值域是从-90~90 也就是它只处理一四象限，所以一般不用它。
    //第二个atan2(double y,double x) 其中y代表已知点的Y坐标 同理x ,返回值是此点与远点连线与x轴正方向的夹角，这样它就可以处理四个象限的任意情况了，它的值域相应的也就是-180~180了
}

- (double)angleBetweenLines:(CGPoint)line1StartPoint line1EndPoint:(CGPoint)line1EndPoint line2StartPoint:(CGPoint)line2StartPoint line2EndPoint:(CGPoint)line2EndPoint {
    CGFloat a = line1EndPoint.x - line1StartPoint.x;
    CGFloat b = line1EndPoint.y - line1StartPoint.y;
    CGFloat c = line2EndPoint.x - line2StartPoint.x;
    CGFloat d = line2EndPoint.y - line2StartPoint.y;
    CGFloat rads = acos(((a * c) + (b * d)) / ((sqrt(a * a + b * b)) * (sqrt(c * c + d * d))));
    return radiansToDegrees(rads);
}
@end











