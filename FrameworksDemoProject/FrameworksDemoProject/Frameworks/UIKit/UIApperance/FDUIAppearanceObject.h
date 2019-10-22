//
//  FDUIAppearanceObject.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/16.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 测试如何让一个 NSObject 支持 UIAppearance
 */
@interface FDUIAppearanceObject : NSObject <UIAppearance>

@property (nonatomic, assign) BOOL isTestAppearance UI_APPEARANCE_SELECTOR;

@end

NS_ASSUME_NONNULL_END
