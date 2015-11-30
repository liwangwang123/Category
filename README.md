# Category


扩展类集合
UIImage+TwoDimensionCode.h

二维码的生成

    说明

        /**
            创建黑白二维码 根据urlString和codeSize
            *
            @param networkAddress 网址
            @param codeSize 不知道什么玩意从0.1—1000都没有看出来变化
            *
            @return 二维码图
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize;

            /**
            生成彩色二维码
            *
            @param networkAddress 网址
            @param codeSize codeSize
            @param red R
            @param green G
            @param blue B
            *
            @return 彩色二维码 空余部位是透明色
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue;
        /**
            中间带有头像的彩色二维码
            *
            @param networkAddress 网址
            @param codeSize codeSize
            @param red R
            @param green G
            @param blue B
            @param insertImage 头像图片
            @param roundRadius 圆角
            *
            @return 中间带有头像的彩色二维码
            */
        +(UIImage )imageOfQRFromURL: (NSString )networkAddress codeSize: (CGFloat)codeSize red: (NSUInteger)red green: (NSUInteger)green blue: (NSUInteger)blue insertImage: (UIImage *)insertImage roundRadius: (CGFloat)roundRadius;

Compute.h

平面图形的计算

    说明

        /**
            两点之间的距离
            *
            @param point1 第一个点坐标
            @param point2 第二个点的坐标
            *
            @return 距离
            */
        -(double)distanceBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;

            /**
            两个点的夹角
            *
            @param point1 第一个点坐标
            @param point2 第二个点的坐标
            *
            @return 夹角
            */
        -(double)angleBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2;
        /**
        *
            两条线的夹角
            @param line1StartPoint 第一条开始的坐标
            @param line1EndPoint 第一条结束的坐标
            @param line2StartPoint 第二条开始的坐标
            @param line2EndPoint 第一条结束的坐标
            *
            @return 夹角
            */
        -(double)angleBetweenLines:(CGPoint)line1StartPoint line1EndPoint:(CGPoint)line1EndPoint line2StartPoint:(CGPoint)line2StartPoint line2EndPoint:(CGPoint)line2EndPoint;


Timer.h

时间处理

    说明

        /**
            倒计时显示
            *
           @param timeout 倒计时间
           这个方法里面只有对时间的处理,没有显示视图,需要根据具体要求,具体处理
            */
        - (void)countdownCounterStart:(NSInteger)timeout;


LoginView.h
=============

代理方法
----------
@protocol LoginViewDelegate <NSObject>//代理

- (void)getDynamicPasswordBtnAction:(UIButton *)sender;//获取动态密码
- (void)rememberAction:(BOOL)isRememberPassword;//记住密码
- (void)registeredAction:(UITapGestureRecognizer *)tap;//点击注册
- (void)loginBtnAction:(UIButton *)sender;//点击登录按钮
- (void)moveTextfieldView:(CGFloat)space;//移动父视图,防止被键盘遮挡

@end

属性
-----
@interface LoginView : UIView <UITextFieldDelegate> {
    CGRect _keyboardFrame;//键盘的frame
    CGRect _nextTextfieldFrame;//上一个textField的frame
    BOOL   _isRememberPassword;//记住密码
}

tap @property (nonatomic, strong) UIImageView       *headerView;//头像 tap
tap@property (nonatomic, strong) UILabel           *nameLabel;//姓名tap
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

使用方法:
LoginView *login = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _login.delegate = self;
    [self.view addSubview:_login];
    其中有一个需要特别处理
    //移动父视图
- (void)moveTextfieldView:(CGFloat)space {
    [UIView animateWithDuration:0.5 animations:^{
        if (space == 50.0 || space == -50.0) {//第二次和之后的点击textfield ,50是两个textField的Y间距
            CGRect frame = _login.frame;
            frame.origin.y = frame.origin.y + space;
            //NSLog(@"frame1 = %f", frame.origin.y);
            _login.frame = frame;
        } else {//第一次点击textField
            CGRect frame = _login.frame;
            frame.origin.y = space;
            //NSLog(@"frame2 = %f", frame.origin.y);
            _login.frame = frame;
        }
    }];
}
