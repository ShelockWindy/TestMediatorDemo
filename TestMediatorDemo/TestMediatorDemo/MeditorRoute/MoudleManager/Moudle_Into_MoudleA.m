//
//  Moudle_Into_MoudleA.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/2.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "Moudle_Into_MoudleA.h"
#import "MoudleManager.h"

@implementation Moudle_Into_MoudleA

+(void)load
{
    [self addNotify];
    
    [[MoudleManager instance] registerController:[MoudleA_ViewController class] withProtocol:@protocol(MoudleA_ViewControllerProtocol)];
    
}

+(void)addNotify
{
    [[NSNotificationCenter defaultCenter]addObserverForName:MOUDLE_INTO_Moudel_A_ViewController object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary * paramDic = note.userInfo;
        dispatch_async(dispatch_get_main_queue(), ^{
            MoudleB_ViewController * controllerB = note.object;
            
            MoudleA_ViewController * controllerA = [[MoudleA_ViewController alloc]init];
            if ([controllerB respondsToSelector:@selector(sayGoodByeToP1:p2:)]) {
                [controllerB performSelector:@selector(sayGoodByeToP1:p2:) withObject:@"www" withObject:@"eee"];

            }
            [controllerB presentViewController:controllerA animated:YES completion:nil];
        });
    }];
}



@end
