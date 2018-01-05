//
//  MoudleA_ViewController.m
//  TestMediatorDemo
//
//  Created by sunwf on 2017/12/28.
//  Copyright © 2017年 SunDayPlay. All rights reserved.
//

#import "MoudleA_ViewController.h"
#import "ViewA.h"
#import "CitySelectView.h"
#import "Business_A.h"

@interface MoudleA_ViewController ()

@property (nonatomic,strong) ViewA * viewA;
@property (nonatomic,strong) Business_A * business_A;
@property (nonatomic,strong) CitySelectView * citySelectView;

@end



@implementation MoudleA_ViewController
@synthesize actionName;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self subViewLoad];
    [self eventsBind];
    [self log_Test];
}

-(void)subViewLoad
{
    self.viewA.frame = self.view.bounds;
}

-(void)eventsBind
{
    [self.viewA.testButt addTarget:self action:@selector(testButtAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"%@被释放了",  NSStringFromClass([self class]));
}

#pragma mark- Evetns

-(void)testButtAction:(UIButton*)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    __weak typeof(self) weakSelf = self;
    [self.business_A loginWithUsername:@"aaa" password:@"1231" complete:^(BOOL sucess, id viewModel) {
        
        __strong typeof(self)  strongSelf = weakSelf;
        //跳转界面
        [strongSelf AViewRenderWith:viewModel];
        
        
    }];
    

    [self.citySelectView citySelectFinishHandle:^(NSString *cityCode, NSString *cityName) {
        __strong typeof(self)  strongSelf = weakSelf;
        NSLog(@"已经完成城市选择！");
        NSLog(@"cityName---%@",cityName);
        NSLog(@"cityId---%@",cityCode);
     

    }];
}

#pragma mark- Delegate


#pragma mark- UIRender

-(void)AViewRenderWith:(ModelA*)model
{
    AViewModel * viewModel = [[AViewModel alloc]initWithModelA:model];
    [self.viewA renderWithViewModleA:viewModel];
    
}

#pragma mark- Getter

-(Business_A *)business_A
{
    if (_business_A==nil) {
        _business_A = [[Business_A alloc]init];
    }

    return _business_A;
}

-(CitySelectView *)citySelectView
{
    if (_citySelectView==nil) {
        _citySelectView = [[CitySelectView alloc]init];
        
    }
    return _citySelectView;
}

-(ViewA *)viewA
{
    if (!_viewA) {
        _viewA = [[ViewA alloc]init];
        [self.view addSubview:_viewA];
    }
    return _viewA;
}


@end
