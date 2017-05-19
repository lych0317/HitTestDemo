//
//  CustomView.m
//  HitTestDemo
//
//  Created by yuanchao Li on 2017/5/18.
//  Copyright © 2017年 yuanchao Li. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CustomView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.y < self.textView.frame.origin.y) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = self.textView.frame;
            rect.origin.y = self.bounds.size.height;
            self.textView.frame = rect;
        }];
        return nil;
    } if (self.textView.frame.origin.y > 0) {
        return self;
    }
    return [super hitTest:point withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat offsetY = curP.y - preP.y;
    CGRect rect = self.textView.frame;
    rect.origin.y = rect.origin.y + offsetY;
    CGFloat offsetYForTextViewContainer = self.textView.contentOffset.y;
    if (rect.origin.y < 0) {
        offsetYForTextViewContainer -= rect.origin.y;
        rect.origin.y = 0;
    } else if (rect.origin.y > 0) {
        if (offsetYForTextViewContainer > 0) {
            offsetYForTextViewContainer -= rect.origin.y;
            rect.origin.y = 0;
        }
    }
    self.textView.frame = rect;
    self.textView.contentOffset = CGPointMake(0, offsetYForTextViewContainer);
}

@end
