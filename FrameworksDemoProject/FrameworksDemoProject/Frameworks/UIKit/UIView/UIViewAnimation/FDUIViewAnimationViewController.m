//
//  FDUIViewAnimationViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/9.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIViewAnimationViewController.h"

@interface FDUIViewAnimationViewController ()

@end

@implementation FDUIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_testSlowAnimation];
}


- (void)p_testSlowAnimation {
    static int i = 1;
    FDBaseView *a = [self.helper newView:@"Tap Me" frame:CGRectMake(100, 200, 100, 100)];
    a.tapAction = ^{
        CGFloat speed = 0;
        if ( i % 2 == 0) {
            speed = 1;
        }
        [(CALayer *)[[[[UIApplication sharedApplication] windows] objectAtIndex:0] layer] setSpeed:.1f];
        i ++;
    };
    [self.view addSubview:a];
    
    [UIView animateWithDuration:0.3
                          delay:2
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
    {
        a.frame = CGRectMake(130, 300, 200, 200);
    } completion:^(BOOL finished) {
        
    }];
}

@end

@interface UIView (TestSlowAnimation)
@end

@implementation UIView (TestSlowAnimation)


@end
