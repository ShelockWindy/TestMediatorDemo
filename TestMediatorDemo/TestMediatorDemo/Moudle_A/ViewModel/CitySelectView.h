//
//  CitySelectModleView.h
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CitySelectFinishHandle)(NSString * cityCode,NSString * cityName);

@interface CitySelectView : NSObject

-(void)citySelectFinishHandle:(CitySelectFinishHandle)citySelectFinishHandle;

@end
