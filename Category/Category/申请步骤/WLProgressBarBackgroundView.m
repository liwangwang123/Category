//
//  WLProgressBarBargroundView.m
//  Test2
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "WLProgressBarBackgroundView.h"
#import "WLProgressBar.h"

@implementation WLProgressBarBackgroundView

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
        self.layer.shadowOffset = CGSizeMake(1, 1);
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 1;
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;

        
    }
    return self;
}

- (void)addSubViews {
    for (int i = 0; i < self.subViewNumber; i++) {
        WLProgressBar *bar = [[WLProgressBar alloc] initWithFrame:CGRectMake(0, self.frame.size.height / self.subViewNumber * i, self.frame.size.width, self.frame.size.height / self.subViewNumber)];
        if (i == 0) {
            bar.topView.hidden = YES;
        }
        if (i == self.subViewNumber - 1) {
            bar.bottomView.hidden = YES;
        }
        if (i < self.subViewIsPassNumber) {
            bar.isPass = YES;
        } else {
            bar.isPass = NO;
        }
        [bar change];
        [self addSubview:bar];
    }

}

//    WLProgressBar *bar = [[WLProgressBar alloc] initWithFrame:CGRectMake(100, 200, 300, 60)];
//    bar.isPass = YES;
//    [bar change];
//    [self.view addSubview:bar];
@end
