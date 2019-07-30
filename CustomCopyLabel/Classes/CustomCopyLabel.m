//
//  CopyLabel.m
//  CopyLabel
//
//  Created by zhm on 2018/8/28.
//  Copyright © 2018年 dongfangyoubo. All rights reserved.
//

#import "CustomCopyLabel.h"
@interface CustomCopyLabel ()

@property(nonatomic,strong)UILongPressGestureRecognizer *longPress;

@end

@implementation CustomCopyLabel

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self pressAction];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self pressAction];
    }
    return self;
}
//初始化设置
- (void)pressAction {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 0.25;
    self.longPress = longPress;
    [self addGestureRecognizer:longPress];
    
}

- (void)setCanPaste:(BOOL)canPaste{
    _canPaste = canPaste;
    self.longPress.enabled = canPaste;
    
}

- (void)setShowTitle:(NSString *)showTitle{
    
    _showTitle = showTitle;
    
}

//使label能够成为响应事件
- (BOOL)canBecomeFirstResponder{
    
    
    return YES;
}

//自定义方法时才显示对就选项菜单,即屏蔽系统选项菜单
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    if (action == @selector(customCopy:)) {
        return YES;
    }
    return NO;
}

- (void)customCopy:(id)sender{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;

}

- (void)longPressAction:(UIGestureRecognizer *)recognier{
    
    if (recognier.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        NSString *titleName = self.showTitle?: @"拷贝";
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:titleName action:@selector(customCopy:)];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        menuController.menuItems = @[copyItem];
        [menuController setTargetRect:self.frame inView:self.superview];
        [menuController setMenuVisible:YES animated:YES];
    }
    
}


@end
