//
//  MoudleManager.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/2.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "MoudleManager.h"

@implementation MoudleManager

+(MoudleManager*)instance
{
    static MoudleManager * moudleManager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moudleManager = [[MoudleManager alloc]init];
    });
    return moudleManager;
}

-(id)getObjectWithProtocol:(Protocol*)protocol
{
    NSString * _class =  [_moudles valueForKey:NSStringFromProtocol(protocol)] ;
    
    if (_class) {
        
        UIViewController * controller = [[NSClassFromString(_class) alloc]init];
        return controller;

    }
    return nil;
}


-(void)registerController:(Class)controller  withProtocol:(Protocol*)protocol
{
    [[MoudleManager instance].moudles setValue:NSStringFromClass(controller) forKey:NSStringFromProtocol(protocol)];
}


-(NSMutableDictionary *)moudles
{
    if (_moudles==nil) {
        _moudles = [NSMutableDictionary dictionary];
    }
    return _moudles;
}

@end
