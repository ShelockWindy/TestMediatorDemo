//
//  ViewController.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "ViewController.h"
#import "MeditorRoute.h"
#import "MoudleManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
    testButt.frame = CGRectMake(100, 100, 100, 100);
    testButt.backgroundColor = [UIColor redColor];
    [testButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButt addTarget:self action:@selector(testButtAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButt];
    
}


-(void)testButtAction:(UIButton*)sender
{
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        
        [sender setTitle:@"MoudleA" forState:UIControlStateNormal];
        
//        [[MeditorRoute sharedInstance]performActionWithTarget:@"MoudleA_ViewController" params:@{@"actionName":@"说hello"} actionSelector:@"sayHelloToP2:p2:" withObjects:@[@"张三",@"李四"] completion:^(id  response) {
//            [self presentViewController:response animated:YES completion:nil];
//
//        }];
//
        
//        [[MeditorRoute sharedInstance]performActionWithUrl:[NSURL URLWithString:@"testDemo://MoudleA_ViewController/sayHelloToP1:p2:=111,222/sayNone"] completion:^(id response) {
//
//            [self presentViewController:response animated:YES completion:nil];
//
//        }];
        
        UIViewController  <MoudleA_ViewControllerProtocol>* vc =    [[MoudleManager instance]getObjectWithProtocol:@protocol(MoudleA_ViewControllerProtocol) ];
        
        vc.actionName = @"说hello";
        [self presentViewController:vc animated:YES completion:nil];
        
        
//     [[MeditorRoute sharedInstance]performActionWithTarget:@"MoudleA_ViewController"      params:@{@"actionName":@"说hello"} actionSelectorAndObjects:@[ @{Meditor_ACTION_NAME:@"sayHelloToP2:p2:",  Meditor_ACTION_OBJECTS :@[@"555",@"666"] },@{Meditor_ACTION_NAME:@"sayNone"}]
//        completion:^(id response) {
//
//        [self presentViewController:response animated:YES completion:nil];                                                       }];
        
    }else
    {
        [sender setTitle:@"MoudleB" forState:UIControlStateNormal];
        
        [[MeditorRoute sharedInstance]performActionWithTarget:@"MoudleB_ViewController" params:@{@"actionName2":@"说byebye",@"_hello":^(void) {
            NSLog(@"这是一个MoudleB_Block_Hello");
            
        }} actionSelector:@"sayGoodByeToP1:p2:" withObjects:@[@"tom",@"jack"] completion:^(id  response) {
            
         [self presentViewController:response animated:YES completion:nil];

            
        }];
        


    }
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
