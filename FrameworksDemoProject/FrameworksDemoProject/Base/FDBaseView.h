//
//  FDBaseView.h
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDBaseView : UIView <UIAppearanceContainer>

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) NSUInteger zIndex;

@property (nonatomic, copy) void (^tapAction)(void);

@property (nonatomic, copy) void (^layoutSubviewsBlock)(FDBaseView *hi);

- (UIView *)subviewByIdentifier:(NSString *)identifier;

@property (nonatomic, strong) UIColor *highlightColor UI_APPEARANCE_SELECTOR;

@end
