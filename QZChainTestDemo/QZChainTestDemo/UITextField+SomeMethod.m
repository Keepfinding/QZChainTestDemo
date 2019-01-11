//
//  UITextField+SomeMethod.m
//  QZChainTestDemo
//
//  Created by Stephen Hu on 2018/12/27.
//  Copyright © 2018 Stephen Hu. All rights reserved.
//

#import "UITextField+SomeMethod.h"
#import "UIView+SetRect.h"
#import "UIButton+Inits.h"
#import "UIButton+Event.h"
#import "UIButton+Style.h"
@implementation UITextField (SomeMethod)
- (void)addInputAccessoryViewButtonWithTitle:(NSString *)title {
    
    UIView *inputAccessoryView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
    inputAccessoryView.backgroundColor = [UIColor whiteColor];
    
    UIButton *button       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    button.right           = Width;
    button.normalTitle     = title;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:self action:@selector(resignFirstResponder)]; // 因为是UITextField 分类直接注册系统方法即可收回键盘
    [inputAccessoryView addSubview:button];
    
    [button titleLabelHorizontalAlignment:UIControlContentHorizontalAlignmentRight
                        verticalAlignment:UIControlContentVerticalAlignmentCenter
                        contentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 12.f)];
    
    [button titleLabelColorWithNormalStateColor:[UIColor blackColor]
                          highlightedStateColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]
                             disabledStateColor:nil];
    
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 0.5f)];
    line.backgroundColor = [UIColor darkGrayColor];
    line.top             = 0.f;
    [inputAccessoryView addSubview:line];
    
    self.inputAccessoryView = inputAccessoryView;
}
@end
