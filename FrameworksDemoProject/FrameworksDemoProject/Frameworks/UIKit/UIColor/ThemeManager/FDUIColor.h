//
//  FDUIColor.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDUIColorManager;

@interface UIColor(FDColor)
/*!
 模仿系统接口，提供主题色生成器
 */
+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(FDUIColorManager *))provider;

@end
