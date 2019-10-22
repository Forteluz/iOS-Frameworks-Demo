//
//  FDUIAppearanceView.h
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/16.
//  Copyright © 2019 Lux. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDUIAppearanceView : UIView {
    UILabel *_label;
}

@property (nonatomic, strong) UIColor *testBackgroundColor UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign) BOOL isTestAppearance UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign) UIEdgeInsets inner;

@property (nonatomic, assign) NSInteger testNumber __attribute__((annotate("<FDDP>")));

@end

NS_ASSUME_NONNULL_END
