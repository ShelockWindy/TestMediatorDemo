//
//  MeditorRoute.h
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+Meditor.h"


#define Meditor_ACTION_NAME  @"action"
#define Meditor_ACTION_OBJECTS     @"objects"

@interface MeditorRoute : NSObject

+ (instancetype)sharedInstance;


/**
 内部调用模块路由方法
 
 @param targetName 类名
 @param params 类的属性参数
 @param selector 类的方法
 @param objects 对应方法的参数
 @param completion 执行回调，可以返回字典格式参数
 */
- (void)performActionWithTarget:(NSString *)targetName params:(NSDictionary*)params actionSelector:(NSString*)selector withObjects:(NSArray *)objects  completion:(void (^)(id response))completion;

/**
 内部调用模块路由方法 支持多个action
 */
- (void)performActionWithTarget:(NSString *)targetName params:(NSDictionary*)params actionSelectorAndObjects:(NSArray<NSDictionary*>*)selectors  completion:(void (^)(id response))completion;

/**
 内部调用模块路由方法 无action

 */
- (void)performActionWithTarget:(NSString *)targetName params:(NSDictionary*)params  completion:(void (^)(id response))completion;
/**
 外部调用模块路由方法
 
 @param url  路由url 格式 scheme://[target]/[action]?[params]
 @param completion 执行回调，可以返回字典格式参数
 */
- (void)performActionWithUrl:(NSURL *)url completion:(void (^)(id response))completion;


@end
