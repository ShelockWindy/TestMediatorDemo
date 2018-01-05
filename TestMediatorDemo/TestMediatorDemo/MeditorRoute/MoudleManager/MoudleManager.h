//
//  MoudleManager.h
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/2.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoudleConsit.h"
#import <objc/runtime.h>

@interface MoudleManager : NSObject

@property (nonatomic,strong) NSMutableDictionary * moudles;

+(MoudleManager*)instance;

/**
 注册模块

 @param controller  视图控制器类名
 @param protocol    视图控制器协议
 */
-(void)registerController:(Class)controller  withProtocol:(Protocol*)protocol;


/**
 获取模块

 @param protocol 视图控制器协议
 @return 视图控制器
 */
-(id)getObjectWithProtocol:(Protocol*)protocol;
@end
