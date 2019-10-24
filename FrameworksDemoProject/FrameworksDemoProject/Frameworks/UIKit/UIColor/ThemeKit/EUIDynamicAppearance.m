//
//  EUIDynamicAppearance.m
//  FrameworksDemoProject
//
//  Created by Lux on 2019/10/24.
//  Copyright © 2019 Lux. All rights reserved.
//

#import "EUIDynamicAppearance.h"
#import "FDRuntime.h"

#define EUI_APPEARANCE_REGISTER(_cls_, _invocation_) \
    [_EUIDynamicAppearanceRegister bindClass:_cls_ invocation:_invocation_];

#define EUI_APPEARANCE_SETTERS(_cls_) \
    [_EUIDynamicAppearanceRegister invocationsByClass:_cls_];

#pragma mark - ---| EUIDynamicAppearance |---

@interface _EUIDynamicAppearanceRegister : NSObject
@property (nonatomic, strong) NSMutableDictionary *setters;
@end
@implementation _EUIDynamicAppearanceRegister

+ (instancetype)sharedInstance {
    static _EUIDynamicAppearanceRegister *one;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        one = [[_EUIDynamicAppearanceRegister alloc] init];
    });
    return one;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _setters = @{}.mutableCopy;
    }
    return self;
}

+ (void)bindClass:(Class)class invocation:(NSInvocation *)invocation {
    [[self sharedInstance] bindClass:class invocation:invocation];
}

- (void)bindClass:(Class)class invocation:(NSInvocation *)invocation {
    /*! @{ cls : @{ @"sel" : invocation,
                    @"sel" : invocation,
                    @"sel" : invocation,
                  },
           cls : @{ ... },
        */
       NSString *sel = NSStringFromSelector(invocation.selector);
       NSString *cls = NSStringFromClass(class);
       NSMutableDictionary *setterInfo = self.setters[cls];
       if (setterInfo == nil) {
           setterInfo = @{}.mutableCopy;
           self.setters[cls] = setterInfo;
       }
       [setterInfo setObject:invocation forKey:sel];
}

+ (NSArray <NSInvocation *> *)invocationsByClass:(Class)cls {
    return [[self sharedInstance] invocationsByClass:cls];
}

- (NSArray <NSInvocation *> *)invocationsByClass:(Class)cls {
    NSMutableDictionary *setterInfo = self.setters[NSStringFromClass(cls)];
    if (!!setterInfo) {
        return [setterInfo allValues];
    }
    return nil;
}

@end

@interface _EUIDynamicAppearance : NSObject
@property (nonatomic, weak) NSObject *object;
@property (nonatomic, assign) Class cls;
@end
@implementation _EUIDynamicAppearance
@end

#pragma mark - ---| NSObject(EUIDynamicAppearance) |---

static const void *kEUIDynamicAppearanceKey = &kEUIDynamicAppearanceKey;

@implementation NSObject(EUIDynamicAppearance)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"_UIAppearance");
        SEL fromSelector = @selector(forwardInvocation:);
        SEL toSelector = @selector(eui_forwardInvocation:);
        Method fromMethod = class_getInstanceMethod(class, fromSelector);
        Method toMethod = class_getInstanceMethod(class, toSelector);
        if(class_addMethod(class, fromSelector, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
            class_replaceMethod(class, toSelector, method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod));
        } else {
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });
}

- (void)set_euiDynamic:(_EUIDynamicAppearance *)one {
    objc_setAssociatedObject(self, kEUIDynamicAppearanceKey, one, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (_EUIDynamicAppearance *)eui_dynamic {
    return objc_getAssociatedObject(self, kEUIDynamicAppearanceKey);
}

+ (id)eui_appearance {
    Class cls = [self class];
    id appearance = [cls appearance];
    
    _EUIDynamicAppearance *one = [appearance eui_dynamic];
    if ([appearance eui_dynamic] == nil) {
        [appearance set_euiDynamic:({
            one = [_EUIDynamicAppearance new];
            one;
        })];
    }
    one.object = one;
    one.cls = cls;
    
    return appearance;
}

- (BOOL)eui_forwardInvocation:(NSInvocation *)anInvocation {
    _EUIDynamicAppearance *dynamic = [self eui_dynamic];
    if (!!dynamic) EUI_APPEARANCE_REGISTER(dynamic.cls, anInvocation);
    return [self eui_forwardInvocation:anInvocation];
}

- (NSArray <NSInvocation *> *)eui_registeredSetters {
    Class cls = [self class];
    return EUI_APPEARANCE_SETTERS(cls);
}

- (void)eui_invokeEUIAppearanceSelectors {
    NSArray <NSInvocation *> *setters = [self eui_registeredSetters];
    if ( setters ) {
        [setters enumerateObjectsUsingBlock:^(NSInvocation *obj, NSUInteger idx, BOOL *stop) {
            [obj invokeWithTarget:self];
            [obj invoke];
        }];
    }
}

@end
