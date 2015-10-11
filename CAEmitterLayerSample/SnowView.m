//
//  SnowView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/8.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

/**
 *  初始化参数
 */
- (void)setup {
    self.emitterLayer.masksToBounds = YES;
    
    self.emitterLayer.emitterShape = kCAEmitterLayerCircle;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize = CGSizeMake(50, 50);;
    self.emitterLayer.emitterPosition = self.center;
}

/**
 *  显示
 */
- (void)show{
    [super show];
    
    CAEmitterCell * snowflake = [CAEmitterCell emitterCell];
    snowflake.birthRate = 1.f;
    snowflake.speed = 10.f;
    snowflake.velocity = 2.f;
    snowflake.velocityRange = 10.f;
    snowflake.yAcceleration = 10.f;
    snowflake.emissionRange = 1.5 * M_PI;
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (__bridge id)([UIImage imageNamed:@"snow"].CGImage);
    snowflake.color = [UIColor whiteColor].CGColor;
    snowflake.lifetime = 60.f;
    snowflake.scale = 0.5;
    snowflake.scaleRange = 1.3;
    
    self.emitterLayer.emitterCells = @[snowflake];
    
}

@end
