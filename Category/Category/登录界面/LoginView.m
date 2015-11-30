//
//  LoginView.m
//  Loan
//
//  Created by 王力 on 15/11/30.
//  Copyright (c) 2015年 王力. All rights reserved.
//

#import "LoginView.h"

#define HEADER_VIEW_X 110
#define HEADER_VIEW_Y 80
#define HEADER_VIEW_W 100
#define HEADER_VIEW_H 100

#define NAME_Label_X HEADER_VIEW_X
#define NAME_Label_Y HEADER_VIEW_Y + HEADER_VIEW_H
#define NAME_Label_W HEADER_VIEW_W
#define NAME_Label_H 30

#define NAME_TEXT_FIELD_X 30
#define NAME_TEXT_FIELD_Y NAME_Label_Y + NAME_Label_H + 30
#define NAME_TEXT_FIELD_W 320 - NAME_TEXT_FIELD_X * 2
#define NAME_TEXT_FIELD_H 40

#define PASSWORD_TETX_FIELD_X NAME_TEXT_FIELD_X
#define PASSWORD_TETX_FIELD_Y NAME_TEXT_FIELD_Y + NAME_TEXT_FIELD_H + 10
#define PASSWORD_TETX_FIELD_W NAME_TEXT_FIELD_W
#define PASSWORD_TETX_FIELD_H NAME_TEXT_FIELD_H

#define DYNAMIC_PASSWORD_BTN_X PASSWORD_TETX_FIELD_X
#define DYNAMIC_PASSWORD_BTN_Y PASSWORD_TETX_FIELD_Y + PASSWORD_TETX_FIELD_H + 20
#define DYNAMIC_PASSWORD_BTN_W 120
#define DYNAMIC_PASSWORD_BTN_H 32

#define REMEMBER_PASSWORD_LABEL_X PASSWORD_TETX_FIELD_X + PASSWORD_TETX_FIELD_W - 80
#define REMEMBER_PASSWORD_LABEL_Y PASSWORD_TETX_FIELD_Y + PASSWORD_TETX_FIELD_H + 20
#define REMEMBER_PASSWORD_LABEL_W 80
#define REMEMBER_PASSWORD_LABEL_H 32

#define CLICK_BOX_X REMEMBER_PASSWORD_LABEL_X - 5 - REMEMBER_PASSWORD_LABEL_H / 2.0
#define CLICK_BOX_Y REMEMBER_PASSWORD_LABEL_Y + REMEMBER_PASSWORD_LABEL_H / 4.0
#define CLICK_BOX_W REMEMBER_PASSWORD_LABEL_H / 2.0
#define CLICK_BOX_H REMEMBER_PASSWORD_LABEL_H / 2.0

#define LOGIN_BTN_X PASSWORD_TETX_FIELD_X
#define LOGIN_BTN_Y 568 - 50 - 40
#define LOGIN_BTN_W 320 - PASSWORD_TETX_FIELD_X * 2.0
#define LOGIN_BTN_H 40

#define REGISTERED_BTN_X LOGIN_BTN_X
#define REGISTERED_BTN_Y LOGIN_BTN_Y - 30.0
#define REGISTERED_BTN_W LOGIN_BTN_W
#define REGISTERED_BTN_H 30

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnKeyboard:)];
        [self addGestureRecognizer:tap];
        self.backgroundColor = [UIColor lightGrayColor];
        self.headerView.backgroundColor = [UIColor clearColor];
        self.nameLabel.text = @"名字";
        self.nameTextField.placeholder = @"请输入用户名";
        self.nameTextField.delegate = self;
        self.passwordTextField.placeholder = @"请输入密码";
        self.passwordTextField.delegate = self;
        [self.getDynamicPasswordBtn setTitle:@"获取动态密码" forState:UIControlStateNormal];
        [self.getDynamicPasswordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.clickBox.backgroundColor = [UIColor lightGrayColor];
        self.rememberPasswordLabel.text = @"记住密码";
        self.registeredBtn.text = @"还没有账号? 免费获取";
        [self.loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        _nextTextfieldFrame = CGRectMake(0, 0, 0, 0);
    }
    return self;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    _keyboardFrame = [keyboardBoundsValue CGRectValue];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    CGFloat space = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(moveTextfieldView:)]) {
        [self.delegate moveTextfieldView:space];
    }
    _nextTextfieldFrame = CGRectMake(0, 0, 0, 0);
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    CGRect textFielFrame = textField.frame;//当前textField的frame
    CGFloat keyboardHeight = _keyboardFrame.size.height;//键盘弹出的高度
    CGFloat height = self.frame.size.height - keyboardHeight;//总高度减去键盘的高度
    height = height - CGRectGetMaxY(textFielFrame);//剩余高度减去当前textField的(self.textField.frame.origin.y + self.textField.frame.size.height)
