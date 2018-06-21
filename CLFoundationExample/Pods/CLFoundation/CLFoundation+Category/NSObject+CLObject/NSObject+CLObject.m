//
//  NSObject+CLObject.m
//  CLFoundationExample
//
//  Created by Cain Luo on 2018/2/21.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "NSObject+CLObject.h"
#import "NSString+CLString.h"
#import <objc/objc.h>

static const int CLObjectKVOBlockCategoryKey;

#pragma mark - KVO Block Object Category
@interface CLObjectKVOBlockCategory : NSObject

@property (nonatomic, copy) CLObjectKVOBlock cl_objectKVOBlock;

- (instancetype)initWithObjectKVOBlock:(CLObjectKVOBlock)block;

@end

@implementation CLObjectKVOBlockCategory

- (instancetype)initWithObjectKVOBlock:(CLObjectKVOBlock)block {
    
    self = [super init];
    
    if (self) {
        
        self.cl_objectKVOBlock = block;
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    if (!self.cl_objectKVOBlock) {
        return;
    }
    
    BOOL cl_isPrior = [[change objectForKey:NSKeyValueChangeNotificationIsPriorKey] boolValue];
    
    if (cl_isPrior) {
        
        return;
    }
    
    NSKeyValueChange cl_keyValueChange = [[change objectForKey:NSKeyValueChangeKindKey] integerValue];
    
    if (cl_keyValueChange != NSKeyValueChangeSetting) {
        return;
    }
    
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    if (oldValue == [NSNull null]) {
        
        oldValue = nil;
    }
    
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    if (newValue == [NSNull null]) {
        
        newValue = nil;
    }
    
    if (self.cl_objectKVOBlock) {
        
        self.cl_objectKVOBlock(object, oldValue, newValue);
    }
}

@end

@implementation NSObject (CLObject)

#pragma mark - Runtime
+ (void)cl_exchangeImplementationsWithClass:(Class)class
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector {
    
    Method cl_originalMethod = class_getInstanceMethod(class, originalSelector);
    Method cl_swizzledSelector = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL cl_didAddMethod = [self cl_addMethodWithClass:class
                                      originalSelector:originalSelector
                                      swizzledSelector:swizzledSelector];
    
    if (cl_didAddMethod) {

        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(cl_originalMethod),
                            method_getTypeEncoding(cl_originalMethod));
    } else {
        
        method_exchangeImplementations(cl_originalMethod, cl_swizzledSelector);
    }
}

+ (BOOL)cl_addMethodWithClass:(Class)class
             originalSelector:(SEL)originalSelector
             swizzledSelector:(SEL)swizzledSelector {
    
    Method cl_swizzledSelector = class_getInstanceMethod(class, swizzledSelector);

    BOOL cl_didAddMethod = class_addMethod(class,
                                           originalSelector,
                                           class_getMethodImplementation(class, swizzledSelector),
                                           method_getTypeEncoding(cl_swizzledSelector));

    
    return cl_didAddMethod;
}

+ (void)cl_replaceMethodWithClass:(Class)class
                 originalSelector:(SEL)originalSelector
                 swizzledSelector:(SEL)swizzledSelector {
    
    Method cl_originalMethod = class_getInstanceMethod(class, originalSelector);

    class_replaceMethod(class,
                        swizzledSelector,
                        method_getImplementation(cl_originalMethod),
                        method_getTypeEncoding(cl_originalMethod));
}

+ (NSArray <NSString *> *)cl_getClassList {
    
    NSMutableArray *cl_classArray = [NSMutableArray array];
    
    unsigned int cl_classCount;
    
    Class *cl_class = objc_copyClassList(&cl_classCount);
    
    for (int i = 0; i < cl_classCount; i++) {
        
        [cl_classArray addObject:NSStringFromClass(cl_class[i])];
    }
    
    free(cl_class);
    
    [cl_classArray sortedArrayUsingSelector:@selector(compare:)];
    
    return cl_classArray;
}

+ (NSArray <NSString *> *)cl_getClassMethodListWithClass:(Class)class {
    
    NSMutableArray *cl_selectorArray = [NSMutableArray array];
    
    unsigned int cl_methodCount = 0;
    
    const char *cl_className = class_getName(class);
    
    Class cl_metaClass = objc_getMetaClass(cl_className);
    
    Method *cl_methodList = class_copyMethodList(cl_metaClass, &cl_methodCount);
    
    for (int i = 0; i < cl_methodCount; i++) {
        
        Method cl_method = cl_methodList[i];
        
        SEL cl_selector = method_getName(cl_method);
        
        const char *cl_constCharMethodName = sel_getName(cl_selector);
        
        NSString *cl_methodName = [[NSString alloc] initWithUTF8String:cl_constCharMethodName];
        
        [cl_selectorArray addObject:cl_methodName];
    }
    
    free(cl_methodList);

    return cl_selectorArray;
}

+ (NSArray <NSString *> *)cl_getPropertyListWithClass:(Class)class {
    
    unsigned int cl_propertyCount;
    
    objc_property_t *cl_propertyList = class_copyPropertyList(class, &cl_propertyCount);
    
    NSMutableArray *cl_propertyArray = [NSMutableArray array];
    
    for (int i = 0; i < cl_propertyCount; i++) {

        objc_property_t cl_property = cl_propertyList[i];
        
        const char *cl_constCharProperty = property_getName(cl_property);

        NSString *cl_propertyName = [NSString stringWithCString:cl_constCharProperty
                                                       encoding:NSUTF8StringEncoding];
        
        [cl_propertyArray addObject:cl_propertyName];
    }
    
    free(cl_propertyList);

    return cl_propertyArray;
}

