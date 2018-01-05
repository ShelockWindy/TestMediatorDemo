//
//  UIViewController+Test.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "UIViewController+Test.h"
#import <objc/runtime.h>

@implementation UIViewController (Test)

+(void)load
{
    Method  orignMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method  newMethod =  class_getInstanceMethod([self class], @selector(new_viewDidAppear:));
    method_exchangeImplementations(orignMethod, newMethod);
}

-(void)new_viewDidAppear:(BOOL)animated
{
    [self new_viewDidAppear:animated];
    
    NSLog(@"ooookkkkkkkk");
}


@end
