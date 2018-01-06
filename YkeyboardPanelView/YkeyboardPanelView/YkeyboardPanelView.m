//
//  YkeyboardPanelView.m
//  YkeyboardPanelView
//
//  Created by shusy on 2018/1/6.
//  Copyright © 2018年 杭州爱卿科技. All rights reserved.
//

#import "YkeyboardPanelView.h"

@interface YkeyboardPanelView()

@end

@implementation YkeyboardPanelView

+ (instancetype)panelViewWithType:(YkeyboardInputType)type {
    YkeyboardPanelView *panelV =  [[[NSBundle mainBundle] loadNibNamed:@"YkeyboardPanelView" owner:nil options:nil] lastObject];
    panelV.y_inputType = type;
    return panelV;
}

- (void)setY_inputType:(YkeyboardInputType)y_inputType {
    _y_inputType = y_inputType;
    //获取小数点按钮 和 x 按钮
    UIButton *pointBtn = [self viewWithTag:1010];
    UIButton *xBtn = [self viewWithTag:1011];
    if (self.y_inputType == YkeyboardInputTypeNumber) {
        pointBtn.hidden = YES;
        xBtn.hidden = YES;
    }else if (self.y_inputType == YkeyboardInputTypeCard) {
        pointBtn.hidden = YES;
        xBtn.hidden = NO;
    }else if (self.y_inputType == YkeyboardInputTypeFloat) {
        pointBtn.hidden = NO;
        xBtn.hidden = YES;
    }
}

- (IBAction)deleteBtnClick {
    [self.textField deleteBackward];
}

/**
 数字按钮的点击
 */
- (IBAction)btnClick:(UIButton *)sender {
    //获取按钮对应的tag
    NSInteger tag = sender.tag;
    //根据tag做相应的处理
    if (tag == 1010) { //小数点按钮
        // 如果还没有输入小数点才插入小数点
        if(self.textField.text.length > 0 && ![self.textField.text containsString:@"."]){[self.textField insertText:@"."];}
    }else if (tag == 1011) {//x按钮
        // 身份证X
        if(self.textField.text.length > 0 && ![self.textField.text containsString:@"X"]){[self.textField insertText:@"X"];}
    }else if (tag == 1012) { // 删除按钮
        if(self.textField.text.length > 0) [self.textField deleteBackward];
    }else if (tag == 1013) {
        [self.textField resignFirstResponder];
    }else{
        //获取对应按钮的文字
        NSString *text = [NSString stringWithFormat:@"%ld",tag - 1000];
        [self.textField insertText:text];
        //处理身份证 如果用户当前输入的文字长度加上一个长度和间隔个数加1 取余 刚好等于 0时就需要要空一格
        if (self.intervalLength && (self.textField.text.length +1) % (self.intervalLength+1) == 0 ) {
            [self.textField insertText:@""];
        }
    }
}

@end