+ (NSArray <NSString *> *)cl_getIVarListWithClass:(Class)class {
    
    unsigned int cl_ivarCount;
    
    Ivar *cl_ivarList = class_copyIvarList(class, &cl_ivarCount);
    
    NSMutableArray *cl_ivarArray = [NSMutableArray array];
    
    for (int i = 0; i < cl_ivarCount; i++) {
        
        Ivar cl_ivar = cl_ivarList[i];
        
        const char *cl_constCharIvar = ivar_getName(cl_ivar);
        
        NSString *cl_ivarName = [NSString stringWithCString:cl_constCharIvar
                                                   encoding:NSUTF8StringEncoding];
        
        [cl_ivarArray addObject:cl_ivarName];
    }
    
    free(cl_ivarList);

    return cl_ivarArray;
}

+ (NSArray <NSString *> *)cl_getProtocolListWithClass:(Class)class {
    
    unsigned int cl_protocolCount;
    
    NSMutableArray *cl_protocolArray = [NSMutableArray array];
    
    __unsafe_unretained Protocol **cl_protocolList = class_copyProtocolList(class, &cl_protocolCount);
    
    for (int i = 0; i < cl_protocolCount; i++) {
        
        Protocol *cl_protocal = cl_protocolList[i];
        
        const char *cl_constCharProtocolName = protocol_getName(cl_protocal);
        
        NSString *cl_protocolName = [NSString stringWithCString:cl_constCharProtocolName
                                                   encoding:NSUTF8StringEncoding];

        [cl_protocolArray addObject:cl_protocolName];
    }
    
    free(cl_protocolList);
    
    return cl_protocolArray;
}

- (BOOL)cl_hasPropertyWithKey:(NSString *)key {
    
    objc_property_t cl_property = class_getProperty([self class], [key UTF8String]);
    
    return (BOOL)cl_property;
}

- (BOOL)cl_hasIvarWithKey:(NSString *)key {
    
    Ivar cl_ivar = class_getInstanceVariable([self class], [key UTF8String]);
    
    return (BOOL)cl_ivar;
}

#pragma mark - GCD
- (void)cl_performAsyncWithComplete:(CLObject)complete {

    dispatch_queue_t cl_globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(cl_globalQueue, complete);
}

- (void)cl_performMainThreadWithWait:(BOOL)wait
                            complete:(CLObject)complete {
    
    if (wait) {
        
        dispatch_sync(dispatch_get_main_queue(), complete);
    } else {
        
        dispatch_async(dispatch_get_main_queue(), complete);
    }
}

- (void)cl_performWithAfterSecond:(NSTimeInterval)afterSecond
                         complete:(CLObject)complete {

    dispatch_time_t cl_time = dispatch_time(DISPATCH_TIME_NOW, afterSecond * NSEC_PER_SEC);
    
    dispatch_after(cl_time, dispatch_get_main_queue(), complete);
}

- (void)cl_addObserverWithKeyPath:(NSString *)keyPath
                         complete:(CLObjectKVOBlock)complete {
    
    if ([NSString cl_checkEmptyWithString:keyPath] || !complete) {
        return;
    }
    
    CLObjectKVOBlockCategory *cl_objectKVOBlockCategory = [[CLObjectKVOBlockCategory alloc] initWithObjectKVOBlock:complete];
    
    NSMutableDictionary *cl_mutableDictionary = [self cl_allObjectObserverBlocks];
    
    NSMutableArray *cl_mutableArray = cl_mutableDictionary[keyPath];
    
    if (!cl_mutableArray) {
        
        cl_mutableArray = [NSMutableArray array];
        
        cl_mutableDictionary[keyPath] = cl_mutableArray;
    }
    
    [cl_mutableArray addObject:cl_objectKVOBlockCategory];
    
    [self addObserver:cl_objectKVOBlockCategory
           forKeyPath:keyPath
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
}

- (void)cl_removeObserverWithKeyPath:(NSString *)keyPath {
    
    if ([NSString cl_checkEmptyWithString:keyPath]) {
        return;
    }
    
    NSMutableDictionary *cl_mutableDictionary = [self cl_allObjectObserverBlocks];
    
    NSMutableArray *cl_mutableArray = cl_mutableDictionary[keyPath];
    
    [cl_mutableArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self removeObserver:obj
                  forKeyPath:keyPath];
    }];
    
    [cl_mutableDictionary removeObjectForKey:keyPath];
}

- (void)cl_removeAllObserver {
    
    NSMutableDictionary *cl_mutableDictionary = [self cl_allObjectObserverBlocks];

    [cl_mutableDictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSArray *obj, BOOL * _Nonnull stop) {
        
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [self removeObserver:obj
                      forKeyPath:key];
        }];
    }];
    
    [cl_mutableDictionary removeAllObjects];
}

- (NSMutableDictionary *)cl_allObjectObserverBlocks {
    
    NSMutableDictionary *cl_mutableDictionary = objc_getAssociatedObject(self, &CLObjectKVOBlockCategoryKey);
    
    if (!cl_mutableDictionary) {
        
        cl_mutableDictionary = [NSMutableDictionary dictionary];
        
        objc_setAssociatedObject(self, &CLObjectKVOBlockCategoryKey, cl_mutableDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return cl_mutableDictionary;
}

@end

