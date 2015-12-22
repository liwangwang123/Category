//
//  WLProgressBarBargroundView.h
//  Test2
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLProgressBarBackgroundView : UIView

@property (nonatomic) NSInteger subViewNumber;//查询步骤
@property (nonatomic) NSInteger subViewIsPassNumber;//通过几个步骤

- (void)addSubViews;//添加子视图

/*
 //使用方法
 WLProgressBarBackgroundView *background = [[WLProgressBarBackgroundView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
 background.subViewNumber = 4;
 background.subViewIsPassNumber = 3;
 [self.view addSubview:background];
 [background addSubViews];
 */
@end
