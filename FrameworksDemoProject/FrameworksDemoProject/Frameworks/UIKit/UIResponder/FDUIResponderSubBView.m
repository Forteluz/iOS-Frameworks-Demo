//
//  FDUIResponderSubBView.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/10/29.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIResponderSubBView.h"
#import "FDUITapGestureRecognizer.h"
#import "FDUIPanGestureRecognizer.h"

@implementation FDUIResponderSubBView

- (void)layoutSubviews {
    [super layoutSubviews];
//    [self setupGesture];
}

- (void)setupGesture {
    FDUITapGestureRecognizer *gesture = [[FDUITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_gestureAction)];
    //    FDUIPanGestureRecognizer *gesture = [FDUIPanGestureRecognizer new];
    [self addGestureRecognizer:gesture];
    gesture.gestureBegin = ^{
        NSLog (@"调用B视图手势的touchBegin");
    };
    gesture.gestureMoved = ^{
        NSLog(@"调用B视图手势的touchMoved");
    };
    gesture.gestureEnded = ^{
        NSLog(@"调用B视图手势的touchEnded");
    };
    gesture.gestureCancelled = ^{
        NSLog(@"调用B视图手势的touchCancelled");
    };
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"B的hitTest开始调用");
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"B的hitTest结束调用");
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isPointInside = [super pointInside:point withEvent:event];
    if (isPointInside) {
        NSLog(@"点在B里");
    } else {
        NSLog(@"点不在B里");
    }
    return isPointInside;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用B的touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用B的touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用B的touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用B的touchesCancelled");
    [super touchesCancelled:touches withEvent:event];
}

#pragma mark Action
- (void)p_gestureAction {
    NSLog(@"B视图手势的动作被触发了");
}

@end
