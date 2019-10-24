//
//  EUIThemeManager.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "EUIThemeManager.h"
#import "UIView+EUITheme.h"

NSString *const FDUIThemeDidChangeNotification = @"FDUIThemeDidChangeNotification";

@implementation EUIThemeManager

+ (instancetype)sharedInstance {
    static EUIThemeManager *one;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        one = [[EUIThemeManager alloc] init];
    });
    return one;
}

- (void)applyTheme:(id<EUIThemeProtocol>)theme {
    [self setCurrentTheme:theme];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self p_postNotification];
        [self p_updateUIIfNeeded];
    });
}

- (void)p_updateUIIfNeeded {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    [windows enumerateObjectsUsingBlock:^(UIWindow *window, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL isShowing = !window.isHidden && window.alpha > 0.01;
        if ( isShowing ) {
            UIViewController *controller = window.rootViewController;
            NSArray *vcs = controller.childViewControllers;
            [vcs enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([self p_interceptBy:vc]) {
                    [vc.view fd_displayIfNeeded];
                }
            }];
        }
    }];
}

- (void)p_postNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:FDUIThemeDidChangeNotification
                                                        object:nil];
}

- (BOOL)p_interceptBy:(UIViewController *)controller {
    ///< For Test
    Class cls = NSClassFromString(@"FDUIColorViewController");
    if ([controller isKindOfClass:cls]) {
        return YES;
    }
    return NO;
}

@end
