//
//  DazFireView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "DazFireView.h"

@interface DazFireView()

@property (nonatomic, strong) CAEmitterLayer *smokeEmitter;

@end
@implementation DazFireView


/**
 *  初始化参数
 */
- (void)setup {
    CGRect viewBounds = self.bounds;
    
    self.smokeEmitter	= [CAEmitterLayer layer];
    [self.emitterLayer addSublayer:self.smokeEmitter];
    
    // Place layers just above the tab bar
    self.emitterLayer.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height - 60);
    self.emitterLayer.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0);
    self.emitterLayer.emitterMode	= kCAEmitterLayerOutline;
    self.emitterLayer.emitterShape	= kCAEmitterLayerLine;
    // with additive rendering the dense cell distribution will create "hot" areas
    self.emitterLayer.renderMode		= kCAEmitterLayerAdditive;
    
    self.smokeEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height - 60);
    self.smokeEmitter.emitterMode	= kCAEmitterLayerPoints;
    
}

/**
 *  显示
 */
- (void)show{
    [super show];
    
    // Create the fire emitter cell
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    fire.birthRate			= 100;
    fire.emissionLongitude  = M_PI;
    fire.velocity			= -80;
    fire.velocityRange		= 30;
    fire.emissionRange		= 1.1;
    fire.yAcceleration		= -200;
    fire.scaleSpeed			= 0.3;
    fire.lifetime			= 50;
    fire.lifetimeRange		= (50.0 * 0.35);
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    
    
    // Create the smoke emitter cell
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
    [smoke setName:@"smoke"];
    
    smoke.birthRate			= 11;
    smoke.emissionLongitude = -M_PI / 2;
    smoke.lifetime			= 10;
    smoke.velocity			= -40;
    smoke.velocityRange		= 20;
    smoke.emissionRange		= M_PI / 4;
    smoke.spin				= 1;
    smoke.spinRange			= 6;
    smoke.yAcceleration		= -160;
    smoke.contents			= (id) [[UIImage imageNamed:@"DazSmoke"] CGImage];
    smoke.scale				= 0.1;
    smoke.alphaSpeed		= -0.12;
    smoke.scaleSpeed		= 0.7;
    
    // Add the smoke emitter cell to the smoke emitter layer
    self.smokeEmitter.emitterCells	= [NSArray arrayWithObject:smoke];
    self.emitterLayer.emitterCells	= [NSArray arrayWithObject:fire];
    
    [self setFireAmount:0.9];
}

- (void) setFireAmount:(float)zeroToOne
{
    // Update the fire properties
    [self.emitterLayer setValue:[NSNumber numberWithInt:(zeroToOne * 500)]
                    forKeyPath:@"emitterCells.fire.birthRate"];
    [self.emitterLayer setValue:[NSNumber numberWithFloat:zeroToOne]
                    forKeyPath:@"emitterCells.fire.lifetime"];
    [self.emitterLayer setValue:[NSNumber numberWithFloat:(zeroToOne * 0.35)]
                    forKeyPath:@"emitterCells.fire.lifetimeRange"];
    self.emitterLayer.emitterSize = CGSizeMake(50 * zeroToOne, 0);
    
    [self.smokeEmitter setValue:[NSNumber numberWithInt:zeroToOne * 4]
                     forKeyPath:@"emitterCells.smoke.lifetime"];
    [self.smokeEmitter setValue:(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:zeroToOne * 0.3] CGColor]
                     forKeyPath:@"emitterCells.smoke.color"];
}

#pragma mark -
#pragma mark Interaction
// ---------------------------------------------------------------------------------------------------------------

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self controlFireHeight:event];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self controlFireHeight:event];
}


- (void) controlFireHeight:(UIEvent *)event
{
    UITouch *touch			= [[event allTouches] anyObject];
    CGPoint touchPoint		= [touch locationInView:self];
    float distanceToBottom	= self.bounds.size.height - touchPoint.y;
    float percentage		= distanceToBottom / self.bounds.size.height;
    percentage				= MAX(MIN(percentage, 1.0), 0.1);
    [self setFireAmount:2 *percentage];
}


@end
