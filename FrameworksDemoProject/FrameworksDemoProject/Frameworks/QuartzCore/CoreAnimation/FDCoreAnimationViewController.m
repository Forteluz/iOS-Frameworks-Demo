//
//  FDCoreAnimationViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/9.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDCoreAnimationViewController.h"

@interface FDCoreAnimationViewController ()
@property (nonatomic, assign) BOOL isSlowAnimation;
@property (nonatomic, strong) FDBaseView *slowBtn;
@end

@implementation FDCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.slowBtn = [self.helper newView:@"Tap Me" frame:CGRectMake(100, 200, 100, 100)];
    self.slowBtn.tapAction = ^{
        CGFloat speedRate = self.isSlowAnimation ? .1 : 1.;
        [(CALayer *)[[[[UIApplication sharedApplication] windows] objectAtIndex:0] layer] setSpeed:speedRate];
        [self setIsSlowAnimation:!self.isSlowAnimation];
        [self p_testSlowAnimation];
    };
    
    [self.view addSubview:self.slowBtn];
}

- (void)p_testSlowAnimation {
    [UIView animateWithDuration:0.3
                          delay:0.5
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^
    {
        if (self.slowBtn.frame.origin.x == 130) {
            self.slowBtn.frame = CGRectMake(100, 200, 100, 100);
        } else {
            self.slowBtn.frame = CGRectMake(130, 300, 200, 200);
        }
    } completion:^(BOOL finished) {
        
    }];
}


@end
