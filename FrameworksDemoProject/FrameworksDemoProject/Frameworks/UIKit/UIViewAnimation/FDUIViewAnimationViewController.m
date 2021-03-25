//
//  FDUIViewAnimationViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/9.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIViewAnimationViewController.h"
#import "FDUILoadingAnimationView.h"

@interface FDUIViewAnimationViewController ()

@end

@implementation FDUIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_testSlowAnimation];
}

- (void)p_testSlowAnimation {
//    static int i = 1;
//    FDBaseView *a = [self.helper newView:@"Tap Me" frame:CGRectMake(100, 200, 100, 100)];
//    a.tapAction = ^{
//        CGFloat speed = 0;
//        if ( i % 2 == 0) {
//            speed = 1;
//        }
//        [(CALayer *)[[[[UIApplication sharedApplication] windows] objectAtIndex:0] layer] setSpeed:.1f];
//        i ++;
//
//    };
//    [self.view addSubview:a];
//
//    [UIView animateWithDuration:0.3
//                          delay:2
//                        options:UIViewAnimationOptionBeginFromCurrentState
//                     animations:^
//    {
//        a.frame = CGRectMake(130, 300, 200, 200);
//    } completion:^(BOOL finished) {
//
//    }];
    FDUILoadingAnimationView *view = [[FDUILoadingAnimationView alloc] initWithFrame:CGRectMake(10, 200, 250, 20)];
    [self.view addSubview:view];
    [view startLoadingAnimation];
    
    FDUILoadingAnimationView *view2 = [[FDUILoadingAnimationView alloc] initWithFrame:CGRectMake(10, 250, 400, 75)];
    [self.view addSubview:view2];
    [view2 startLoadingAnimation];
    
    FDBaseView *a = [self.helper newView:@"Tap Me" frame:CGRectMake(100, 100, 100, 200)];
    a.backgroundColor = [UIColor greenColor];
    __weak FDBaseView *weakA = a;
    a.tapAction = ^{
//        [view2 stopLoadingAnimation];
        [UIView animateWithDuration:0.3 animations:^{
            NSLog(@"anim");
            __strong FDBaseView *strongA = weakA;
            strongA.frame = CGRectMake(100, 200, 100, 100);
            [strongA.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.frame = CGRectMake(0, 0, strongA.bounds.size.width - 50, strongA.bounds.size.height - 50);
            }];
//            [strongA layoutIfNeeded];
        } completion:^(BOOL finished) {
            NSLog(@"completed");
        }];
    };
    [self.view addSubview:a];
    
    FDBaseView *subview = [FDBaseView new];
    subview.backgroundColor = [UIColor redColor];
    [a addSubview:subview];
    
    a.layoutSubviewsBlock = ^(FDBaseView *hi) {
        NSLog(@"layout");
        [hi.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.frame = CGRectMake(0, 10, hi.bounds.size.width - 50, hi.bounds.size.height - 50);
        }];
    };
}

@end

@interface UIView (TestSlowAnimation)
@end

@implementation UIView (TestSlowAnimation)


@end
