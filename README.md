# Category


扩展类集合
UIImage+TwoDimensionCode.h

二维码的生成

    说明

        /**
            创建黑白二维码 根据urlString和codeSize
            *
            @param networkAddress 网址
            @param codeSize 不知道什么玩意从0.1—1000都没有看出来变化
            *
            @return 二维码图
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize;

            /**
            生成彩色二维码
            *
            @param networkAddress 网址
            @param codeSize codeSize
            @param red R
            @param green G
            @param blue B
            *
            @return 彩色二维码 空余部位是透明色
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue;
        /**
            中间带有头像的彩色二维码
            *
            @param networkAddress 网址
            @param codeSize codeSize
            @param red R
            @param green G
            @param blue B
            @param insertImage 头像图片
            @param roundRadius 圆角
            *
            @return 中间带有头像的彩色二维码
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue insertImage: (UIImage *)insertImage roundRadius: (CGFloat)roundRadius;

Compute.h

平面图形的计算

    说明

        /**
            两点之间的距离
            *
            @param point1 第一个点坐标
            @param point2 第二个点的坐标
            *
            @return 距离
            */
        -(double)distanceBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;

            /**
            两个点的夹角
            *
            @param point1 第一个点坐标
            @param point2 第二个点的坐标
            *
            @return 夹角
            */
        -(double)angleBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;
        /**
        *
            两条线的夹角
            @param line1StartPoint 第一条开始的坐标
            @param line1EndPoint 第一条结束的坐标
            @param line2StartPoint 第二条开始的坐标
            @param line2EndPoint 第一条结束的坐标
            *
            @return 夹角
            */
        -(double)angleBetweenLines:(CGPoint)line1StartPoint line1EndPoint:(CGPoint)line1EndPoint line2StartPoint:(CGPoint)line2StartPoint line2EndPoint:(CGPoint)line2EndPoint;




