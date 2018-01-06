//
//  YkeyboardPanelView.h
//  YkeyboardPanelView
//
//  Created by shusy on 2018/1/6.
//  Copyright © 2018年 杭州爱卿科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+Ykeyboard.h"
@interface YkeyboardPanelView : UIView
+ (instancetype)panelViewWithType:(YkeyboardInputType)type;
/**键盘的类型*/
@property(nonatomic,assign)YkeyboardInputType y_inputType;
/**对应的textfield*/
@property(nonatomic,strong)UITextField *textField;
/**每隔多少个数字空一格*/
@property(nonatomic,assign)NSInteger intervalLength;
@end
