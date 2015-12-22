//
//  CustomerServiceView.m
//  Category
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "CustomerServiceView.h"

@interface CustomerServiceView () <UIWebViewDelegate>

@end
@implementation CustomerServiceView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    NSArray *titles = @[@"10086", @"10010", @"qq客服"];
    CGSize size = self.frame.size;
    for (int i = 0; i < 3; i++) {
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
        aButton.frame = CGRectMake((size.width / 3.0) * i, 10, size.width / 3.0, 45);
        
        [aButton setTitle:titles[i] forState:UIControlStateNormal];
        [aButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [aButton addTarget:self action:@selector(customerServiceAction:) forControlEvents:UIControlEventTouchUpInside];
        aButton.layer.masksToBounds = YES;
        aButton.layer.cornerRadius = 5;
        //[aButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        //aButton setImage:[UIImage imageNamed:@"2"] forState:UIControlStateHighlighted];
        //aButton.tag = 101;
        //aButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:aButton];
    }
}
- (void)customerServiceAction:(UIButton *)sender {
//    if (self.delegate && [self.delegate respondsToSelector:@selector(customerServiceAction:)]) {
//        [self.delegate customerServiceAction:sender];
//    }
    NSString *text = sender.titleLabel.text;
    if ([text isEqualToString:@"10086"]) {
        [self cell10086];
    }
    if ([text isEqualToString:@"10010"]) {
        [self cell10010];
    }
    if ([text isEqualToString:@"qq客服"]) {
        [self customerService];
    }
    NSLog(@"点击执行%ld", sender.tag);
}


//客服qq（在安装qq的情况下，直接跳转到与指定的qq号聊天的界面）
- (void)customerService {
    //CGRectZero
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURL *url = [NSURL URLWithString:@"mqq://im/chat?chat_type=wpa&uin=2317790024&version=1&src_type=web"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
    [self addSubview:webView];
    
}

//拨打电话,有弹出框,挂机之后回到应用里面
- (void)cell10010{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"10010"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self addSubview:callWebview];
    
}
//拨打电话,有弹出框,挂机之后回到应用里面
- (void)cell10086{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"10086"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}


@end
