//
//  CopyLabel.h
//  CopyLabel
//
//  Created by zhm on 2018/8/28.
//  Copyright © 2018年 dongfangyoubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCopyLabel : UILabel

@property (nonatomic,assign) IBInspectable BOOL canPaste;

@property (nonatomic,strong) IBInspectable NSString *showTitle;
/**
 是否根据文本进行计算，计算的宽度最大值为label的宽
 */
@property (nonatomic,assign) IBInspectable BOOL calculateText;

@end
