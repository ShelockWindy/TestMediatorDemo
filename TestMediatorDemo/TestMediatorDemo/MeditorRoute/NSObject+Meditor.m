//
//  NSObject+Meditor.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "NSObject+Meditor.h"
#import <objc/runtime.h>

@implementation NSObject (Meditor)

- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        
        //可以抛出异常也可以不操作。
        NSLog(@"%@------找不到方法%@啊😅", NSStringFromClass([self class]),NSStringFromSelector(selector));
        return nil;
    }
    
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}

-(void)setParames:(NSDictionary *)params
{
    for (NSString * property in [params allKeys]) {
        
        [self setProperty:property value:params[property]?params[property]:@"" ];
        
        [self setIvar:property value:params[property]?params[property]:@""];
    }
}

-(void)setProperty:(NSString*)property value:(NSString*)value
{
    if ([[self getPropertyNames]containsObject:property]) {
        [self setValue:value?value:@"" forKey:property];
    }
}

-(void)setIvar:(NSString*)aIvar value:(NSString*)value
{
    if ([[self getIvarNames]containsObject:aIvar]) {
        Ivar ivar = class_getInstanceVariable([self class], aIvar.UTF8String);
        object_setIvar(self, ivar, value?value:@"");
        
    }
}

-(NSArray*)getPropertyNames
{
    unsigned int outCount;
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray * nameArr = [NSMutableArray array];
    for (unsigned int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //属性名
        NSString* name = [NSString stringWithUTF8String:property_getName(property)];
        [nameArr addObject:name];
        //属性描述
        //const char * propertyAttr = property_getAttributes(property);
        //NSLog(@"属性描述为 %s 的 %@ ", propertyAttr, name);
        
        //属性的特性
        unsigned int attrCount = 0;
        objc_property_attribute_t * attrs = property_copyAttributeList(property, &attrCount);
        //        for (unsigned int j = 0; j < attrCount; j ++) {
        //            objc_property_attribute_t attr = attrs[j];
        //            const char * name = attr.name;
        //            const char * value = attr.value;
        //            //NSLog(@"属性的描述：%s 值：%s", name, value);
        //        }
        free(attrs);
        //NSLog(@"\n");
    }
    free(properties);
    
    return nameArr;
}

-(NSArray*)getIvarNames
{
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    NSMutableArray * nameArr = [NSMutableArray array];
    
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [nameArr addObject:key];
        
    }
    return nameArr;
}


@end
