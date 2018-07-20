//
//  BottomMenuVC.h
//  手势拖拽
//
//  Created by aa on 2018/7/20.
//  Copyright © 2018年 金刚葫芦娃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomMenuVC : UIView
+ (instancetype)ShareManager;
- (instancetype)initWithContainerViewController:(UIViewController *)containerVC;
- (void)open;
- (void)close;
@end
