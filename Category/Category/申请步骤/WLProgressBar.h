//
//  WLProgressBar.h
//  Test2
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLProgressBar : UIView

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, strong) UILabel *titleLabel;//
@property (nonatomic) BOOL isPass;//是否通过

- (void)change;
@end
