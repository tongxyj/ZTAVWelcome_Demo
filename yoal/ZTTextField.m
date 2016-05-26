//
//  ZTTextField.m
//  yoal
//
//  Created by 李 延彬 on 15-8-12.
//  Copyright (c) 2015年 Seven2One. All rights reserved.
//

#import "ZTTextField.h"
@interface ZTTextField () {
    UIView *_separa;
    ZTTextFieldType _type;
}

@end
@implementation ZTTextField

- (instancetype)initWithFrame:(CGRect)frame type:(ZTTextFieldType)type {
    if (self = [super initWithFrame:frame]) {
        UIView *separator = [[UIView alloc] init];
        separator.backgroundColor = [UIColor lightGrayColor];
        _type = type;
        _separa = separator;
        [self addSubview:separator];
    }
    return  self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat separaX = 0;
    if (_type == ZTTextFieldTypePhone) { //手机号
        separaX = self.width * 0.2;
    } else if (_type == ZTTextFieldTypeCorrectCode) { //验证码
        separaX = self.width - self.width * 0.4;
    }
    
    CGFloat separaY = margin;
    CGFloat separaH = self.height - 2 * margin;
    _separa.frame = CGRectMake(separaX, separaY, 1, separaH);
}

@end
