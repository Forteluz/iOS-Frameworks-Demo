//
//  FDUIColorTestView.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 通常一个视图所用到的可换肤属性，大概就是颜色、字体、图片或者某些数值；
 一个换肤框架需要有一个完备的更新机制保证大部分能力可被动态读取
 
 UI 组件若需要支持换肤功能，需满足两个设计要求：
 1、相关属性支持默认值重写；
 2、相关属性要保证调用 setter 时功能正常；
 */
@interface FDUIColorTestView : UIView
@property (nonatomic, strong) UIColor *textColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIFont  *textFont  UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) UIEdgeInsets inner UI_APPEARANCE_SELECTOR;
#pragma mark - ---| UI Part |---
@property (nonatomic, strong, readonly) UILabel *label;
@end

NS_ASSUME_NONNULL_END
