//
//  ZTLoginView.m
//  yoal
//
//  Created by 李 延彬 on 15-8-10.
//  Copyright (c) 2015年 Seven2One. All rights reserved.
//

#import "ZTLoginView.h"
#import "UITextField+Extension.h"
#import "ZTTextField.h"

@interface ZTLoginView () {
    UIImageView *_iconView; //图标
    ZTTextField *_phoneNum; //手机号
    ZTTextField *_correctCode; //验证码
    UIButton *_sendCodeBtn; //发送验证码
    UILabel *_zoneNume; //区号
}

@end
@implementation ZTLoginView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
      UIView* __tmpView = [super hitTest:point withEvent:event];
    if (__tmpView == self) {
        return nil;
    }
    return __tmpView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    // yoal图标
    _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    [self addSubview:_iconView];
    // 手机号
    _phoneNum = [[ZTTextField alloc] initWithFrame:CGRectZero type:ZTTextFieldTypePhone];
    _zoneNume = [[UILabel alloc] init];
    _zoneNume.text = @"+86";
    _zoneNume.textColor = [UIColor whiteColor];
    [_phoneNum setLeftView:_zoneNume];
    [_phoneNum setLeftViewMode:UITextFieldViewModeAlways];
    NSDictionary *attr = @{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    [_phoneNum setBorderStyle:UITextBorderStyleBezel];
    _phoneNum.layer.cornerRadius = 20;
    _phoneNum.layer.borderWidth = 1;
    _phoneNum.layer.borderColor = [UIColor lightGrayColor].CGColor;
    // 设置手机号的placeholder
    [_phoneNum setupPlaceholderWithText:@"请输入手机号" attr:attr];
    [self addSubview:_phoneNum];
    
    // 验证码
    _correctCode = [[ZTTextField alloc] initWithFrame:CGRectZero type:ZTTextFieldTypeCorrectCode];
    _sendCodeBtn = [[UIButton alloc] init];
    [_sendCodeBtn setTitle:@"发送验证短信" forState:UIControlStateNormal];
    [_sendCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_correctCode setRightView:_sendCodeBtn];
    [_correctCode setRightViewMode:UITextFieldViewModeAlways];
    [_correctCode setBorderStyle:UITextBorderStyleBezel];
    _correctCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _correctCode.layer.cornerRadius = 20;
    _correctCode.layer.borderWidth = 1;

    _correctCode.contentMode = UIViewContentModeCenter;
    // 设置验证码的placeholder
    [_correctCode setupPlaceholderWithText:@"请输入验证码" attr:attr];
    [self addSubview:_correctCode];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat bigMargin = 50; // 图标和手机号之间的间距
    CGFloat smallMargin = 10; // 手机号和验证码之间的间距
    _iconView.center = CGPointMake(self.centerX, self.height * 0.3);
    // 手机号的frame
    _phoneNum.frame = CGRectMake(0, 0,kScreenSize.width * 0.8, _iconView.height * 0.8);
    _phoneNum.center = CGPointMake(self.centerX, CGRectGetMaxY(_iconView.frame) + bigMargin);
  
    _zoneNume.size = CGSizeMake(_phoneNum.width * 0.2, _phoneNum.height);
    _zoneNume.textAlignment = NSTextAlignmentCenter;
    // 验证码的frame
    CGFloat corCodeX = _phoneNum.x;
    CGFloat corCodeY = CGRectGetMaxY(_phoneNum.frame) + smallMargin;
    _correctCode.frame = CGRectMake(corCodeX,corCodeY,_phoneNum.width, _phoneNum.height);
    _sendCodeBtn.size = CGSizeMake(_correctCode.width * 0.4, _correctCode.height);
    _sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
}
@end
