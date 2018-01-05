//
//  Business_A.h
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/4.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelA.h"
#import "MoudleA_DataManger.h"

@interface Business_A : NSObject

@property (nonatomic,strong) ModelA * modleA;
@property (nonatomic,strong) MoudleA_DataManger * A_dataManager;

-(void)loginWithUsername:(NSString*)user password:(NSString*)password complete:(void (^)(BOOL, id))complete;

@end
