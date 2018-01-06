//
//  ViewController.m
//  YkeyboardPanelView
//
//  Created by shusy on 2018/1/6.
//  Copyright © 2018年 杭州爱卿科技. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Ykeyboard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardTextField;
@property (weak, nonatomic) IBOutlet UITextField *floatTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numTextField.y_inputType = YkeyboardInputTypeNumber;
    self.cardTextField.y_inputType = YkeyboardInputTypeCard;
    self.floatTextField.y_inputType = YkeyboardInputTypeFloat;
    self.cardTextField.intervalLength = 4;
    self.numTextField.topHint = @"请输入数字";
    self.cardTextField.topHint = @"请输入身份证号码";
    self.floatTextField.topHint = @"请输入小数";

}



@end
