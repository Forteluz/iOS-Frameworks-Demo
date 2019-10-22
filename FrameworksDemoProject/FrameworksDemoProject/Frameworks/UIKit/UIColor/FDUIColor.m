//
//  FDUIColor.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColor.h"

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

- (UIColor *)resolvedColorWithTraitCollection:(UITraitCollection *)traitCollection {
    return [super resolvedColorWithTraitCollection:traitCollection];
}

+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(id))provider {
    FDUIColor *color = [FDUIColor new];
    color.provider = provider;
    return color;
}

@end
