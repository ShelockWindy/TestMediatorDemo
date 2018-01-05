//
//  MoudleB_ViewController.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "MoudleB_ViewController.h"
#import "MeditorRoute.h"


@interface MoudleB_ViewController ()
{
    NSString * actionName2;
    MoudleB_Block_Hello _hello;
}
@end

@implementation MoudleB_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
    testButt.frame = CGRectMake(100, 100, 100, 100);
    testButt.backgroundColor = [UIColor redColor];
    [testButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButt setTitle:@"MoudleB_test" forState:UIControlStateNormal];
    [testButt addTarget:self action:@selector(testButtAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButt];
    
    UIButton * testButt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    testButt2.frame = CGRectMake(100, 300, 100, 100);
    testButt2.backgroundColor = [UIColor blueColor];
    [testButt2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButt2 setTitle:@"MoudleB_test" forState:UIControlStateNormal];
    [testButt2 addTarget:self action:@selector(testButt2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButt2];
    
    
}

-(void)testButtAction:(UIButton*)sender
{
    if (_hello) {
        _hello();
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
//        [[MeditorRoute sharedInstance]performActionWithTarget:@"MoudleA_ViewController"      params:@{@"actionName":@"说hello"} actionSelectorAndObjects:@[ @{Meditor_ACTION_NAME:@"sayHelloToP2:p2:",  Meditor_ACTION_OBJECTS :@[@"555",@"666"] },@{Meditor_ACTION_NAME:@"sayNone"}]
//                                                   completion:^(id response) {
//
//                                                       [self.presentedViewController presentViewController:response animated:YES completion:nil];                                                       }];
        
    }];
    
}

-(void)testButt2Action:(UIButton*)sender
{
   // [[NSNotificationCenter defaultCenter]postNotificationName:MOUDLE_INTO_Moudel_A_ViewController object:self];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:MOUDLE_INTO_Moudel_A_ViewController object:self userInfo:@{@"SEL":NSStringFromSelector(@selector(sayGoodByeToP1:p2:))}];
}

-(void)sayGoodByeToP1:(NSString*)p1 p2:(NSString*)p2
{
    NSLog(@"MoudleB_ViewController sayGoodBye to %@ ，%@",  p1,p2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    NSLog(@"%@被释放了",  NSStringFromClass([self class]));
}
@end
