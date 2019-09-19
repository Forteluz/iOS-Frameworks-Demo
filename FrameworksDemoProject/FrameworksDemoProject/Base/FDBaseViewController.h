//
//  FDBaseViewController.h
//  FrameWorksTest
//
//  Created by Lux on 2019/9/18.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDBaseView.h"

@interface FDBaseViewController : UIViewController

- (FDBaseView *)newView:(NSString *)identifier;
- (FDBaseView *)newView:(NSString *)identifier frame:(CGRect)frame;

@end

