//
//  ViewA.h
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AViewModel.h"

@interface ViewA : UIView

@property (nonatomic,strong)  UIButton * testButt;
@property (nonatomic,strong)  UILabel * contentLab;

-(void)renderWithViewModleA:(AViewModel*)viewModel;

@end
