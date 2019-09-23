//
//  FDHelper.m
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDHelper.h"

@implementation FDHelper

- (FDBaseView *)newView:(NSString *)identifier {
    return [self newView:identifier frame:CGRectMake(0, 0, 100, 100)];
}

- (FDBaseView *)newView:(NSString *)identifier frame:(CGRect)frame {
    FDBaseView *one = [FDBaseView new];
    one.identifier = identifier;
    one.backgroundColor = UIRandomColor;
    one.frame = frame;
    return one;
}

@end
