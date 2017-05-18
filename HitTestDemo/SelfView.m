//
//  SelfView.m
//  HitTestDemo
//
//  Created by yuanchao Li on 2017/5/18.
//  Copyright © 2017年 yuanchao Li. All rights reserved.
//

#import "SelfView.h"

@implementation SelfView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"\n%@\n%@\n%@", NSStringFromCGPoint(point), self, v);
    return v;
}

@end
