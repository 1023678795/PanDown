//
//  BottomMenuVC.m
//  手势拖拽
//
//  Created by aa on 2018/7/20.
//  Copyright © 2018年 金刚葫芦娃. All rights reserved.
//
#define MAINSCREEN [UIScreen mainScreen].bounds.size
#import "BottomMenuVC.h"
#import "NAVView.h"
@interface BottomMenuVC ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) NAVView *navView;
@property (nonatomic, strong) UIViewController *baseVC;
@property (nonatomic, strong) UIView *maskView;
@end

@implementation BottomMenuVC
static BottomMenuVC *menuView =nil;
+ (instancetype)ShareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menuView = [[self alloc] initWithFrame:CGRectMake(20, MAINSCREEN.height,MAINSCREEN.width-40, MAINSCREEN.height-90)];
        menuView.backgroundColor = [UIColor redColor];
    });
    return menuView;
}
- (instancetype)initWithContainerViewController:(UIViewController *)containerVC{
    if (self = [super init]) {
        _baseVC =containerVC;
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _maskView.hidden = YES;
        [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:_maskView];
        [self addSubview:self.navView];
        [self addRecognizer];
    }
    return self;
}
- (NAVView *)navView{
    if (!_navView) {
        NAVView *view = [[NAVView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
        view.backgroundColor = [UIColor whiteColor];
        view.titleLabel.text = @"标题";
        [view.leftCloseBtn addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
        _navView = view;
    }
    return _navView;
}
- (void)closeView:(UIButton *)sender{
    [self close];
}
//添加手势
#pragma mark - UIPanGestureRecognizer
-(void)addRecognizer{
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPanEvent:)];
    pan.delegate = self;
    [self.navView addGestureRecognizer:pan];
}
-(void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    //向上是-
    //向下是+
    CGPoint translation = [recognizer translationInView:_baseVC.view];
    [recognizer setTranslation:CGPointZero inView:_baseVC.view];
    if(UIGestureRecognizerStateBegan == recognizer.state ||
       UIGestureRecognizerStateChanged == recognizer.state){
        if (translation.y>0) {
            CGFloat tempY = self.frame.origin.y + translation.y;
            self.frame = CGRectMake(20, tempY, MAINSCREEN.width-40, MAINSCREEN.height-100);
        }else{
            CGFloat tempY = self.frame.origin.y + translation.y;
            self.frame = CGRectMake(20, tempY, MAINSCREEN.width-40, MAINSCREEN.height-100);
        }
        if (self.frame.origin.y<=100) {
            self.frame = CGRectMake(20, 100, MAINSCREEN.width-40, MAINSCREEN.height-100);
        }
    }else{
        NSLog(@"滑动结束");
        if (self.frame.origin.y>=MAINSCREEN.height/2) {
            //关闭
            [self close];
        }else{
            //展开
            [self open];
        }
    }
    
}
/**
 *  关闭左视图
 */
- (void)close{
    NSLog(@"closeView");
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(20, MAINSCREEN.height, MAINSCREEN.width-40,MAINSCREEN.height-90);
    }completion:^(BOOL finished) {
        _maskView.hidden = YES;
    }];
}

- (void)open{
    NSLog(@"openView");
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(20,100,MAINSCREEN.width-40,MAINSCREEN.height-90);
    } completion:^(BOOL finished) {
        _maskView.hidden = NO;
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
