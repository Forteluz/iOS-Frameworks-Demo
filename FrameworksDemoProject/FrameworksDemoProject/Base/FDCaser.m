//
//  FDCaser.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/9/23.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDCaser.h"

@interface FDCaser()
@property (nonatomic, strong) NSMutableArray <NSDictionary *> *caseQueue;
@end
@implementation FDCaser

- (instancetype)init {
    self = [super init];
    if (self) {
        _caseQueue = @[].mutableCopy;
    }
    return self;
}

- (void)todo:(dispatch_block_t)todo {
    [self todo:todo completion:nil];
}

- (void)todo:(dispatch_block_t)todo completion:(dispatch_block_t)completion {
    [self todo:todo completion:completion animated:YES delay:2.f];
}

- (void)todo:(dispatch_block_t)todo
  completion:(dispatch_block_t)completion
    animated:(BOOL)animated
       delay:(NSTimeInterval)delay
{
    NSAssert(todo, @"Case代码 todo block 不能为空!");
    [self.class cancelPreviousPerformRequestsWithTarget:self];
    {
        NSMutableDictionary *package = @{}.mutableCopy;
        [package setObject:@(delay) forKey:@"delay"];
        [package setObject:@(animated) forKey:@"animated"];
        [package setObject:todo forKey:@"todo"];
        [package setObject:completion?:^{} forKey:@"completion"];
        [self.caseQueue addObject:package.copy];
    }
    [self performSelector:@selector(p_makeCase) withObject:nil afterDelay:0.5];
}

- (void)p_makeCase {
    if (self.caseQueue.count == 0) return;
    
    NSDictionary *package = self.caseQueue[0];
    dispatch_block_t todo = package[@"todo"];
    dispatch_block_t completion = package[@"completion"];
    NSTimeInterval delay = [package[@"delay"] doubleValue];
    BOOL animated = [package[@"animated"] boolValue];
    if ( animated ) {
         [UIView animateWithDuration:0.3 delay:delay
                             options:UIViewAnimationOptionCurveEaseIn
                          animations:^{
             todo();
         } completion:^(BOOL finished) {
             if (finished) {
                 !completion ?: completion();
                 [self p_doNext];
             }
         }];
     } else {
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
                        dispatch_get_main_queue(), ^
         {
             todo();
             !completion ?: completion();
             [self p_doNext];
         });
     }
}

- (void)p_doNext {
    [self.caseQueue removeObjectAtIndex:0];
    [self p_makeCase];
}

@end

