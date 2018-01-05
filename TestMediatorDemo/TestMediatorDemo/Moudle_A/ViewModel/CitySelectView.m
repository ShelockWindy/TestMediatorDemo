//
//  CitySelectModleView.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "CitySelectView.h"
#import <UIKit/UIKit.h>

@implementation CitySelectView

-(void)citySelectFinishHandle:(CitySelectFinishHandle)citySelectFinishHandle
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择城市" message:@"  " preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (citySelectFinishHandle) {
            citySelectFinishHandle(@"10010",@"天津");
        }
        
    }]];
    
    
    [[[UIApplication sharedApplication]keyWindow].rootViewController presentViewController:alert animated:YES completion:nil];
    
}


@end
