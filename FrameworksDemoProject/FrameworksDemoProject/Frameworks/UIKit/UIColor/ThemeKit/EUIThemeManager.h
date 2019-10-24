//
//  EUIThemeManager.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "EUIThemeProtocol.h"

#pragma mark - ---| Notification |---

extern NSNotificationName const _Nullable FDUIThemeDidChangeNotification;

NS_ASSUME_NONNULL_BEGIN

/*!
 一个简单的换肤管理器
 */
@interface EUIThemeManager : NSObject

/*!
 当前正在应用的主题
 */
@property (nonatomic, strong) id <EUIThemeProtocol> currentTheme;

/*!
 单例调用
 */
+ (instancetype)sharedInstance;

/*!
 应用一个主题
 */
- (void)applyTheme:(id<EUIThemeProtocol>)theme;

@end

NS_ASSUME_NONNULL_END
