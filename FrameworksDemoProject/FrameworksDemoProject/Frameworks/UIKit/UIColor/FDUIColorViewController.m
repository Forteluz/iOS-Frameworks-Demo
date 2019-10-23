//
//  FDUIColorViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorViewController.h"
#import "FDUIColorTemplet.h"
#import "FDUIColorManager.h"

@implementation FDUIColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"点我切换" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
        
    ///< 设置 button 的背景色和边框色
//    button.layer.borderWidth = 1.f;
//    button.layer.borderColor = FDUIButtonBorderColor.CGColor;
    button.backgroundColor = FDUIButtonBackgroundColor;

    ///< 设置 view 的背景色
    self.view.backgroundColor = FDUIVCBackgroundColor;
}

- (void)tapAction {
    if ([FDUIColorManager sharedInstance].isDark) {
        NSLog(@"更新为日常主题");
        [[FDUIColorManager sharedInstance] updateTheme:@"light"];
    } else {
        NSLog(@"更新为黑暗主题");
        [[FDUIColorManager sharedInstance] updateTheme:@"dark"];
    }
}

@end
