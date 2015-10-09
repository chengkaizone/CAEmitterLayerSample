//
//  CAEmitterLayerView.h
//  CAEmitterLayerSample
//
//  Created by lance on 15/10/8.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAEmitterLayerView : UIView

/**
 *  模仿setter,getter方法
 *
 *  @param layer
 */
- (void)setEmitterLayer:(CAEmitterLayer *)layer;
- (CAEmitterLayer *)emitterLayer;

- (void)show;

- (void)hide;

@end
