//
//  Business_A.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/4.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "Business_A.h"

@implementation Business_A

#pragma mark-  Bussiness

-(void)loginWithUsername:(NSString*)user password:(NSString*)password complete:(void (^)(BOOL, id))complete
{
    
    if (complete) {
        
        ModelA * model = [ModelA new];
        model.detail = [NSString stringWithFormat:@"{%@,%@}",user,password];
        complete(YES, model);
    }
}


@end
