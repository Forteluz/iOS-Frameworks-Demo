//
//  FDUIScrollViewViewController.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/11/25.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIScrollViewViewController.h"
//#import "DCSCScrollViewController.h"

@implementation FDUIScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClicked {
//    DCSCScrollViewController *vc = [[DCSCScrollViewController alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:vc animated:YES completion:^{}];
}

@end
