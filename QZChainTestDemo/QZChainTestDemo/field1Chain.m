//
//  field1Chain.m
//  QZChainTestDemo
//
//  Created by Stephen Hu on 2018/12/27.
//  Copyright © 2018 Stephen Hu. All rights reserved.
//

#import "field1Chain.h"
#import <UIKit/UIKit.h>

@implementation field1Chain
- (ResponsibilityMessage *)canPassThrough {
    UITextField           *field   = self.object;
    ResponsibilityMessage *message = [ResponsibilityMessage new];
    message.object                 = self.object;
    message.checkSuccess           = YES;
    if (field.text.length <= 0) {
        message.errorMessage = @"field1请输入内容";
        message.checkSuccess = NO;
    }
    return message;
}
@end

@implementation field2Chain
- (ResponsibilityMessage *)canPassThrough {
    UITextField           *field   = self.object;
    ResponsibilityMessage *message = [ResponsibilityMessage new];
    message.object                 = self.object;
    message.checkSuccess           = YES;
    if (field.text.length <= 0) {
        message.errorMessage = @"field2请输入内容";
        message.checkSuccess = NO;
    }
    return message;
}
@end
@implementation field3Chain
- (ResponsibilityMessage *)canPassThrough {
    UITextField           *field   = self.object;
    ResponsibilityMessage *message = [ResponsibilityMessage new];
    message.object                 = self.object;
    message.checkSuccess           = YES;
    if (field.text.length <= 0) {
        message.errorMessage = @"field3请输入内容";
        message.checkSuccess = NO;
    }
    return message;
}
@end
@implementation field4Chain
- (ResponsibilityMessage *)canPassThrough {
    UITextField           *field   = self.object;
    ResponsibilityMessage *message = [ResponsibilityMessage new];
    message.object                 = self.object;
    message.checkSuccess           = YES;
    if (field.text.length <= 0) {
        message.errorMessage = @"field4请输入内容";
        message.checkSuccess = NO;
    }
    return message;
}
@end

