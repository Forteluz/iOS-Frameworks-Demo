//
//  FDUIColorMapper.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorMapper.h"

@interface FDUIColorMapper()
@property (nonatomic, strong) NSMutableDictionary *mapper;
@end
@implementation FDUIColorMapper

+ (instancetype)sharedInstance {
    static FDUIColorMapper *one;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        one = [[FDUIColorMapper alloc] init];
        one.mapper = @{}.mutableCopy;
    });
    return one;
}

+ (BOOL)p_isMapEnableBy:(UIColor *)color {
    Class cls = NSClassFromString(@"FDUIColor");
    return [color isKindOfClass:cls];
}

+ (void)mapColor:(UIColor *)color colorRef:(CGColorRef)colorRef {
    if (![self p_isMapEnableBy:color]) return;
    NSMutableDictionary *mapper = [[FDUIColorMapper sharedInstance] mapper];
    NSString *key = [NSString stringWithFormat:@"%p",colorRef];
    [mapper setObject:color forKey:key];
}

+ (UIColor *)colorByColorRef:(CGColorRef)colorRef {
    if (!colorRef) return nil;
    NSMutableDictionary *mapper = [[FDUIColorMapper sharedInstance] mapper];
    if (mapper.count == 0) return nil;
    NSString *key = [NSString stringWithFormat:@"%p",colorRef];
    UIColor *one = [mapper objectForKey:key];
    return one;
}

@end
