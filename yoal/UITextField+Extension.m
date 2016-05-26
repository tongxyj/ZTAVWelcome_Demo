//
//  UITextField+Extension.m
//  yoal
//
//  Created by 李 延彬 on 15-8-10.
//  Copyright (c) 2015年 Seven2One. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)
- (void)setupPlaceholderWithText:(NSString *)text attr:(NSDictionary *)attr {
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:text attributes:attr];
    [self setAttributedPlaceholder:attrStr];
}
@end
