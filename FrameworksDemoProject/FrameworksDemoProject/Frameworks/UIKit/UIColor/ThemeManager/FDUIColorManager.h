//
//  FDUIColorManager.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDUIColor.h"
#import "UIView+FDUIColor.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 一个简单的换肤管理器
 */
@interface FDUIColorManager : NSObject
@property (nonatomic, assign) BOOL isDark;

+ (instancetype)sharedInstance;
- (void)updateTheme:(NSString *)theme;

@end

NS_ASSUME_NONNULL_END
