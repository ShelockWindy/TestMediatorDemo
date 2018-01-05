//
//  MoudleA_ViewController.h
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoudleA_ Reference.h"

@protocol MoudleA_ViewControllerProtocol

@property (nonatomic,copy) NSString * actionName;

@end


@interface MoudleA_ViewController : UIViewController<MoudleA_ViewControllerProtocol>


@end