#warning 50是两个相邻的textField的Y的间距
    height = 50 - height;
    CGFloat space = 0.0;
    if (height > 0) {
        space = - height;
    }
    if (_nextTextfieldFrame.origin.y == 0) {
        if (textFielFrame.origin.y == self.nameTextField.frame.origin.y) {
            if (height > 0) {
                space = - height;
            } else {
                space = 0;
            }
        }
    } else {
        space =_nextTextfieldFrame.origin.y - textFielFrame.origin.y;
        //NSLog(@"%f", space);
    }
    //采红菱
    if (self.delegate && [self.delegate respondsToSelector:@selector(moveTextfieldView:)]) {
        [self.delegate moveTextfieldView:space];
    }
    _nextTextfieldFrame = textField.frame;
    return YES;
}
- (void)returnKeyboard:(UITapGestureRecognizer *)tap {
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (UIImageView *)headerView {
    if (!_headerView) {
        self.headerView = [[UIImageView alloc] initWithFrame:CGRectMake(HEADER_VIEW_X, HEADER_VIEW_Y, HEADER_VIEW_W, HEADER_VIEW_H)];
        _headerView.image = [UIImage imageNamed:@"人物像"];
        _headerView.layer.cornerRadius = HEADER_VIEW_H / 2.0;
        [self addSubview:_headerView];
    }
    return _headerView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(NAME_Label_X, NAME_Label_Y, NAME_Label_W, NAME_Label_H)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(NAME_TEXT_FIELD_X, NAME_TEXT_FIELD_Y, NAME_TEXT_FIELD_W, NAME_TEXT_FIELD_H)];
        _nameTextField.backgroundColor = [UIColor whiteColor];
        _nameTextField.layer.cornerRadius = 5;
        _nameTextField.layer.masksToBounds = YES;
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, NAME_TEXT_FIELD_H)];
        aView.backgroundColor = [UIColor whiteColor];
        aView.layer.masksToBounds = YES;
        aView.layer.cornerRadius = 5;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录头像"]];
        imageView.frame = CGRectMake(10, 7.5, 20, 25);
        [aView addSubview:imageView];
        _nameTextField.leftView = aView;
        _nameTextField.leftViewMode = UITextFieldViewModeAlways;
        [self addSubview:_nameTextField];
    }
    return _nameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(PASSWORD_TETX_FIELD_X, PASSWORD_TETX_FIELD_Y, PASSWORD_TETX_FIELD_W, PASSWORD_TETX_FIELD_H)];
        _passwordTextField.backgroundColor = [UIColor whiteColor];
        _passwordTextField.layer.cornerRadius = 5;
        _passwordTextField.layer.masksToBounds = YES;
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, NAME_TEXT_FIELD_H)];
        aView.backgroundColor = [UIColor whiteColor];
        aView.layer.masksToBounds = YES;
        aView.layer.cornerRadius = 5;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码锁"]];
        imageView.frame = CGRectMake(10, 7.5, 20, 25);
        [aView addSubview:imageView];
        _passwordTextField.leftView = aView;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        [self addSubview:_passwordTextField];
    }
    return _passwordTextField;
}

