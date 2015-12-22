//
//  WLProgressBar.m
//  Test2
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "WLProgressBar.h"

#define CIRCLE_VIEW_X 40
#define CIRCLE_VIEW_Y self.frame.size.height / 2.f - 10
#define CIRCLE_VIEW_W 20
#define CIRCLE_VIEW_H 20

#define TOP_VIEW_X CIRCLE_VIEW_X + CIRCLE_VIEW_W / 2.f - 1.5f
#define TOP_VIEW_Y 0
#define TOP_VIEW_W 3
#define TOP_VIEW_H self.frame.size.height / 2.f

#define BOTTOM_VIEW_X CIRCLE_VIEW_X + CIRCLE_VIEW_W / 2.f - 1.5f
#define BOTTOM_VIEW_Y self.frame.size.height / 2.f
#define BOTTOM_VIEW_W 3
#define BOTTOM_VIEW_H self.frame.size.height / 2.f

#define CONTENT_LABEL_X 20
#define CONTENT_LABEL_Y 0
#define CONTENT_LABEL_W self.frame.size.width - CONTENT_LABEL_X - 10
#define CONTENT_LABEL_H self.frame.size.height

@implementation WLProgressBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        NSLog(@"%d", self.isPass);
            }
    return self;
}

- (void)change {
    if (self.isPass) {
        self.topView.backgroundColor = [UIColor colorWithRed:43 / 255.f green: 195 / 255.f blue: 212 / 255.f alpha:1.0];
        self.bottomView.backgroundColor = [UIColor colorWithRed:43 / 255.f green: 195 / 255.f blue: 212 / 255.f alpha:1.0];
        self.circleView.layer.borderColor = [UIColor colorWithRed:43 / 255.f green: 195 / 255.f blue: 212 / 255.f alpha:1.0].CGColor;
        self.circleView.backgroundColor = [UIColor colorWithRed:43 / 255.f green: 195 / 255.f blue: 212 / 255.f alpha:1.0];
        self.titleLabel.textColor = [UIColor redColor];
    } else {
        self.topView.backgroundColor = [UIColor colorWithRed:140 / 255.f green: 141 / 255.f blue: 142 / 255.f alpha:1.0];
        self.bottomView.backgroundColor = [UIColor colorWithRed:140 / 255.f green: 141 / 255.f blue: 142 / 255.f alpha:1.0];
        self.circleView.layer.borderColor = [UIColor colorWithRed:140 / 255.f green: 141 / 255.f blue: 142 / 255.f alpha:1.0].CGColor;
        self.circleView.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor darkTextColor];
        
    }

}
- (UIView *)topView {
    if (!_topView) {
        self.topView  = [[UIView alloc] initWithFrame:CGRectMake(TOP_VIEW_X, TOP_VIEW_Y, TOP_VIEW_W, TOP_VIEW_H)];
        //_topView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_topView];
    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        self.bottomView  = [[UIView alloc] initWithFrame:CGRectMake(BOTTOM_VIEW_X, BOTTOM_VIEW_Y, BOTTOM_VIEW_W, BOTTOM_VIEW_H)];
        //_bottomView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (UIView *)circleView {
    if (!_circleView) {
        self.circleView  = [[UIView alloc] initWithFrame:CGRectMake(CIRCLE_VIEW_X, CIRCLE_VIEW_Y, CIRCLE_VIEW_W, CIRCLE_VIEW_H)];
        //_circleView.backgroundColor = [UIColor orangeColor];
        _circleView.layer.cornerRadius = CGRectGetWidth(_circleView.frame) / 2.f;
        _circleView.layer.borderWidth = 2.f;
        [self addSubview:_circleView];
    }
    return _circleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CONTENT_LABEL_X, CONTENT_LABEL_Y, CONTENT_LABEL_W, CONTENT_LABEL_H)];
        _titleLabel.text = @"贷款申请发起成功";
        //_contentLabel.textColor = [UIColor redColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_titleLabel];

    }
    return _titleLabel;
}
@end
