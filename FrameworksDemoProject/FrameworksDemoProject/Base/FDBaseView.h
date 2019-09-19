//
//  FDBaseView.h
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDHelper.h"

@interface FDBaseView : UIView

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) NSUInteger zIndex;

@property (nonatomic, copy) void (^tapAction)(void);

- (UIView *)subviewByIdentifier:(NSString *)identifier;

@end
