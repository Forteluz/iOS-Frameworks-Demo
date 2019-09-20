//
//  FDUIApperanceViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/20.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIApperanceViewController.h"

@interface FDUIApperanceViewController ()

@end

@implementation FDUIApperanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_preSetUIApperance];
    [self p_asyncChangingUIApperance];
}

- (void)p_preSetUIApperance {
    [[UIButton appearance] setTintColor:UIColor.redColor];
//    [[FDBaseView appearance] setTintColor:UIColor.redColor];
//    [[FDBaseView appearance] setHighlightColor:UIColor.blueColor];
}

- (void)p_asyncChangingUIApperance {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 200, 100, 100)];
    [button setTitle:@"Hello!" forState:UIControlStateNormal];
    
    [self.view addSubview:button];

    FDBaseView *one = [[FDBaseView alloc] initWithFrame:CGRectMake(100, 320, 100, 100)];
    one.tintColor = UIColor.blueColor;
    one.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    
    [self.view addSubview:one];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ///< doesn't work if unsets apperance property
        [[UIButton appearance] setTintColor:UIColor.redColor];
        
        [UIView animateWithDuration:0.5 animations:^{
            ///< 有补帧！
            [button setTintAdjustmentMode:UIViewTintAdjustmentModeDimmed];
        }];
    });
}

@end
