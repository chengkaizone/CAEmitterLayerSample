//
//  CAEmitterLayerView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/8.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "CAEmitterLayerView.h"

@interface CAEmitterLayerView(){
    CAEmitterLayer * _emitterLayer;
}

@end

@implementation CAEmitterLayerView

+(Class)layerClass {
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _emitterLayer = (CAEmitterLayer*)self.layer;
        [self setup];
    }
    return self;
}

- (void)setEmitterLayer:(CAEmitterLayer *)layer{
    _emitterLayer = layer;
}

- (CAEmitterLayer *)emitterLayer{
    return _emitterLayer;
}

- (void)setup {
    // 子类初始化
}

- (void)show{
    [self.layer setHidden:NO];//子类必须调用super
    // 子类实现
    
}

- (void)hide{
    [self.layer setHidden:YES];
}


@end
