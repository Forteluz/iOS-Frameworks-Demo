//
//  FDHelper.h
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDBaseView.h"

/*!
 获取一个 RGBA 色
 */
#ifndef UIColorRGBA
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#endif

/*!
 获取一个随机色
 */
#ifndef UIRandomColor
#define UIRandomColor UIColorRGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)
#endif


@interface FDHelper : NSObject

- (FDBaseView *)newView:(NSString *)identifier;
- (FDBaseView *)newView:(NSString *)identifier frame:(CGRect)frame;

@end

