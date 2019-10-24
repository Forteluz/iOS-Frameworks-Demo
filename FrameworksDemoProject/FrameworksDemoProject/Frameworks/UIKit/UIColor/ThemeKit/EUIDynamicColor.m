//
//  FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "EUIDynamicColor.h"
#import "EUIThemeManager.h"
#import "NSObject+EUITheme.h"

@interface EUIDynamicColor : UIColor
@property (nonatomic, copy) UIColor *(^provider)(EUIThemeManager *);
@end
@implementation EUIDynamicColor

- (instancetype)copyWithZone:(NSZone *)zone {
    EUIDynamicColor *color = [[self class] allocWithZone:zone];
    color.provider = self.provider;
    return color;
}

- (void)set {
    
}

- (void)setFill {
    
}

- (void)setStroke {
    
}

- (CGColorRef)CGColor {
    /*!
     有的地方直接用 CGColor（比如 layer.borderColor 或者 layer.shadowColor），所以需要将回调绑定给 CGColor
     以便在 setter 时可触发 UIColor 的 provider 回调；
     */
    CGColorRef colorRef = [UIColor colorWithCGColor:self.fd_color.CGColor].CGColor;
    ///< toll-free 转成 NSObject 用 runtime 建立和 color 的关系
    NSObject *objRef = (__bridge id)colorRef;
    [objRef setFd_colorByCGColor:self];
    return colorRef;
}

- (BOOL)isEqual:(id)object {
    return self == object;
}

- (UIColor *)fd_color {
    return self.provider([EUIThemeManager sharedInstance]);
}

- (UIColor *)p_dynamicColor {
    if (self.provider) {
        return self.provider([EUIThemeManager sharedInstance]);
    }
    return nil;
}

- (NSUInteger)hash {
    /*!
     不重写会 crash
     */
    return (NSUInteger)self.provider;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, dynamic color = %@",
            [super description],
            self.p_dynamicColor];
}

@end

@implementation UIColor(FDColor)

+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(EUIThemeManager *))provider {
    EUIDynamicColor *color = [[EUIDynamicColor alloc] init];
    color.provider = provider;
    return color;
}

@end
