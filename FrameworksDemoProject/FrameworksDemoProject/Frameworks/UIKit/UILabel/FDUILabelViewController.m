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
    
    /*
     当设定行数后，sizeThatFits算出的宽度并不会受限于给定的的宽度，而是在指定行数内"fit"出了一个能展示所有文字的宽度。
     而”截断“属性（lineBreakMode）是根据设定的frame宽度截字符。
     结论：在「指定行数」「有限宽度」「超出显示”...“」的场景下，合适的做法是在sizeThatFits后只取size高度作为文字高度，而宽度直接设置为有限宽度（而不是size宽度）
     */
    UILabel *lbl5 = [self createLabelToFit];
    lbl5.backgroundColor = [UIColor blueColor];
    lbl5.numberOfLines = 1;
    lbl5.text = @"一行的文字会在宽度内自适应吗？";
    CGFloat limitWidth = 50; ///< 想要文字在限定宽度内显示
    CGSize size5 = [lbl5 sizeThatFits:CGSizeMake(limitWidth, MAXFLOAT)];
    lbl5.frame = CGRectMake(100, CGRectGetMaxY(lbl4.frame) + 50, limitWidth, size5.height); ///如果设置的是size5.width，那就不会折行了！
    
    /*
     文字设置富文本后再直接设text,会替换调富文本中的text，但不会替换掉富文本设置的其他属性
     */
    UILabel *lbl6 = [self createLabelToFit];
    lbl6.textColor = [UIColor grayColor];
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                   NSForegroundColorAttributeName:[UIColor redColor]
    };
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"123" attributes:attributeDic];
    if (attr) { ///< 这样判断并不能判断空字符
        lbl6.attributedText = attr;
    }
    lbl6.text = @"我是正经文本";
    lbl6.frame = CGRectMake(100, CGRectGetMaxY(lbl5.frame) + 50, 100, 100);
    
    /*
     给label的attributedText赋值NSString类型会直接导致崩溃
     */
    
    /*
     如果一个layer（不仅是渐变layer）既没有颜色也没有边框，那么就不会展示阴影
     */
    CAGradientLayer *testLayer = [CAGradientLayer new];
    [self.view.layer addSublayer:testLayer];
    
    //颜色2选1
//    testLayer.colors = @[(id)([UIColor greenColor].CGColor), (id)[UIColor greenColor].CGColor];
//    testLayer.backgroundColor = [UIColor greenColor].CGColor;
   
    //边框两行都要有
//    testLayer.borderWidth = 1;
//    testLayer.borderColor = [UIColor greenColor].CGColor;
    
    testLayer.frame = CGRectMake(100, CGRectGetMaxY(lbl6.frame) + 50, 100, 100);
    testLayer.shadowOpacity = 0.5; //opacity默认是0, 不设也会不展示阴影
    testLayer.shadowColor = [UIColor grayColor].CGColor;
    
    NSInteger i = 14;
    NSInteger u = i % 8;
    NSLog(@"%ld", u);
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 400, 40, 30);
    btn.enabled = NO;
    [btn setTitle:@"123" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    NSMutableArray *arr = nil;
    if (arr <= 0) {
        NSLog(@"<=0");
    }
    if (arr.count <= 0) {
        NSLog(@"count<=0");
    }
    
    NSString *a = @"123";
    NSString *b = nil;
    NSString *str = [NSString stringWithFormat:@"%@ %@", a, b];
    NSLog(@"%@", str);
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
