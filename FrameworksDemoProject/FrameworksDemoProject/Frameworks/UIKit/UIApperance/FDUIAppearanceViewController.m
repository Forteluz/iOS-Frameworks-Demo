//
//  FDUIAppearanceViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/20.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIAppearanceViewController.h"
#import "FDUIAppearanceView.h"
#import "FDUIAppearanceObject.h"

@interface FDUIAppearanceViewController ()

@end

@implementation FDUIAppearanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_preSetUIApperance];
    [self p_asyncChangingUIApperance];
}

- (void)p_preSetUIApperance {
    [[FDUIAppearanceView appearance] setTestBackgroundColor:UIColor.blueColor];
    [[FDUIAppearanceView appearance] setIsTestAppearance:YES];
    [[FDUIAppearanceObject appearance] setIsTestAppearance:YES];
}

- (void)p_asyncChangingUIApperance {
    FDUIAppearanceObject *one = [FDUIAppearanceObject new];
    if (one.isTestAppearance) {
        NSLog(@"FDUIAppearanceObject isTestAppearance");
    }
    
    FDUIAppearanceView *a = [[FDUIAppearanceView alloc] init];
    [a setFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:a];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        /*!
         测试再次修改 appearance 属性后，是否还可以生效
         😘 经测试，再次修改是生效的
         */
        [[FDUIAppearanceView appearance] setTestBackgroundColor:UIColor.redColor];

        FDUIAppearanceView *b = [[FDUIAppearanceView alloc] init];
        [b setFrame:CGRectMake(100, 350, 100, 100)];
        [self.view addSubview:b];
        
        if (b.isTestAppearance) {
            NSLog(@"b show 「isTestAppearance」 success!");
        }

        /*!
         测试 appearance 值修改的时机
         */
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ///< Step 1 : 修改 inner（inner 影响视图内部计算）
            [[FDUIAppearanceView appearance] setInner:UIEdgeInsetsMake(10, 10, 10, 10)];

            ///< Step 2 : 创建并计算视图时机尺寸
            FDUIAppearanceView *c = [FDUIAppearanceView new];
            CGSize size = [c sizeThatFits:CGSizeMake(100, 50)];
            [c setFrame:CGRectMake(100, 500, size.width, size.height)];

            ///< Step 3: 添加视图到容器
            [self.view addSubview:c];
        });
    });
}

@end
