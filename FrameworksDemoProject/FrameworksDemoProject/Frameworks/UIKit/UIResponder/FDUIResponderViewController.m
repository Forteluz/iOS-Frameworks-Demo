//
//  FDUIResponderViewController.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/10/29.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIResponderViewController.h"
#import "FDUIResponderSuperView.h"

@interface FDUIResponderViewController ()

@end

@implementation FDUIResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_layoutViews];
}

- (void)p_layoutViews {
    FDUIResponderSuperView *view = [FDUIResponderSuperView new];
    view.backgroundColor = [UIColor grayColor];
    view.frame = CGRectMake(50, 100, 300, 200);
    [self.view addSubview:view];
}

@end
