//
//  FDBaseView.m
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDBaseView.h"

@interface FDBaseView()
@end
@implementation FDBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.identifier = @"FDBaseView";
    self.backgroundColor = UIRandomColor;
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, identifier : %@, zIndex:%@",
            [super description],
            self.identifier,
            @(self.layer.zPosition)];
}

- (void)p_setHighlight:(BOOL)highlight {
    self.layer.shadowColor = self.backgroundColor.CGColor;
    if (highlight) {
        self.layer.shadowRadius = 4;
        self.layer.shadowOpacity = 1;
    } else {
        self.layer.shadowRadius = 0;
        self.layer.shadowOpacity = 9;
    }
}

- (UIView *)subviewByIdentifier:(NSString *)identifier {
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:FDBaseView.class]) {
            if ([[(FDBaseView *)subview identifier] isEqualToString:identifier]) {
                return subview;
            }
        }
    }
    return nil;
}

#pragma mark - ---| UIGestureRecognizerDelegate |---

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self p_setHighlight:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self p_setHighlight:NO];
    if (self.tapAction) {
        self.tapAction();
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self p_setHighlight:NO];
    if (self.tapAction) {
        self.tapAction();
    }
}

@end
