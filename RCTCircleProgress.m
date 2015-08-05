//
//  RCTCircleProgress.m
//  RCTCircleProgress
//
//  Created by 郭栋 on 15/7/30.
//  Copyright (c) 2015年 guodong. All rights reserved.
//

#import "RCTCircleProgress.h"

#import "RCTBridge.h"

@interface RCTCircleProgress()

@end

@implementation RCTCircleProgress {
    RCTBridge *_bridge;
    CAShapeLayer *_circlePathLayer;
    CAShapeLayer *_backgroundLayer;
}

#pragma mark - setter and getter

- (CGFloat)progress {
    return _circlePathLayer.strokeEnd;
}

- (void)setProgress:(CGFloat)progress {
    if (progress > 1.0) {
        _circlePathLayer.strokeEnd = 1;
    } else if (progress < 0.0) {
        _circlePathLayer.strokeEnd = 0;
    } else {
        _circlePathLayer.strokeEnd = progress;
    }
}

- (CGFloat)lineWidth {
    return _circlePathLayer.lineWidth;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _circlePathLayer.lineWidth = lineWidth;
    _backgroundLayer.lineWidth = lineWidth;
}

- (void)setCircleRadius:(CGFloat)circleRadius {
    _circleRadius = circleRadius;
    [self setNeedsLayout];
}

- (UIColor *)circleColor {
    return [UIColor colorWithCGColor:_circlePathLayer.strokeColor];
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circlePathLayer.strokeColor = circleColor.CGColor;
}

- (UIColor *)circleUnderlayColor {
    return [UIColor colorWithCGColor:_backgroundLayer.strokeColor];
}

- (void)setCircleUnderlayColor:(UIColor *)circleUnderlayColor {
    _backgroundLayer.strokeColor = circleUnderlayColor.CGColor;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _bridge = bridge;
        _circlePathLayer = [CAShapeLayer layer];
        _circlePathLayer.frame = self.bounds;
        _circlePathLayer.lineWidth = 2;
        _circlePathLayer.fillColor = [UIColor clearColor].CGColor;
        _circlePathLayer.strokeColor = [UIColor redColor].CGColor;
        _circlePathLayer.strokeEnd = 0;
        _circlePathLayer.lineCap = kCALineCapRound;
        
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.frame = self.bounds;
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.strokeColor = [UIColor grayColor].CGColor;
        _backgroundLayer.strokeStart = 0;
        _backgroundLayer.strokeEnd = 1.0;
        
        [self.layer addSublayer:_backgroundLayer];
        [self.layer addSublayer:_circlePathLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat circleRadius = MIN(self.bounds.size.width, self.bounds.size.height) / 2 - self.lineWidth;
    if (circleRadius > _circleRadius) {
        circleRadius = _circleRadius;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                        radius:circleRadius
                                                    startAngle:-M_PI_2
                                                      endAngle:M_PI_2 * 3
                                                     clockwise:true];
    _circlePathLayer.frame = self.bounds;
    _circlePathLayer.path = path.CGPath;
    
    _backgroundLayer.frame = self.bounds;
    _backgroundLayer.path = path.CGPath;
}

@end
