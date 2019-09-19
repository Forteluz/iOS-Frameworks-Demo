//
//  FDBaseViewController.m
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDBaseViewController.h"

@implementation FDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (FDBaseView *)newView:(NSString *)identifier {
    return [self newView:identifier frame:self.view.bounds];
}

- (FDBaseView *)newView:(NSString *)identifier frame:(CGRect)frame {
    FDBaseView *one = [FDBaseView new];
    one.identifier = identifier;
    one.frame = frame;
    return one;
}

@end
