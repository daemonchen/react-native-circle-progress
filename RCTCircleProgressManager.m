//
//  RCTCircleProgressManager.m
//  RCTCircleProgress
//
//  Created by 郭栋 on 15/7/30.
//  Copyright (c) 2015年 guodong. All rights reserved.
//

#import "RCTCircleProgressManager.h"

#import "RCTCircleProgress.h"
#import "RCTBridge.h"
#import "RCTUIManager.h"
#import "RCTConvert.h"

@implementation RCTCircleProgressManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue {
    return _bridge.uiManager.methodQueue;
}

- (UIView *)view {
    return [[RCTCircleProgress alloc] initWithBridge:_bridge];
}

- (NSDictionary *)constantsToExport {
    return @{@"LineCapButt": kCALineCapButt,
             @"LineCapRound": kCALineCapRound,
             @"LineCapSquare": kCALineCapSquare};
}

RCT_EXPORT_VIEW_PROPERTY(progress, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(lineWidth, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(lineCap, NSString)
RCT_EXPORT_VIEW_PROPERTY(circleRadius, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(circleColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(circleUnderlayColor, UIColor)

@end
