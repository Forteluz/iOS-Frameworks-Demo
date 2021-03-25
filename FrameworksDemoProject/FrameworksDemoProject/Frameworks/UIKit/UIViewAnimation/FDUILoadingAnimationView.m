//
//  FDUILoadingAnimationView.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2020/9/9.
//  Copyright © 2020 Lux. All rights reserved.
//

#import "FDUILoadingAnimationView.h"

static const CGFloat kHighLightSpeed = 384; //光线速度 单位pt/s
static const CGFloat kHighLightDuration = 1.27; //光线一次总时间 单位s

@interface FDUILoadingAnimationView()

@property (nonatomic, strong) UIImageView *highlightImgView;

@end

@implementation FDUILoadingAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor colorWithRed:243.0f/255.0f green:244.0f/255.0f blue:245.0f/255.0f alpha:1];
        [self addSubview:self.highlightImgView];
    }
    return self;
}

- (void)startLoadingAnimation {
    CAAnimation *anim = [self.highlightImgView.layer animationForKey:@"dc_loading_animation"];
    if (anim) {
        return;
    }
    
    CGSize imageSize = [self.highlightImgView sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.highlightImgView.frame = CGRectMake(-imageSize.width, (self.frame.size.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
    
    CGFloat moveWidth = kHighLightSpeed * kHighLightDuration;
    CGFloat fromCenterX = self.highlightImgView.center.x;
    CGFloat toCentenrX = fromCenterX + moveWidth;

    CAKeyframeAnimation *transformAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSMutableArray *transformValues = [NSMutableArray array];
    [transformValues addObject:[NSValue valueWithCGPoint:CGPointMake(fromCenterX, self.highlightImgView.center.y)]];
    [transformValues addObject:[NSValue valueWithCGPoint:CGPointMake(toCentenrX, self.highlightImgView.center.y)]];
    transformAnimation.values = transformValues;
    
    transformAnimation.duration = kHighLightDuration;
    transformAnimation.repeatCount = HUGE_VALF;
    transformAnimation.removedOnCompletion = NO;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.highlightImgView.layer addAnimation:transformAnimation forKey:@"dc_loading_animation"];
}

- (void)stopLoadingAnimation {
    [self.highlightImgView.layer removeAnimationForKey:@"dc_loading_animation"];
}

- (UIImageView *)highlightImgView {
    if (!_highlightImgView) {
        _highlightImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_white_1"]];
    }
    return _highlightImgView;
}

@end
