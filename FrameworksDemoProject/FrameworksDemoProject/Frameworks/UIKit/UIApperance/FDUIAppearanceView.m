//
//  FDUIAppearanceView.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/16.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUIAppearanceView.h"

@implementation FDUIAppearanceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor yellowColor];
        _label.text = @"FDUIAppearanceView";
        [self addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews __attribute__((annotate("oclint:enforce[must call super]"))) {
    _label.frame = CGRectMake(_inner.left,
                              _inner.top,
                              self.bounds.size.width - _inner.left - _inner.right,
                              self.bounds.size.height - _inner.top - _inner.bottom);
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat inner_w = _inner.left + _inner.right;
    CGFloat inner_h = _inner.top + _inner.bottom;
    CGSize newSize = {0};
    CGSize cntSize = CGSizeMake(size.width - inner_w, size.height - inner_h);
    CGSize labSize = [_label textRectForBounds:(CGRect){.size = cntSize} limitedToNumberOfLines:1].size;
    newSize = CGSizeMake(labSize.width + inner_w, labSize.height + inner_h);
    return newSize;
}

- (void)setTestBackgroundColor:(UIColor *)testBackgroundColor {
    _testBackgroundColor = testBackgroundColor;
    [self setBackgroundColor:testBackgroundColor];
}

- (void)setIsTestAppearance:(BOOL)isTestAppearance {
    _isTestAppearance = isTestAppearance;
}

- (void)setInner:(UIEdgeInsets)inner {
    _inner = inner;
    [self setNeedsLayout];
}

@end
