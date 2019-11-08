//
//  FDUITapGestureRecognizer.h
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/10/30.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDUITapGestureRecognizer : UITapGestureRecognizer

@property (nonatomic, copy) void (^gestureBegin)(void);
@property (nonatomic, copy) void (^gestureMoved)(void);
@property (nonatomic, copy) void (^gestureEnded)(void);
@property (nonatomic, copy) void (^gestureCancelled)(void);

@end

NS_ASSUME_NONNULL_END
