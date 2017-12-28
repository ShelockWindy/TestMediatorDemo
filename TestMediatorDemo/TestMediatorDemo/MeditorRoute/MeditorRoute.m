//
//  MeditorRoute.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "MeditorRoute.h"
#import <objc/runtime.h>

@interface MeditorRoute()

@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end


@implementation MeditorRoute
#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static MeditorRoute *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[MeditorRoute alloc] init];
    });
    return mediator;
}


- (void)performActionWithUrl:(NSURL *)url completion:(void (^)(id response))completion
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString * targetName = [url.host stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString * actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    NSArray   * actions = [[url.path substringFromIndex:1] componentsSeparatedByString:@"/"];
   
    NSMutableArray * seletors = [NSMutableArray array];
    for (NSString * act in  actions) {
        NSArray * action =  [act componentsSeparatedByString:@"="];
        NSString * actionParams = [action lastObject];
        actionName = [action firstObject];
        
        if ([actionName hasPrefix:@"native"]) {
            return ;
        }
        
        [seletors addObject:@{Meditor_ACTION_NAME:actionName,Meditor_ACTION_OBJECTS:[actionParams componentsSeparatedByString:@","]}];
    
    }
    
    [self performActionWithTarget:targetName params:params actionSelectorAndObjects:seletors
                       completion:completion];
    
}


-(void)performActionWithTarget:(NSString *)targetName params:(NSDictionary *)params actionSelectorAndObjects:(NSArray <NSDictionary*>*)selectors completion:(void (^)(id))completion
{
    [self performActionWithTarget:targetName params:params  completion:^(id response) {
        
        if ([response isKindOfClass:[NSObject class]]) {
            
            for (NSDictionary * action in selectors) {
                
                NSString * selector = action[Meditor_ACTION_NAME];
                NSArray * objects = action[Meditor_ACTION_OBJECTS];
                if ([objects isEqual:[NSNull null]]) {
                    objects = nil;
                }
                
                [response performSelector:NSSelectorFromString(selector) withObjects:objects];

            }
            
        }
        
        if (completion) {
            completion(response);
        }
        
    }];
    
}



- (void)performActionWithTarget:(NSString *)targetName params:(NSDictionary*)params actionSelector:(NSString*)selector withObjects:(NSArray *)objects completion:(void (^)(id))completion
{
    [self performActionWithTarget:targetName params:params  completion:^(id response) {

        if ([response isKindOfClass:[NSObject class]]) {
            [response performSelector:NSSelectorFromString(selector) withObjects:objects];
        }
        
        if (completion) {
            completion(response);
        }
        
    }];
    
}

-(void)performActionWithTarget:(NSString *)targetName params:(NSDictionary *)params completion:(void (^)(id))completion
{
    if (targetName) {
        self.cachedTarget[targetName] = targetName;
    }
    
    Class  targetClass  = NSClassFromString(targetName);
    if (!targetClass) {
        NSLog(@"%@------这个类不存在啊😅",targetName);
        return;
    }
    id targetObject = [[targetClass alloc]init];
    
    [targetObject setParames:params];
    
    id result = targetObject;
    if (completion) {
        if (result) {
            completion(result);
        } else {
            completion(nil);
        }
    }
    
}


#pragma mark - getters and setters
- (NSMutableDictionary *)cachedTarget
{
    if (_cachedTarget == nil) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}

@end

