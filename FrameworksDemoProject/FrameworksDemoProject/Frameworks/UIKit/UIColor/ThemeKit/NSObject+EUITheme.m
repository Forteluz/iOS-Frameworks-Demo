//
//  NSObject+FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "NSObject+EUITheme.h"
#import <objc/runtime.h>

static const void *kColorKey = &kColorKey;

@implementation NSObject (EUITheme)

- (UIColor *)fd_colorByCGColor {
    return objc_getAssociatedObject(self, kColorKey);
}

- (void)setFd_colorByCGColor:(UIColor *)fd_colorByCGColor {
    objc_setAssociatedObject(self, kColorKey, fd_colorByCGColor, OBJC_ASSOCIATION_RETAIN);
}


@end
