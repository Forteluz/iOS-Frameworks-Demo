//
//  FDUIColorTemplet.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorTemplet.h"
///< ThemeKit
#import "EUIThemeKit.h"
#import "FDUITheme.h"
///< Components
#import "FDUIColorTestView.h"
#import "EUIDynamicAppearance.h"

@implementation EUIThemeManager(FDUITheme)

- (FDUITheme *)applyingTheme {
    /// For easy access
    return (FDUITheme *)self.currentTheme;
}

@end

@implementation FDUIColorTemplet

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateTemplet)
                                                     name:FDUIThemeDidChangeNotification
                                                   object:nil];
        [self updateTemplet];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateTemplet {
    EUIThemeManager *manager = [EUIThemeManager sharedInstance];
    FDUITheme *theme = manager.applyingTheme;
    
    ///< 测试视图组件
    FDUIColorTestView *testView = [FDUIColorTestView eui_appearance];
    testView.textColor = theme.fd_textColor; // FDUITextColor;
    testView.textFont = theme.fd_textFont;
    testView.inner = UIEdgeInsetsMake(20, 20, 20, 20);
    testView.backgroundColor = FDUISecondaryColor;
    
    ///< 系统组件
    UIButton *button = [UIButton eui_appearance];
    [button setBackgroundColor:FDUIPrimaryColor];
    [button setTitleColor:FDUITextColor forState:UIControlStateNormal];
    [button.titleLabel setFont:theme.fd_textFont];
}

+ (UIColor *)fd_primaryColor {
    return [UIColor fd_colorWithProvider:^UIColor *(EUIThemeManager *manager) {
        FDUITheme *theme = manager.applyingTheme;
        return theme.fd_primaryColor;
    }];
}

+ (UIColor *)fd_secondaryColor {
    return [UIColor fd_colorWithProvider:^UIColor *(EUIThemeManager *manager) {
        FDUITheme *theme = manager.applyingTheme;
        return theme.fd_secondaryColor;
    }];
}

+ (UIColor *)fd_textColor {
    return [UIColor fd_colorWithProvider:^UIColor *(EUIThemeManager *manager) {
        FDUITheme *theme = manager.applyingTheme;
        return theme.fd_textColor;
    }];
}

+ (UIColor *)fd_backgrounndColor {
    return [UIColor fd_colorWithProvider:^UIColor *(EUIThemeManager *manager) {
        FDUITheme *theme = manager.applyingTheme;
        return theme.fd_backgrounndColor;
    }];
}

@end
