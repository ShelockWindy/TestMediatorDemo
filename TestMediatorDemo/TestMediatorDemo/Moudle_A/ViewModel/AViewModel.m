//
//  AModleView.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "AViewModel.h"

@implementation AViewModel

-(id)initWithModelA:(ModelA*)model
{
    self = [super init];
    if (self) {
        self.content = [model.detail stringByAppendingString:@"_ok!!!"];

    }
    return self;
}


-(void)dealloc
{
    NSLog(@"AModleView-----已经被释放了！！");
}


@end
