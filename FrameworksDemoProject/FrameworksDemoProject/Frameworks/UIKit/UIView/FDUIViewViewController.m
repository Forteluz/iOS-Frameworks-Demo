//
//  FDUIViewViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIViewViewController.h"

@interface FDUIViewViewController ()

@end

@implementation FDUIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_testLayoutSubview];
}

#pragma mark - ---| Test LayoutSubview |---

- (void)p_testLayoutSubview {
    FDBaseView *a = [self.helper newView:@"a" frame:CGRectMake(100, 200, 100, 100)];
    FDBaseView *b = [self.helper newView:@"b" frame:CGRectMake(0, 0, 50, 50)];
    [b setLayoutSubviewsBlock:^(FDBaseView *hi) {
        NSLog(@"[%@] layoutSubviews", hi.identifier);
    }];
    [a setLayoutSubviewsBlock:b.layoutSubviewsBlock];
    [a addSubview:b];
    [self.view addSubview:a];
    
    [self.caser todo:^{
        NSLog(@"开始测试 Case A : 改变 [%@] 的 frame.origin", a.identifier);
        a.frame = CGRectMake(10, 200, 100, 100);
        ///===============================================
        /// 结论：改变 origin 无事发生
        ///===============================================
    }];
    [self.caser todo:^{
        NSLog(@"开始测试 Case B : 改变 [%@] 的 bounds.size", a.identifier);
        a.bounds = CGRectMake(0, 0, 120, 120);
        ///===============================================
        /// 结论：只调用了一次 a layoutSubviews
        ///===============================================
    }];
    [self.caser todo:^{
        NSLog(@"开始测试 Case C : 改变 [%@] 的 frame.size", a.identifier);
        a.frame = CGRectMake(100, 200, 90, 90);
        ///===============================================
        /// 结论：只调用了一次 a layoutSubviews
        ///===============================================
    }];
    
    [self.caser todo:^{
        NSLog(@"开始测试 Case D : 在 [%@] 的 layoutSubviews 方法中改变 frame", a.identifier);
        a.layoutSubviewsBlock = ^(FDBaseView *hi) {
            CGFloat randomValue = arc4random() % 200 + 1;
            hi.frame = CGRectMake(100, 200, randomValue, randomValue);
            NSLog(@"[%@] layoutSubviews", hi.identifier);
        };
        CGFloat randomValue = arc4random() % 200 + 1;
        a.frame = CGRectMake(100, 200, randomValue, randomValue);
        ///===============================================
        /// 结论：只调用了一次 a layoutSubviews
        ///===============================================
    }];
    
    [self.caser todo:^{
        NSLog(@"开始测试 Case E : 改变 [%@] 的 frame.size", b.identifier);
        b.frame = CGRectMake(100, 200, 10, 10);
        ///===============================================
        /// 结论：a, b 都调用了 layoutSubviews
        ///===============================================
    }];
}

@end
