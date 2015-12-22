//
//  LoginView.h
//  Loan
//
//  Created by 王力 on 15/11/30.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)getDynamicPasswordBtnAction:(UIButton *)sender;//获取动态密码
- (void)rememberAction:(BOOL)isRememberPassword;//记住密码
- (void)registeredAction:(UITapGestureRecognizer *)tap;//点击注册
- (void)loginBtnAction:(UIButton *)sender;//点击登录按钮
- (void)moveTextfieldView:(CGFloat)space;//移动父视图,防止被键盘遮挡

@end

@interface LoginView : UIView <UITextFieldDelegate> {
    CGRect _keyboardFrame;      //键盘的frame
    CGRect _nextTextfieldFrame; //上一个textField的frame
    BOOL   _isRememberPassword; //记住密码
}

@property (nonatomic, strong) UIImageView       *headerView;//头像
@property (nonatomic, strong) UILabel           *nameLabel;//姓名
@property (nonatomic, strong) UITextField       *nameTextField;//用户名
@property (nonatomic, strong) UITextField       *passwordTextField;//密码
@property (nonatomic, strong) UIButton          *getDynamicPasswordBtn;//获取动态密码

//记住密码
@property (nonatomic, strong) UIView            *clickBox;
@property (nonatomic, strong) UIImageView       *rememberPasswordImage;
@property (nonatomic        ) BOOL              isRememberPassword;

//记住密码
@property (nonatomic, strong) UILabel           *rememberPasswordLabel;
//注册
@property (nonatomic, strong) UILabel           *registeredBtn;
//登录
@property (nonatomic, strong) UIButton          *loginBtn;

@property (nonatomic, weak  ) id<LoginViewDelegate> delegate;

@end
