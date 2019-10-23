//
//  FDUIColorManager.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorManager.h"
#import "UIView+FDUIColor.h"

@implementation FDUIColorManager

+ (instancetype)sharedInstance {
    static FDUIColorManager *one;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        one = [[FDUIColorManager alloc] init];
    });
    return one;
}

- (void)updateTheme:(NSString *)theme {
    if ([theme isEqualToString:@"dark"]) {
        self.isDark = YES;
    } else {
        self.isDark = NO;
    }
    NSArray *windows = [[UIApplication sharedApplication] windows];
    [windows enumerateObjectsUsingBlock:^(UIWindow *window, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL isShowing = !window.isHidden && window.alpha > 0.01;
        if ( isShowing ) {
            UIViewController *controller = window.rootViewController;
            if (!!controller)[controller.view fd_updateColor];
        }
    }];
}

@end
