//
//  AModleView.h
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelA.h"

@interface AViewModel : NSObject

@property (nonatomic,copy) NSString * content;

-(id)initWithModelA:(ModelA*)model;

@end

