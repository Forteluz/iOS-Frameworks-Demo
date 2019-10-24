//
//  FDUIThemeProtocol.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/24.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EUIThemeProtocol <NSObject>

/*!
 主题需要指定一个唯一 ID
 */
@property (nonatomic, copy) NSString *identifier;

@end
