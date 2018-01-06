//
//  UITextField+Ykeyboard.m
//  YkeyboardPanelView
//
//  Created by shusy on 2018/1/6.
//  Copyright © 2018年 杭州爱卿科技. All rights reserved.
//

#import "UITextField+Ykeyboard.h"
#import <objc/runtime.h>
#import "YkeyboardPanelView.h"

#define YScreenW  [UIScreen mainScreen].bounds.size.width
#define YScreenH  [UIScreen mainScreen].bounds.size.height

@implementation UITextField (Ykeyboard)

- (void)setY_inputType:(YkeyboardInputType)y_inputType {
    //设置当前UITextField 的inputView
    YkeyboardPanelView *panelView = [YkeyboardPanelView panelViewWithType:y_inputType];
    panelView.textField = self;
    self.inputView = panelView;
    objc_setAssociatedObject(self, _cmd, @(y_inputType), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setTopHint:(NSString *)topHint {
    // inputAccessoryView
    UIView *tView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, YScreenW, 35)];
    // 分割线
    UIView *tLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, YScreenW, 0.5)];
    tLine.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, YScreenW, 35)];
    tLabel.text = topHint;
    tLabel.textAlignment = NSTextAlignmentCenter;
    tLabel.font = [UIFont systemFontOfSize:14.0];
    tLabel.backgroundColor = [UIColor whiteColor];
    [tView addSubview:tLabel];
    [tView addSubview:tLine];
    self.inputAccessoryView = tView;
    objc_setAssociatedObject(self, _cmd, topHint, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setIntervalLength:(NSInteger)intervalLength {
    if ([self.inputView isKindOfClass:[YkeyboardPanelView class]]) {
        [self.inputView performSelector:@selector(setIntervalLength:) withObject:@(intervalLength)];
    }
    objc_setAssociatedObject(self, _cmd, @(intervalLength), OBJC_ASSOCIATION_ASSIGN);
}

- (YkeyboardInputType)y_inputType {
   return [objc_getAssociatedObject(self, @selector(setY_inputType:)) integerValue];
}

- (NSString *)topHint {
    return [objc_getAssociatedObject(self, @selector(setTopHint:)) string];
}

- (NSInteger)intervalLength {
    return [objc_getAssociatedObject(self, @selector(setIntervalLength:)) integerValue];
}

@end
