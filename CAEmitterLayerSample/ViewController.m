//
//  ViewController.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/7.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "SnowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CAEmitterLayerView * layerView = [[SnowView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:layerView];
    
    [layerView show];
}


@end
