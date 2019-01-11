//
//  ViewController.m
//  QZChainTestDemo
//
//  Created by Stephen Hu on 2018/12/27.
//  Copyright © 2018 Stephen Hu. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"
#import "UIButton+Inits.h"
#import "UIButton+Event.h"
#import "UIButton+Style.h"
#import "UITextField+SomeMethod.h"
#import "ResponsibilityManager.h"
#import "field1Chain.h"
#import "DateItemPickerView.h"
#import "DateFormatter.h"
#import "OneItemPickerView.h"
#import "NSAttributedString+AttributedStringConfig.h"
#import "AttributedStringConfigHelper.h"
#import "RegexManager.h"
@interface ViewController ()<BaseShowPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *filed1;
@property (weak, nonatomic) IBOutlet UITextField *field2;
@property (weak, nonatomic) IBOutlet UITextField *field3;
@property (weak, nonatomic) IBOutlet UITextField *field4;
@property (nonatomic, strong) ResponsibilityManager *responsibilityManager;
@end

@implementation ViewController
- (IBAction)checkAction:(UIButton *)sender {
    NSString *message = [self.responsibilityManager checkResponsibilityChain].errorMessage;
    if (message) {
        NSLog(@"%@",message);
        id object = [self.responsibilityManager checkResponsibilityChain].object;
        UITextField *field = object;
        field.placeholder = message;
        [field becomeFirstResponder];
    }
}
- (IBAction)pickerAction:(UIButton *)sender {
    [DateItemPickerView showPickerViewWithDelegate:self tag:0 object:nil info:@"据说是日期" selectedItem:nil showDatas:nil];
}
- (IBAction)oneItemPickerAction:(UIButton *)sender {
    id showDatas    = nil;
    showDatas    = @[[self normalFontWithMonthString:@"1 个月"],
                     [self normalFontWithMonthString:@"2 个月"],
                     [self normalFontWithMonthString:@"3 个月"],
                     [self normalFontWithMonthString:@"4 个月"],
                     [self normalFontWithMonthString:@"5 个月"],
                     [self normalFontWithMonthString:@"6 个月"],
                     [self normalFontWithMonthString:@"7 个月"],
                     [self normalFontWithMonthString:@"8 个月"],
                     [self normalFontWithMonthString:@"9 个月"],
                     [self normalFontWithMonthString:@"10 个月"],
                     [self normalFontWithMonthString:@"11 个月"],
                     [self normalFontWithMonthString:@"12 个月"]];
    [OneItemPickerView showPickerViewWithDelegate:self tag:0 object:nil info:@"选择一个时间段" selectedItem:nil showDatas:showDatas];
}
- (void)baseShowPickerView:(BaseShowPickerView *)showPickerView didSelectedIndexs:(NSArray <NSNumber *> *)indexs items:(NSArray *)items {
    if ([showPickerView isKindOfClass:[OneItemPickerView class]]) {
        self.field3.attributedText = items.firstObject;
    } else if ([showPickerView isKindOfClass:[DateItemPickerView class]]) {
        self.field4.text = [DateFormatter dateStringFromDate:items.firstObject outputDateStringFormatter:@"yyyy-MM-dd"];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.filed1 addInputAccessoryViewButtonWithTitle:@"收起键盘"];
    [self.field2 addInputAccessoryViewButtonWithTitle:@"收起键盘"];
    [self.field3 addInputAccessoryViewButtonWithTitle:@"收起键盘"];
    [self.field4 addInputAccessoryViewButtonWithTitle:@"收起键盘"];
    self.responsibilityManager      = [ResponsibilityManager new];
    self.filed1.responsibilityChain = [field1Chain new];
    self.field2.responsibilityChain = [field2Chain new];
    self.field3.responsibilityChain = [field3Chain new];
    self.field4.responsibilityChain = [field4Chain new];
    [self.responsibilityManager addChain:self.filed1];
    [self.responsibilityManager addChain:self.field2];
    [self.responsibilityManager addChain:self.field3];
    [self.responsibilityManager addChain:self.field4];
}

- (NSAttributedString *)normalFontWithMonthString:(NSString *)string {
    
    return [NSMutableAttributedString mutableAttributedStringWithString:string config:^(NSString *string, NSMutableArray<AttributedStringConfig *> *configs) {
        
        NSRange full = NSMakeRange(0, string.length);
        NSRange part = [string matchsWithRegexPattern:@"^\\d+"].firstObject.rangeValue;
        
        [configs addObject:[FontAttributeConfig            configWithFont:[UIFont systemFontOfSize:15]  range:full]];
        [configs addObject:[FontAttributeConfig            configWithFont:[UIFont boldSystemFontOfSize:15.f] range:part]];
        [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.75f] range:full]];
        [configs addObject:[ForegroundColorAttributeConfig configWithColor:[[UIColor redColor]   colorWithAlphaComponent:0.75f] range:part]];
    }];
}


@end