- (UIButton *)getDynamicPasswordBtn {
    if (!_getDynamicPasswordBtn) {
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
        aButton.frame = CGRectMake(DYNAMIC_PASSWORD_BTN_X, DYNAMIC_PASSWORD_BTN_Y, DYNAMIC_PASSWORD_BTN_W, DYNAMIC_PASSWORD_BTN_H);
        [aButton setTintColor:[UIColor darkGrayColor]];
        aButton.userInteractionEnabled = YES;
        [aButton addTarget:self action:@selector(getDynamicPasswordBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        aButton.backgroundColor = [UIColor lightGrayColor];
        _getDynamicPasswordBtn = aButton;
        [self addSubview:_getDynamicPasswordBtn];
    }
    return _getDynamicPasswordBtn;
}
- (void)getDynamicPasswordBtnAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(getDynamicPasswordBtnAction:)]) {
        [self.delegate getDynamicPasswordBtnAction:sender];
        NSLog(@"获取动态密码");
    }
}

- (UILabel *)rememberPasswordLabel {
    if (!_rememberPasswordLabel) {
        self.rememberPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(REMEMBER_PASSWORD_LABEL_X, REMEMBER_PASSWORD_LABEL_Y, REMEMBER_PASSWORD_LABEL_W, REMEMBER_PASSWORD_LABEL_H)];
        _rememberPasswordLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_rememberPasswordLabel];
    }
    return _rememberPasswordLabel;
}

- (UIView *)clickBox {
    if (!_clickBox) {
        self.clickBox = [[UIView alloc] initWithFrame:CGRectMake(CLICK_BOX_X, CLICK_BOX_Y, CLICK_BOX_W, CLICK_BOX_H)];
        _clickBox.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _clickBox.layer.borderWidth = 2;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rememberAction:)];
        [_clickBox addGestureRecognizer:tap];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"对勾"]];
        imageView.frame = CGRectMake(0, 0, CLICK_BOX_W, CLICK_BOX_H);
        _isRememberPassword = 1;
        imageView.hidden = _isRememberPassword;
        _rememberPasswordImage = imageView;
        [_clickBox addSubview:_rememberPasswordImage];
        [self addSubview:_clickBox];
    }
    return _clickBox;
}

- (void)rememberAction:(UITapGestureRecognizer *)tap {
    _isRememberPassword = !_isRememberPassword;
    _rememberPasswordImage.hidden = _isRememberPassword;
    if (self.delegate && [self.delegate respondsToSelector:@selector(rememberAction:)]) {
        [self.delegate rememberAction:_isRememberPassword];
        
        //NSLog(@"记住密码");
    }
}

- (UILabel *)registeredBtn {
    if (!_registeredBtn) {
        self.registeredBtn = [[UILabel alloc] init];
        _registeredBtn.userInteractionEnabled = YES;
        _registeredBtn.frame = CGRectMake(REGISTERED_BTN_X, REGISTERED_BTN_Y, REGISTERED_BTN_W, REGISTERED_BTN_H);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registeredAction:)];
        [_registeredBtn addGestureRecognizer:tap];
        _registeredBtn.textAlignment = NSTextAlignmentLeft;
        _registeredBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:_registeredBtn];
        
    }
    return _registeredBtn;
}
- (void)registeredAction:(UITapGestureRecognizer *)tap {
    if (self.delegate && [self.delegate respondsToSelector:@selector(registeredAction:)]) {
        [self.delegate registeredAction:tap];
        NSLog(@"点击注册");
    }
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(LOGIN_BTN_X, LOGIN_BTN_Y, LOGIN_BTN_W, LOGIN_BTN_H);
        //[_loginBtn setTitle:@"Button" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:80 / 255.0 blue:77 / 255.0 alpha:1.0];
        [self addSubview:_loginBtn];
    }
    return _loginBtn;
}
- (void)loginBtnAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginBtnAction:)]) {
        [self.delegate loginBtnAction:sender];
        NSLog(@"登录");
    }
}
@end
