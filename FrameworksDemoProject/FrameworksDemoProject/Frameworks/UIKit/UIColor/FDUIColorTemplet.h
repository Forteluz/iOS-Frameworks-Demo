//
//  FDUIColorTemplet.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDUIColor.h"


#define FDUIVCBackgroundColor     [FDUIColorTemplet fd_viewControllerBackgroundColor]
#define FDUIButtonBackgroundColor [FDUIColorTemplet fd_buttonBackgrounColor]
#define FDUIButtonBorderColor     [FDUIColorTemplet fd_buttonBorderColor]

/*!
 主题模板，在模板中配置需要的颜色
 */
@interface FDUIColorTemplet : NSObject

/*!
 定义 VC 的背景色
 */
+ (UIColor *)fd_viewControllerBackgroundColor;

/*!
 定义一个组件的背景色
 */
+ (UIColor *)fd_buttonBackgrounColor;

/*!
 定义一个组件的边框色
 */
+ (UIColor *)fd_buttonBorderColor;

@end
