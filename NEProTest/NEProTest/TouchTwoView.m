//
//  TouchTwoView.m
//  NEProTest
//
//  Created by LuLuLu on 2021/2/20.
//

#import "TouchTwoView.h"

@implementation TouchTwoView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return  self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"点击事件落在第二个View");
    
    if (CGRectContainsPoint(CGRectInset(self.bounds, 0, 0), point)) {
        NSLog(@"识别到点击第二个view");
           return YES;
        
       }
    NSLog(@"识别到没有第二个view");
       return NO;
    
}

@end
