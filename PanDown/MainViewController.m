//
//  MainViewController.m
//  手势拖拽
//
//  Created by aa on 2018/7/20.
//  Copyright © 2018年 金刚葫芦娃. All rights reserved.
//

#import "MainViewController.h"
#import "BottomMenuVC.h"
@interface MainViewController ()
@property (nonatomic, strong) BottomMenuVC *manuView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"mainVC";
    self.view.backgroundColor =[UIColor blueColor];
    // Do any additional setup after loading the view.
    self.manuView =[[BottomMenuVC ShareManager]initWithContainerViewController:self];
    self.manuView.layer.cornerRadius = 10;
    self.manuView.layer.masksToBounds = YES;
    [self.navigationController.view addSubview:self.manuView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStyleBordered target:self action:@selector(test)] ;
}
- (void)test{
    [self.manuView open];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
