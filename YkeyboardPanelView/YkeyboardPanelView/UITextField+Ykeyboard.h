//
//  UITextField+Ykeyboard.h
//  YkeyboardPanelView
//
//  Created by shusy on 2018/1/6.
//  Copyright © 2018年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 键盘的类型
 - YkeyboardInputTypeNumber: 数字键盘 不包括小数点
 - YkeyboardInputTypeCard: 身份证键盘
 - YkeyboardInputTypeFloat: 数字键盘带小数点
 */
typedef NS_ENUM(NSUInteger, YkeyboardInputType) {
    YkeyboardInputTypeNumber,
    YkeyboardInputTypeCard,
    YkeyboardInputTypeFloat
};
@interface UITextField (Ykeyboard)
/**键盘的类型*/
@property(nonatomic,assign)YkeyboardInputType y_inputType;
/**键盘顶部提示文字*/
@property(nonatomic,strong)NSString *topHint;
/**每隔多少个数字空一格*/
@property(nonatomic,assign)NSInteger intervalLength;
@end
