//
//  NSObject+Meditor.h
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Meditor)

/**
 多个参数调用，参数不为nil
 */
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;

/**
 自动赋值属性和私有变量

 @param params  一个字典包含需要赋值的属性和变量
 */
-(void)setParames:(NSDictionary*)params;


/**
 赋值属性
 */
-(void)setProperty:(NSString*)property value:(NSString*)value;


/**
 赋值变量
 */
-(void)setIvar:(NSString*)aIvar value:(NSString*)value;

@end
