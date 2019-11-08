//
//  FDUIPanGestureRecognizer.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/10/30.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIPanGestureRecognizer.h"

@implementation FDUIPanGestureRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.gestureBegin) {
        self.gestureBegin();
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.gestureMoved) {
        self.gestureMoved();
    }
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.gestureEnded) {
        self.gestureEnded();
    }
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.gestureCancelled) {
        self.gestureCancelled();
    }
    [super touchesCancelled:touches withEvent:event];
}

@end
