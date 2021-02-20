//
//  TouchButton.m
//  NEProTest
//
//  Created by LuLuLu on 2021/2/20.
//

#import "TouchButton.h"

@implementation TouchButton


//扩大button点击区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(CGRectInset(self.bounds, -25, -25), point)) {
        return YES;
    }
    return NO;
}
@end
