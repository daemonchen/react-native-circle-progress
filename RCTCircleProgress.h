//
//  RCTCircleProgress.h
//  RCTCircleProgress
//
//  Created by 郭栋 on 15/7/30.
//  Copyright (c) 2015年 guodong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+React.h"

@class RCTBridge;

@interface RCTCircleProgress : UIView

@property (nonatomic) CGFloat progress;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat circleRadius;
@property (nonatomic) UIColor *circleColor;
@property (nonatomic) UIColor *circleUnderlayColor;

- (instancetype)initWithBridge:(RCTBridge *)bridge;

@end
