//
//  FDUIColor.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EUIThemeManager;

/*!
 原系统用的动态颜色是 UIDynamicColor
 */
@interface UIColor(FDColor)

/*!
 仿照系统接口，提供主题色生成器
 */
+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(EUIThemeManager *))provider;

@end
