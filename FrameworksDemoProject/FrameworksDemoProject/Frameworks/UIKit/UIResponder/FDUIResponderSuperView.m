//
//  FDUIResponderSuperView.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/10/29.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIResponderSuperView.h"
#import "FDUIResponderSubAView.h"
#import "FDUIResponderSubBView.h"
#import "FDUIPanGestureRecognizer.h"
#import "FDUITapGestureRecognizer.h"

@interface FDUIResponderSuperView ()

@property (nonatomic, strong) FDUIResponderSubBView *viewB;

@end

@implementation FDUIResponderSuperView

- (void)layoutSubviews {
    [super layoutSubviews];
    /*
     Demo1：UIResponder的两个事件处理过程：寻找最佳响应者、依次处理事件
        视图层级：
        SuperView
        ├── SubviewA（红）
        └── SubviewB（黄）
        Test1：点击非SuperView的区域
        Test2：点击SuperView内非A非B区域
        Test3：点击B（后添加的视图）
        Test4：点击A
        Test5：点击A在父视图外面的部分
        Test6：打断点在touchBegan，验证调用栈里UIWindow的sendEvent:
     */
    [self p_setupSubiews];
    
    /*
     Demo2：父视图UIGestureRecognizer与子视图UIResponder事件响应的优先级
        父视图有横滑手势；子视图无手势，如果touchBegin-touchEnded
        Test1：点击A-父视图横滑识别失败，不取消A的处理（没有Moved）
        Test2：横滑A-父视图横滑识别成功，触发动作，取消A的处理（touchCancelled）
        结论：父视图的手势处理优先级比最佳响应者高
     */
    [self p_setupGesture];
    
    /*
     Demo3：父视图UIGestureRecognizer与子视图UIButton事件响应的优先级
        父视图有横滑手势；子视图Button
        Test1：父视图有横滑手势，横滑子视图Button，只响应Button
        Test2：父视图手势设置delayTouchesBegan，响应父视图
     */
    [self p_setupButton];
}

- (void)p_setupSubiews {
    FDUIResponderSubAView *viewA = [FDUIResponderSubAView new];
    viewA.backgroundColor = [UIColor redColor];
    viewA.frame = CGRectMake(0, 0, 50, 50);
    
    self.viewB = [FDUIResponderSubBView new];
    self.viewB.backgroundColor = [UIColor yellowColor];
    self.viewB.frame = CGRectMake(20, 20, 100, 200);
    
    [self addSubview:viewA];
    [self addSubview:self.viewB];
}

- (void)p_setupGesture {
    FDUIPanGestureRecognizer *gesture = [[FDUIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_gestureAction)];
    
    /* Demo3 Test2 */
//    FDUITapGestureRecognizer *gesture = [[FDUITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_gestureAction)];
//    gesture.delaysTouchesBegan = YES;
    
    [self addGestureRecognizer:gesture];
    gesture.gestureBegin = ^{
        NSLog (@"调用父视图手势的touchBegin");
    };
    gesture.gestureMoved = ^{
        NSLog(@"调用父视图手势的touchMoved");
    };
    gesture.gestureEnded = ^{
        NSLog(@"调用父视图手势的touchEnded");
    };
    gesture.gestureCancelled = ^{
        NSLog(@"调用父视图手势的touchCancelled");
    };
}

- (void)p_setupButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(150, 150, 50, 50);
    [btn addTarget:self action:@selector(p_BtnAction) forControlEvents:UIControlEventTouchUpInside];
    
//    FDUITapGestureRecognizer *gesture = [[FDUITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_gestureAction)];
//    [btn addGestureRecognizer:gesture];
//    gesture.gestureBegin = ^{
//        NSLog (@"调用Button手势的touchBegin");
//    };
//    gesture.gestureMoved = ^{
//        NSLog(@"调用Button手势的touchMoved");
//    };
//    gesture.gestureEnded = ^{
//        NSLog(@"调用Button手势的touchEnded");
//    };
//    gesture.gestureCancelled = ^{
//        NSLog(@"调用Button手势的touchCancelled");
//    };
   
    [self addSubview:btn];
}

#pragma mark Hit-Testing
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"父视图的hitTest开始调用");
    UIView *view = [super hitTest:point withEvent:event];
    /*
     Demo1应用-解决方案1
     */
//    if (view == nil) { //如果找不到合适的响应者
//        CGPoint newPoint = [self.viewB convertPoint:point fromView:self]; //转换为子视图坐标系
//        if (CGRectContainsPoint(self.viewB.bounds, newPoint)
//            && !self.viewB.isHidden
//            && self.viewB.alpha > 0.01
//            && self.viewB.userInteractionEnabled) {
//            view = self.viewB; // 满足B能够响应的条件,返回视图B
//        }
//    }
    
    NSLog(@"父视图的hitTest结束调用");
    NSLog(@"-------------------------");
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isPointInside = [super pointInside:point withEvent:event];
    if (isPointInside) {
        NSLog(@"点在父视图里");
    } else {
        NSLog(@"点不在父视图里");
        /*
        Demo1应用-解决方案2
        */
//        CGPoint newPoint = [self.viewB convertPoint:point fromView:self]; //转换为子视图坐标系
//        if (CGRectContainsPoint(self.viewB.bounds, newPoint)) {
//            return YES;
//        }
        
    }
    return isPointInside;
}

#pragma mark 事件处理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用父视图的touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用父视图的touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用父视图的touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"调用父视图的touchesCancelled");
    [super touchesCancelled:touches withEvent:event];
}

#pragma mark Action
- (void)p_gestureAction {
    NSLog(@"父视图手势的动作被触发了");
}

- (void)p_BtnAction {
    NSLog(@"Button的动作被触发了");
}

@end
