//
//  UIView+FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "UIView+EUITheme.h"
#import "EUIThemeManager.h"
#import "NSObject+EUITheme.h"
#import "EUIDynamicAppearance.h"
#import "FDRuntime.h"

static const void *kFDBackgroundColorKey = &kFDBackgroundColorKey;
static const void *kFDBorderColorKey = &kFDBorderColorKey;

@implementation CALayer(EUITheme)

- (void)fd_setOriginBackgroundColor:(UIColor *)fd_backgroundColor {
    objc_setAssociatedObject(self, kFDBackgroundColorKey, fd_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)fd_originBackgroundColor {
    return objc_getAssociatedObject(self, kFDBackgroundColorKey);
}

- (void)fd_setOriginBorderColor:(UIColor *)fd_backgroundColor {
    objc_setAssociatedObject(self, kFDBorderColorKey, fd_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)fd_originBorderColor {
    return objc_getAssociatedObject(self, kFDBorderColorKey);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [FDRuntime hookClass:CALayer.class
                fromSelector:@selector(setBackgroundColor:)
                  toSelector:@selector(fd_setBackgroundColor:)];
        [FDRuntime hookClass:CALayer.class
                fromSelector:@selector(setBorderColor:)
                  toSelector:@selector(fd_setBorderColor:)];
    });
}

- (void)fd_setBackgroundColor:(CGColorRef)backgroundColor {
    /*!
     CALayer 绘制的时候使用的是 CGColorRef ，为了触发 FDUIColor 的回调，需要将两者做一个关系绑定
     */
    UIColor *color = nil;
    if (backgroundColor) {
        color = [(__bridge id)backgroundColor fd_colorByCGColor];
    }
    [self fd_setOriginBackgroundColor:color];
    [self fd_setBackgroundColor:backgroundColor];
}

- (void)fd_setBorderColor:(CGColorRef)borderColor {
    [self fd_setBorderColor:borderColor];
    [self fd_setOriginBorderColor:[(__bridge id)borderColor fd_colorByCGColor]];
}

- (void)fd_displayIfNeeded {
    CGColorRef backgroundColor = [self fd_originBackgroundColor].CGColor;
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
    CGColorRef borderColor = [self fd_originBorderColor].CGColor;
    if (borderColor) {
        self.borderColor = borderColor;
    }
}

@end

@implementation UIView (EUITheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [FDRuntime hookClass:UIView.class
                fromSelector:@selector(setBackgroundColor:)
                  toSelector:@selector(fd_setBackgroundColor:)];
    });
}

- (void)fd_setBackgroundColor:(UIColor *)color {
    [self.layer setBackgroundColor:nil];
    [self fd_setBackgroundColor:color];
}

- (void)fd_displayIfNeeded {
    ///< 开始调用已注册的 setter
    [self eui_invokeEUIAppearanceSelectors];
    
    NSArray *subviews = [self subviews];
    [subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj fd_displayIfNeeded];
    }];
 
    ///< 让 layer 重新绘制
    [self.layer fd_displayIfNeeded];
}

@end
