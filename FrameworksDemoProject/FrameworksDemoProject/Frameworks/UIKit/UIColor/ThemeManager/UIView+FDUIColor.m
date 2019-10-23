//
//  UIView+FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "UIView+FDUIColor.h"
#import "FDUIColorManager.h"
#import "FDUIColorMapper.h"
#import "FDRuntime.h"

static const void *kFDBackgroundColorKey = &kFDBackgroundColorKey;
static const void *kFDBorderColorKey = &kFDBorderColorKey;

@implementation CALayer(FDUIColor)

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
    [self fd_setBackgroundColor:backgroundColor];
    UIColor *color = [FDUIColorMapper colorByColorRef:backgroundColor];
    [self fd_setOriginBackgroundColor:color];
}

- (void)fd_setBorderColor:(CGColorRef)borderColor {
    [self fd_setBorderColor:borderColor];
    UIColor *color = [FDUIColorMapper colorByColorRef:borderColor];
    [self fd_setOriginBorderColor:color];
}

- (void)fd_updateColor {
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

@implementation UIView (FDUIColor)

- (void)fd_updateColor {
    [self.layer fd_updateColor];
    
    NSArray *subviews = [self subviews];
    [subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj fd_updateColor];
    }];
}

@end
