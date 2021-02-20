//
//  TouchTestViewController.m
//  NEProTest
//
//  Created by LuLuLu on 2021/2/20.
//

#import "TouchTestViewController.h"
#import "TouchOneView.h"
#import "TouchTwoView.h"

@interface TouchTestViewController ()

@end

@implementation TouchTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TouchOneView * oneView = [[TouchOneView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    TouchTwoView * twoView = [[TouchTwoView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:oneView];
    [self.view addSubview:twoView];
}


@end
