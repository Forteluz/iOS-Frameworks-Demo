//
//  FDUITheme.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/24.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUITheme.h"

@implementation FDUITheme
@synthesize identifier = _identifier;

- (UIColor *)fd_primaryColor { return nil; }
- (UIColor *)fd_secondaryColor { return nil; }
- (UIColor *)fd_textColor { return nil; }
- (UIColor *)fd_backgrounndColor { return nil; }

@end

@implementation FDUIRedTheme

- (NSString *)identifier {
    return @"red";
}

- (UIColor *)fd_primaryColor {
    return [UIColor redColor];
}

- (UIColor *)fd_secondaryColor {
    return [UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1];
}

- (UIColor *)fd_textColor {
    return [UIColor whiteColor];
}

- (UIColor *)fd_backgrounndColor {
    return [[self fd_primaryColor] colorWithAlphaComponent:0.4];
}

- (UIFont  *)fd_textFont {
    return [UIFont systemFontOfSize:12];
}

@end

@implementation FDUIBlueTheme

- (NSString *)identifier {
    return @"blue";
}

- (UIColor *)fd_primaryColor {
    return [UIColor blueColor];
}

- (UIColor *)fd_secondaryColor {
    return [UIColor colorWithRed:0.2 green:0.2 blue:0.8 alpha:1];
}

- (UIColor *)fd_textColor {
    return [UIColor redColor];
}

- (UIColor *)fd_backgrounndColor {
    return [[self fd_primaryColor] colorWithAlphaComponent:0.4];
}

- (UIFont  *)fd_textFont {
    return [UIFont systemFontOfSize:14];
}

@end
