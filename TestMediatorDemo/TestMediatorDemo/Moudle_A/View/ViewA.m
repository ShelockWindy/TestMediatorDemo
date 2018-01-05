//
//  ViewA.m
//  TestMediatorDemo
//
//  Created by sunwf on 2018/1/3.
//  Copyright © 2018年 SunDayPlay. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        // Do any additional setup after loading the view.
        UIButton * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
        testButt.frame = CGRectMake(100, 100, 100, 100);
        testButt.backgroundColor = [UIColor redColor];
        [testButt setTitle:@"555" forState:UIControlStateNormal];
        [testButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _testButt = testButt;
        [self addSubview:testButt];
        
       
        UILabel * contentLab = [[UILabel alloc]init];
        contentLab.frame = CGRectMake(50, 280,  [[UIScreen mainScreen]bounds].size.width-100, 200);
        contentLab.numberOfLines = 0;
        contentLab.backgroundColor = [UIColor brownColor];
        [self addSubview:contentLab];
        _contentLab = contentLab;
        
    }
    
    return self;
}

-(void)renderWithViewModleA:(AViewModel *)viewModel
{
    _contentLab.text = [NSString stringWithFormat:@"%@",viewModel.content];
}




@end
