//
//  MoudleA_ViewController.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "MoudleA_ViewController.h"
#import "MeditorRoute.h"

@interface MoudleA_ViewController ()

@end

@implementation MoudleA_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    UIButton * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
    testButt.frame = CGRectMake(100, 100, 100, 100);
    testButt.backgroundColor = [UIColor redColor];
    [testButt setTitle:@"MoudleA_test" forState:UIControlStateNormal];
    [testButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButt addTarget:self action:@selector(testButtAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButt];
    
    
}

-(void)sayHelloToP1:(NSString*)p1 p2:(NSString*)p2
{
    NSLog(@"MoudleA_ViewController sayhello to %@ ，%@",  p1,p2);
}

-(void)sayNone
{
    NSLog(@"MoudleA_ViewController sayNone");
}

-(void)testButtAction:(UIButton*)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
