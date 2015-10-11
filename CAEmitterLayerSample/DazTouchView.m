//
//  DazTouchView.m
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/11.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "DazTouchView.h"
#import <QuartzCore/CoreAnimation.h>

@implementation DazTouchView

/**
 *  初始化参数
 */
- (void)setup {
    CGRect viewBounds = self.bounds;

    // Cells spawn in a 50pt circle around the position
    self.emitterLayer.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height/2.0);
    self.emitterLayer.emitterSize	= CGSizeMake(50, 0);
    self.emitterLayer.emitterMode	= kCAEmitterLayerOutline;
    self.emitterLayer.emitterShape	= kCAEmitterLayerCircle;
    self.emitterLayer.renderMode		= kCAEmitterLayerBackToFront;
    
}

/**
 *  显示
 */
- (void)show{
    [super show];
    
    // Create the fire emitter cell
    CAEmitterCell* ring = [CAEmitterCell emitterCell];
    [ring setName:@"ring"];
    
    ring.birthRate			= 0;
    ring.velocity			= 250;
    ring.scale				= 0.5;
    ring.scaleSpeed			=-0.2;
    ring.greenSpeed			=-0.2;	// shifting to green
    ring.redSpeed			=-0.5;
    ring.blueSpeed			=-0.5;
    ring.lifetime			= 2;
    
    ring.color = [[UIColor whiteColor] CGColor];
    ring.contents = (id) [[UIImage imageNamed:@"DazTriangle"] CGImage];
    
    
    CAEmitterCell* circle = [CAEmitterCell emitterCell];
    [circle setName:@"circle"];
    
    circle.birthRate		= 10;			// every triangle creates 20
    circle.emissionLongitude = M_PI * 0.5;	// sideways to triangle vector
    circle.velocity			= 50;
    circle.scale			= 0.5;
    circle.scaleSpeed		=-0.2;
    circle.greenSpeed		=-0.1;	// shifting to blue
    circle.redSpeed			=-0.2;
    circle.blueSpeed		= 0.1;
    circle.alphaSpeed		=-0.2;
    circle.lifetime			= 4;
    
    circle.color = [[UIColor whiteColor] CGColor];
    circle.contents = (id) [[UIImage imageNamed:@"DazRing"] CGImage];
    
    
    CAEmitterCell* star = [CAEmitterCell emitterCell];
    [star setName:@"star"];
    
    star.birthRate		= 10;	// every triangle creates 20
    star.velocity		= 100;
    star.zAcceleration  = -1;
    star.emissionLongitude = -M_PI;	// back from triangle vector
    star.scale			= 0.5;
    star.scaleSpeed		=-0.2;
    star.greenSpeed		=-0.1;
    star.redSpeed		= 0.4;	// shifting to red
    star.blueSpeed		=-0.1;
    star.alphaSpeed		=-0.2;
    star.lifetime		= 2;
    
    star.color = [[UIColor whiteColor] CGColor];
    star.contents = (id) [[UIImage imageNamed:@"DazStarOutline"] CGImage];
    
    
    ring.emitterCells = [NSArray arrayWithObjects:circle, star, nil];
    
    // First traigles are emitted, which then spawn circles and star along their path
    self.emitterLayer.emitterCells = [NSArray arrayWithObject:ring];
    
}

#pragma mark -
#pragma mark Interaction
// ---------------------------------------------------------------------------------------------------------------

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    [self touchAtPosition:touchPoint];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    [self touchAtPosition:touchPoint];
}


- (void) touchAtPosition:(CGPoint)position
{
    // Bling bling..
    CABasicAnimation *burst = [CABasicAnimation animationWithKeyPath:@"emitterCells.ring.birthRate"];
    burst.fromValue			= [NSNumber numberWithFloat: 125.0];	// short but intense burst
    burst.toValue			= [NSNumber numberWithFloat: 0.0];		// each birth creates 20 aditional cells!
    burst.duration			= 0.5;
    burst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.emitterLayer addAnimation:burst forKey:@"burst"];
    
    // Move to touch point
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.emitterLayer.emitterPosition	= position;
    [CATransaction commit];
}

@end
