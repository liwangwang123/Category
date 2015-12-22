//
//  AnimationsController.m
//  Category
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "AnimationsController.h"

@interface AnimationsController () <UIWebViewDelegate>

@end

@implementation AnimationsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//客服qq（在安装qq的情况下，直接跳转到与指定的qq号聊天的界面）
- (IBAction)CustomerService:(UIButton *)sender {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURL *url = [NSURL URLWithString:@"mqq://im/chat?chat_type=wpa&uin=2317790024&version=1&src_type=web"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

//拨打电话,有弹出框,挂机之后回到应用里面
- (IBAction)Cell:(UIButton *)sender {
    //方法1
    if ([sender.titleLabel.text isEqualToString:@"Call1"]) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"10010"];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    }
    //方法2
    if ([sender.titleLabel.text isEqualToString:@"Call2"]) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"10010"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    
}

//翻转
- (IBAction)flipAcion:(UIButton *)sender {
    [UIView beginAnimations:@"flip" context:nil];//开始
    [UIView setAnimationDuration:2.f];//时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//淡入淡出方式
    [UIView setAnimationDelegate:self];//delegate
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.imageView cache:YES];//添加
    [UIView commitAnimations];//提交动画
    
    
}

//旋转
- (IBAction)rotatingAction:(UIButton *)sender {
    //放射变换
    CGAffineTransform transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
    [UIView beginAnimations:@"rotating" context:nil];
    [UIView setAnimationDuration:2.f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [self.imageView setTransform:transform];
    [UIView commitAnimations];
    
}

//移动
- (IBAction)moveAction:(UIButton *)sender {
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:2.f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    CGRect frame = self.imageView.frame;
    frame.origin.x = frame.origin.x + 10;
    self.imageView.frame = frame;
    [UIView commitAnimations];
}

//翻页
- (IBAction)turnPageAction:(UIButton *)sender {
    [UIView beginAnimations:@"turnPage" context:nil];
    [UIView setAnimationDelay:2.f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.imageView cache:YES];
    [UIView commitAnimations];
}

//缩放
- (IBAction)scaleAction:(UIButton *)sender {
    CGAffineTransform transform = CGAffineTransformMakeScale(1.2, 1.2);
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:2.f];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:1.5];//1.5会回到初始大小
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    self.imageView.transform = transform;
    [UIView commitAnimations];
    
}

//取反(应该是和你之前的操作效果相反)
- (IBAction)InvertAction:(UIButton *)sender {
    CGAffineTransform transform;
    transform = CGAffineTransformInvert(self.imageView.transform);
    [UIView beginAnimations:@"Invert" context:nil];
    [UIView setAnimationDelay:2.f];
    [UIView setAnimationDelegate:self];
    [self.imageView setTransform:transform];
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
