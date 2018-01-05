//
//  MoudleB_ViewController.h
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoudleB_ViewControllerProtocol

@property (nonatomic,copy) NSString * actionName;

@end

typedef void(^MoudleB_Block_Hello)(void);

#define  MOUDLE_INTO_Moudel_A_ViewController @"MOUDLE_INTO_Moudel_A_ViewController"

@interface MoudleB_ViewController : UIViewController<MoudleB_ViewControllerProtocol>

@property (nonatomic,copy) NSString * actionName;

//@property (nonatomic,copy) MoudleB_Block_Hello hello;

-(void)sayGoodByeToP1:(NSString*)p1 p2:(NSString*)p2;

@end
