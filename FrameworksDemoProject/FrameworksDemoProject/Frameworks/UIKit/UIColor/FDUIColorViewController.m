//
//  FDUIColorViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorViewController.h"
#import "FDUIColor.h"

@interface FDUIColorViewController ()

@end

@implementation FDUIColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color = nil;
    
    /*!
     使用 HSB (实际是 HSL) 生成颜色
     https://zh.wikipedia.org/wiki/HSL和HSV色彩空间
     */
    color = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0];
    
    /*!
     动态色
     */
    color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return FDUIColor.blueColor;
        } else {
            return FDUIColor.redColor;
        }
    }];
    
    self.view.backgroundColor = color;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"5秒刷新");
        [self.view setNeedsDisplay];
    });
}

- (void)update {
    NSArray *windows = [[UIApplication sharedApplication] windows];
       [windows enumerateObjectsUsingBlock:^(UIWindow *window, NSUInteger idx, BOOL * _Nonnull stop) {
           BOOL isShowing = !window.isHidden && window.alpha > 0.01;
           if ( isShowing ) {
               if (window.rootViewController) {
                   
               } else {
                   
               }
           }
       }];
}

@end
