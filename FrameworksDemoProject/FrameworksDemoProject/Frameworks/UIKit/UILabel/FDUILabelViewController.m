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
    /*
     指定行数的label，即使是设置同样宽度，在大部分机型上的首行字数不一定相同（不一定填满宽度）
     如下所示:
     lbl1是正常情况，一行能显示六字；
     lbl2在@"文案两行应该文案"、2行限制、共8字的情况下，第一行只会显示5字；
     lbl3在lbl2的基础上修改了总字数，共9字，恢复了正常显示，第一行显示6字；（对照实验）
     lbl3在lbl2j的基础上修改了字符为@"文案两行八字试试"，恢复了正常显示，第一行显示6字。（对照实验）
     结论：
     UIlabel在大部分机型下排版会做处理导致不占满宽度直接换行。某种情况的影响因素：字符是什么、总字数与行数的比例。（iphone8p例外，原因不明）
     */
    UILabel *lbl1 = [self createLabelToFit];
    lbl1.backgroundColor = [UIColor greenColor];
    lbl1.text = @"文案一行六字";
    CGSize size1 = [lbl1 sizeThatFits:CGSizeMake(80, 80)];
    size1 = CGSizeMake(ceilf(size1.width), ceilf(size1.height));
    lbl1.frame = CGRectMake(100, 100, size1.width, size1.height);
     
    UILabel *lbl2 = [self createLabelToFit];
    lbl2.backgroundColor = [UIColor redColor];
    lbl2.text = @"文案两行应该文案";
    CGSize size2 = [lbl2 sizeThatFits:CGSizeMake(80, 80)];
    size2 = CGSizeMake(ceilf(size2.width), ceilf(size2.height));
    lbl2.frame = CGRectMake(100, CGRectGetMaxY(lbl1.frame), size2.width, size2.height);
    
    UILabel *lbl3 = [self createLabelToFit];
    lbl3.backgroundColor = [UIColor yellowColor];
    lbl3.text = @"文案两行应该文案呀";
    CGSize size3 = [lbl3 sizeThatFits:CGSizeMake(80, 80)];
    size3 = CGSizeMake(ceilf(size3.width), ceilf(size3.height));
    lbl3.frame = CGRectMake(100, CGRectGetMaxY(lbl2.frame), size3.width, size3.height);
    
    UILabel *lbl4 = [self createLabelToFit];
    lbl4.backgroundColor = [UIColor yellowColor];
    lbl4.text = @"文案两行八字试试";
    CGSize size4 = [lbl4 sizeThatFits:CGSizeMake(80, 80)];
    size4 = CGSizeMake(ceilf(size4.width), ceilf(size4.height));
    lbl4.frame = CGRectMake(100, CGRectGetMaxY(lbl3.frame), size4.width, size4.height);
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
