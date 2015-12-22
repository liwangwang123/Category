//
//  ViewController.m
//  Category
//
//  Created by 王力 on 15/11/2.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+TwoDimensionCode.h"
#import "CustomerServiceView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //二维码
    UIImage *image = [UIImage imageOfQRFromURL:@"www.baidu.com" codeSize:10];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 100, 100)];
    view.image = image;
    [self.view addSubview:view];
    
    //咨询
    CustomerServiceView *customer = [[CustomerServiceView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200)];
    [self.view addSubview:customer];
}
- (IBAction)animationAction:(UIButton *)sender {
    NSLog(@"跳转");
}
- (IBAction)action:(UIButton *)sender {
    NSLog(@"跳转");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
