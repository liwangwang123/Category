//
//  ProgressBarController.m
//  Category
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "ProgressBarController.h"
#import "WLProgressBarBackgroundView.h"

@interface ProgressBarController ()

@end

@implementation ProgressBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WLProgressBarBackgroundView *background = [[WLProgressBarBackgroundView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    background.subViewNumber = 4;//审核步骤
    background.subViewIsPassNumber = 3;//通过审核的步骤数
    [self.view addSubview:background];
    [background addSubViews];//添加
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
