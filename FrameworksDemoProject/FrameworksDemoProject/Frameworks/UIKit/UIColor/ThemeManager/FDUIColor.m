//
//  FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColor.h"
#import "FDUIColorMapper.h"
#import "FDUIColorManager.h"

@interface FDUIColor : UIColor
@property (nonatomic, copy) UIColor *(^provider)(FDUIColorManager *);
@end
@implementation FDUIColor

- (void)set {
    [super set];
}

- (void)setFill {
    [super setFill];
}

- (void)setStroke {
    [super setStroke];
}

- (CGColorRef)CGColor {
    /*!
     有的地方直接用 CGColor（比如 layer.borderColor 或者 layer.shadowColor），所以需要将回调绑定给 CGColor
     以便在 setter 时可触发 UIColor 的 provider 回调；
     */
    UIColor *one = self.fd_color;

    CGColorRef colorRef = one.CGColor;

    [FDUIColorMapper mapColor:self colorRef:colorRef];
    ///< toll-free 转成 NSObject 用 runtime 建立和 color 的关系
    NSObject *objRef = (__bridge id)colorRef;

    NSLog(@"%@",objRef);

    return colorRef;
}

- (UIColor *)resolvedColorWithTraitCollection:(UITraitCollection *)traitCollection {
    return [super resolvedColorWithTraitCollection:traitCollection];
}

- (UIColor *)fd_color {
    return self.provider([FDUIColorManager sharedInstance]);
}

@end

@implementation UIColor(FDColor)

+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(FDUIColorManager *))provider {
    FDUIColor *color = [[FDUIColor alloc] init];
    color.provider = provider;
    return color;
}

@end
