//
//  UITextField+SomeMethod.h
//  QZChainTestDemo
//
//  Created by Stephen Hu on 2018/12/27.
//  Copyright © 2018 Stephen Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (SomeMethod)
/**
 *  添加AccessoryView
 *
 *  @param title 按钮标题
 */
- (void)addInputAccessoryViewButtonWithTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
