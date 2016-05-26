//
//  ZTTextField.h
//  yoal
//
//  Created by 李 延彬 on 15-8-12.
//  Copyright (c) 2015年 Seven2One. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, ZTTextFieldType) {
    ZTTextFieldTypePhone,
    ZTTextFieldTypeCorrectCode,
};
@interface ZTTextField : UITextField
- (instancetype)initWithFrame:(CGRect)frame type:(ZTTextFieldType)type;
@end
