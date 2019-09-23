//
//  FDCALayerViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/19.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDCALayerViewController.h"

@interface FDCALayerViewController ()

@end

@implementation FDCALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_testZPosition];
}

#pragma mark - ---| Test Z Position |---

- (void)p_testZPosition {
    [self.view addSubview:({
        UIView *a = [self.helper newView:@"a" frame:CGRectMake(100, 200, 100, 100)];
        a.backgroundColor = [UIColor redColor]; a;
    })];
    [self.view addSubview:[self.helper newView:@"b" frame:CGRectMake(120, 220, 100, 100)]];
    [self.view addSubview:[self.helper newView:@"c" frame:CGRectMake(140, 240, 100, 100)]];
    [self.view addSubview:({
        UIView *d = [self.helper newView:@"d" frame:CGRectMake(160, 260, 100, 100)];
        d.backgroundColor = [UIColor blueColor]; d;
    })];
    
    NSArray *subviews = self.view.subviews;
    NSLog(@"视图层级：%@", subviews);
    /*! => Log
     视图层级：(
     "<FWTBaseView: 0x7fdc3640d1f0; frame = (0 0; 414 896); layer = <CALayer: 0x600000b649c0>>, identifier : a, zIndex:0",
     "<FWTBaseView: 0x7fdc36400f40; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64c00>>, identifier : b, zIndex:0",
     "<FWTBaseView: 0x7fdc36403c40; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64d00>>, identifier : c, zIndex:0",
     "<FWTBaseView: 0x7fdc3641c380; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64b00>>, identifier : d, zIndex:0"
     )
     */
    
    ///< Test Z Postion
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FDBaseView *one = subviews[1];
        BOOL isAnimatable = YES; ///< Test zPosition Animatable
        if ( isAnimatable ) {
            ///< 动画测试结果看不出来有任何区别，中间并没有看到补帧处理。
            [UIView animateWithDuration:1 animations:^{
                one.layer.zPosition = 1;
            }];
        } else {
            one.layer.zPosition = 1;
        }
        
        NSLog(@"修改 zPostion后，视图层级：%@", subviews);
        /*! => Log
         修改 zPostion后，视图层级：(
         "<FWTBaseView: 0x7fdc3640d1f0; frame = (0 0; 414 896); layer = <CALayer: 0x600000b649c0>>, identifier : a, zIndex:0",
         "<FWTBaseView: 0x7fdc36400f40; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64c00>>, identifier : b, zIndex:1",
         "<FWTBaseView: 0x7fdc36403c40; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64d00>>, identifier : c, zIndex:0",
         "<FWTBaseView: 0x7fdc3641c380; frame = (0 0; 414 896); layer = <CALayer: 0x600000b64b00>>, identifier : d, zIndex:0"
         )
         */
    });
    
    ///=========================   ===================================================
    /// 从视觉上，b 视图已经是最上层可见，但实际子视图在队列中的位置并未改变。
    /// 1 : 如果仅仅只是改变视觉层级可以直接设置 zPosition；
    /// 2 : 更加合理的处理逻辑还是从 view 的层级处理更好，因为 view 处理渲染还要处理事件等逻辑；
    ///     仅处理 zPosition 可能会对有层级相关的手势处理造成困扰；
    ///============================================================================
}
@end
