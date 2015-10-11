//
//  DazInfoView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "DazSnowView.h"

@implementation DazSnowView

/**
 *  初始化参数
 */
- (void)setup {
    CGRect viewBounds = self.bounds;
    
    self.emitterLayer.emitterPosition = CGPointMake(viewBounds.size.width / 2.0, -30);
    self.emitterLayer.emitterSize		= CGSizeMake(viewBounds.size.width * 2.0, 0.0);
    
    // Spawn points for the flakes are within on the outline of the line
    self.emitterLayer.emitterMode		= kCAEmitterLayerOutline;
    self.emitterLayer.emitterShape	= kCAEmitterLayerLine;
    
    // Make the flakes seem inset in the background
    self.emitterLayer.shadowOpacity = 1.0;
    self.emitterLayer.shadowRadius  = 0.0;
    self.emitterLayer.shadowOffset  = CGSizeMake(0.0, 1.0);
    self.emitterLayer.shadowColor   = [[UIColor whiteColor] CGColor];
    
}

/**
 *  显示
 */
- (void)show{
    [super show];
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate		= 1.0;
    snowflake.lifetime		= 120.0;
    
    snowflake.velocity		= -10;				// falling down slowly
    snowflake.velocityRange = 10;
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"DazFlake"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];

    // Add everything to our backing layer below the UIContol defined in the storyboard
    self.emitterLayer.emitterCells = [NSArray arrayWithObject:snowflake];
}

@end
