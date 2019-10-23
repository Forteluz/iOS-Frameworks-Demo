//
//  UIView+FDUIColor.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (FDUIColor)
- (void)fd_updateColor;
@end

@interface UIView (FDUIColor)
- (void)fd_updateColor;
@end

NS_ASSUME_NONNULL_END
