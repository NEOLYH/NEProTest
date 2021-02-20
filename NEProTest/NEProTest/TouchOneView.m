//
//  TouchOneView.m
//  NEProTest
//
//  Created by LuLuLu on 2021/2/20.
//

#import "TouchOneView.h"
#import "TouchButton.h"

@interface TouchOneView()
@property(nonatomic,strong)TouchButton * button;
@end

@implementation TouchOneView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        _button = [[TouchButton alloc] init];
        _button.backgroundColor = [UIColor orangeColor];
        [self addSubview:_button];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return  self;
}

-(void)buttonAction{
    NSLog(@"按钮被点击了");
}

-(void)layoutSubviews{
    self.button.frame = CGRectMake(50, 30, 30, 30);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"点击事件落在第一个View");
    
    if (CGRectContainsPoint(CGRectInset(self.bounds, 0, 0), point)) {
        NSLog(@"识别到点击第一个view");
           return YES;
        
       }
    NSLog(@"识别到没有第一个view");
       return NO;
    
     
//    NSLog(@"%ld",(long)(BOOL)[super pointInside:point withEvent:event]);
//    return [super pointInside:point withEvent:event];
}

@end
