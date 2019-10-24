//
//  FDUITheme.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/24.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EUIThemeProtocol.h"

NS_ASSUME_NONNULL_BEGIN
///< Base Class
@interface FDUITheme : NSObject <EUIThemeProtocol>
- (UIColor *)fd_primaryColor;
- (UIColor *)fd_secondaryColor;
- (UIColor *)fd_textColor;
- (UIColor *)fd_backgrounndColor;
- (UIFont  *)fd_textFont;
@end

@interface FDUIRedTheme  : FDUITheme @end
@interface FDUIBlueTheme : FDUITheme @end

NS_ASSUME_NONNULL_END
