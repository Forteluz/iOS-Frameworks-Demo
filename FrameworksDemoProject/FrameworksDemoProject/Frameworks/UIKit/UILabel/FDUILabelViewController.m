//
//  FDUILabelViewController.m
//  FrameworksDemoProject
//
//  Created by Hanniya on 2019/9/27.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDUILabelViewController.h"

@interface FDUILabelViewController ()

@end

@implementation FDUILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_testLabelFitSize];
}

- (void)p_testLabelFitSize {
    UILabel *lbl1 = [self createLabelToFit];
    lbl1.text = @"文案一行六字";
    CGSize size1 = [lbl1 sizeThatFits:CGSizeMake(90, 80)];
    size1 = CGSizeMake(ceil(size1.width), ceil(size1.height));
    lbl1.frame = CGRectMake(100, 100, size1.width, size1.height);
    
    UILabel *lbl2 = [self createLabelToFit];
    lbl2.text = @"文案两行应该八字";
    CGSize size2 = [lbl2 sizeThatFits:CGSizeMake(99, 80)];
    size2 = CGSizeMake(ceil(size2.width), ceil(size2.height));
    lbl2.frame = CGRectMake(100, CGRectGetMaxY(lbl1.frame), size2.width, size2.height);
    
//    CGSize csize = NSString bou
}

- (UILabel *)createLabelToFit {
    UILabel *lbl = [UILabel new];
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.numberOfLines = 2;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:lbl];
    return lbl;
}

@end
