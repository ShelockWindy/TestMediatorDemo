//
//  Moudle_A.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/2.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "Moudle_A.h"
#import <objc/runtime.h>

@implementation Moudle_A


//void __HOOK_A_swizzleMethod(Class class_o ,Class class_n, SEL originalSelector, SEL swizzledSelector){
//    Method originalMethod = class_getInstanceMethod(class_o, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(class_n, swizzledSelector);
//    
//    BOOL didAddMethod =
//    class_addMethod(class_o,
//                    swizzledSelector,
//                    method_getImplementation(swizzledMethod),
//                    method_getTypeEncoding(swizzledMethod));
//    
//    if (didAddMethod) {
//        class_replaceMethod(class_o,
//                            swizzledSelector,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//        
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//        
//        
//    } else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//}
//
//
//+(void)load
//{
//    [super load];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        __HOOK_A_swizzleMethod( [[UIApplication sharedApplication].delegate class], [self class], @selector(applicationDidEnterBackground:), @selector(new_A_applicationDidEnterBackground:));
//        
//    });
//}


-(void)new_A_applicationDidEnterBackground:(UIApplication *)application
{

    [self new_A_applicationDidEnterBackground:application];
    
    NSLog(@"Moudle_A-----new_applicationDidEnterBackground");
    
}




@end
