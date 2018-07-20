//
//  NAVView.m
//  手势拖拽
//
//  Created by aa on 2018/7/20.
//  Copyright © 2018年 金刚葫芦娃. All rights reserved.
//

#import "NAVView.h"

@implementation NAVView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self viewDidload];
    }
    return self;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, self.frame.size.width-60, 60)];
        lable.textColor = [UIColor darkGrayColor];
        lable.textAlignment = 1;
        lable.font = [UIFont systemFontOfSize:17];
        _titleLabel = lable;
    }
    return _titleLabel;
}
- (UIButton *)leftCloseBtn{
    if (!_leftCloseBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 0, 30, 60);
        [button setTitle:@"X" forState:0];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        _leftCloseBtn = button;
    }
    return _leftCloseBtn;
}
- (void)viewDidload{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.leftCloseBtn];
}
@end
