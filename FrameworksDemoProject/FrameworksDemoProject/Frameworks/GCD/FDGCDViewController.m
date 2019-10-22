//
//  FDGCDViewController.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/22.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "FDGCDViewController.h"

@interface FDGCDViewController () {
    dispatch_queue_t _syncQueue;
    dispatch_semaphore_t _lock;
}

@end

@implementation FDGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _syncQueue = dispatch_queue_create("com.lux.haha", DISPATCH_QUEUE_SERIAL);
    _lock = dispatch_semaphore_create(1);
    
    
    dispatch_async(_syncQueue, ^{
        NSLog(@"step 1");
        dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"step wait");
    });

    dispatch_async(self->_syncQueue, ^{
        NSLog(@"step 2");
        dispatch_async(self->_syncQueue, ^{
            NSLog(@"step 2_1");
            dispatch_async(self->_syncQueue, ^{
                NSLog(@"step 2_1_1");
            });
        });
        dispatch_async(self->_syncQueue, ^{
            NSLog(@"step haha");
        });
    });
    
    dispatch_async(self->_syncQueue, ^{
        dispatch_semaphore_signal(self->_lock);
        NSLog(@"step 3");
    });
}

@end
