//
//  MusicView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/8.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "MusicView.h"

@implementation MusicView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

/**
 *  初始化参数
 */
- (void)setup {
    self.emitterLayer.masksToBounds = YES;
    //显示边框
    self.emitterLayer.borderWidth = 1.f;
    //给定尺寸
    self.emitterLayer.emitterSize = self.frame.size;
    //发射点
    self.emitterLayer.emitterPosition = CGPointMake(self.frame.size.width/2.f, - 20);
    //发射模式
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    //发射形状
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    NSLog(@"size:%f %f",self.emitterLayer.emitterSize.width, self.emitterLayer.emitterSize.height);
}

/**
 *  显示
 */
- (void)show{
    //创建粒子
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    //粒子产生率
    cell.birthRate = 10.f;
    //粒子生命周期
    cell.lifetime = 10.f;
    //发色速率
    cell.velocity = 10;
    //速度值的微调值
    cell.velocityRange=3.f;
    //y轴方向上的加速度
    cell.yAcceleration = 2.f;
    
    //cell.color = [UIColor blackColor].CGColor;
    //发射角度
    cell.emissionRange = 4 * M_1_PI;
    //设置图片
    cell.contents = (__bridge id)[UIImage imageNamed:@"emitterlayer"].CGImage;
    
    //让cell与layer产生关联
    self.emitterLayer.emitterCells = @[cell];
}

@end
