//
//  FDUIColorTemplet.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIColorTemplet.h"
#import "FDUIColorManager.h"

@implementation FDUIColorTemplet


+ (UIColor *)fd_viewControllerBackgroundColor {
    return [UIColor fd_colorWithProvider:^UIColor *(FDUIColorManager *manager) {
        if (manager.isDark) {
            return UIColor.blackColor;
        } else {
            return UIColor.whiteColor;
        }
    }];
}


+ (UIColor *)fd_buttonBackgrounColor {
    return [UIColor fd_colorWithProvider:^UIColor *(FDUIColorManager *manager) {
        if (manager.isDark) {
            return UIColor.redColor;
        } else {
            return UIColor.yellowColor;
        }
    }];
}


+ (UIColor *)fd_buttonBorderColor {
    return [UIColor fd_colorWithProvider:^UIColor *(FDUIColorManager *manager) {
        if (manager.isDark) {
            return UIColor.yellowColor;
        } else {
            return UIColor.redColor;
        }
    }];
}

@end
