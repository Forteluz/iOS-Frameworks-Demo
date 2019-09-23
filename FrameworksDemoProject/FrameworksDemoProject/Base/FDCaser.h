//
//  FDCaser.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 简单的 Case 执行器，主要用于测试 UIKit 系列功能
 */
@interface FDCaser : NSObject

///< Easy to use
- (void)todo:(dispatch_block_t)todo;

///< Easy to use
- (void)todo:(dispatch_block_t)todo completion:(dispatch_block_t)completion;

///< Easy to use ?
- (void)todo:(dispatch_block_t)todo completion:(dispatch_block_t)completion
    animated:(BOOL)animated
       delay:(NSTimeInterval)delay;

@end

