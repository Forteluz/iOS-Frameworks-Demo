//
//  FDUIColorTemplet.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 通常的主题设计体系中，都会定义一些主题色（如主色，副色，文字色等）
 */
#define FDUIPrimaryColor        [FDUIColorTemplet fd_primaryColor]
#define FDUISecondaryColor      [FDUIColorTemplet fd_secondaryColor]
#define FDUITextColor           [FDUIColorTemplet fd_textColor]
#define FDUIBackgroundColor     [FDUIColorTemplet fd_backgrounndColor]

/*!
 主题模板，用于解耦组件和主题库之间的依赖关系，同时定义组件的换肤属性
 */
@interface FDUIColorTemplet : NSObject

+ (UIColor *)fd_primaryColor;
+ (UIColor *)fd_secondaryColor;
+ (UIColor *)fd_textColor;
+ (UIColor *)fd_backgrounndColor;

@end
