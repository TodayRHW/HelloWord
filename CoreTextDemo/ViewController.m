//
//  ViewController.m
//  CoreTextDemo
//
//  Created by JackWong on 15/12/29.
//  Copyright © 2015年 JackWong. All rights reserved.
//

#import "ViewController.h"
#import "CoreTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CoreTextView *coretextView = [[CoreTextView alloc] initWithFrame:self.view.bounds];
    coretextView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:coretextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
