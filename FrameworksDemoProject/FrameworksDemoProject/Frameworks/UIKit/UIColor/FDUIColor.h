//
//  FDUIColor.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDUIColor : UIColor
@property (nonatomic, strong) UIColor *p_color;
@property (nonatomic, copy) UIColor * (^provider)(id);

+ (UIColor *)fd_colorWithProvider:(UIColor *(^)(id))provider;

@end

NS_ASSUME_NONNULL_END
