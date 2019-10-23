//
//  FDUIColorMapper.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDUIColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDUIColorMapper : NSObject

/*!
 将一个 FDUIColor 和 CGColor 做映射
 */
+ (void)mapColor:(UIColor *)color colorRef:(CGColorRef)colorRef;

/*!
 通过一个 CGColor 获得和其绑定的 FDUIColor
 */
+ (UIColor *)colorByColorRef:(CGColorRef)colorRef;

@end

NS_ASSUME_NONNULL_END
