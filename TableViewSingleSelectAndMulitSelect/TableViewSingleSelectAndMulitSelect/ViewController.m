//
//  ViewController.m
//  TableViewSingleSelectAndMulitSelect
//
//  Created by CrabMan on 16/6/16.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import "ViewController.h"
#import "displayTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    button.backgroundColor = [UIColor redColor];
    button.center = self.view.center;
    [button addTarget:self action:@selector(jumpToNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)jumpToNextVC {

    [self.navigationController pushViewController:[displayTableViewController new] animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
