//
//  EUIDynamicAppearance.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/24.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject(EUIDynamicAppearance)

/*!
 使用 eui_appearance 获得 UIAppearance 实例，可以动态注册 UI_APPEARANCE_SELECTOR 属性，当主题切换时，这
 些 UI_APPEARANCE_SELECTOR 属性会自动得到 setter 调用。
 */
+ (id)eui_appearance;

/*!
 查看当前已注册的方法。
 */
- (NSArray <NSInvocation *> *)eui_registeredSetters;

/*!
 自动调用已注册的 appearance 属性的 setter 方法。
 */
- (void)eui_invokeEUIAppearanceSelectors;

@end


NS_ASSUME_NONNULL_END
