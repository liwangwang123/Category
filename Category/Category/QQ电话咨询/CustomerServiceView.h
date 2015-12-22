//
//  CustomerServiceView.h
//  Category
//
//  Created by 王力 on 15/12/22.
//  Copyright © 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>
//电话客服(就是调用系统电话,拨打号码,拨打过程中会有提示)或者qq客服(直接跳转到与指定qq号的聊天界面)
//此delegate暂时无用,
@protocol CustomerServiceViewDelegate <NSObject>

- (void)customerServiceAction:(UIButton *)sender;

@end
@interface CustomerServiceView : UIView

@property (strong, nonatomic) id<CustomerServiceViewDelegate>delegate;//delegate
@end
