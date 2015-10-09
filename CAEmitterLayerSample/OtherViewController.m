//
//  OtherViewController.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/8.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "OtherViewController.h"
#import "CAEmitterLayerView.h"
#import "SnowView.h"

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CAEmitterLayerView * layerView = [[SnowView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:layerView];
    
    [layerView show];
    
}

@end
