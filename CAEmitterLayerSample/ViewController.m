//
//  ViewController.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/7.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "SnowView.h"
#import "DazFireworkView.h"
#import "DazSnowView.h"
#import "DazFireView.h"
#import "DazTouchView.h"


/**
 *  本例子使用了Lichtschlag/Dazzle中的源码进行封装成了UIView,感谢原作者的分享
 *  我不太会使用github作声明原作者的成果,望见谅,故而在源码中声明
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CAEmitterLayerView * layerView = [[DazFireView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:layerView];
    
    [layerView show];
    
    
    
}


@end
