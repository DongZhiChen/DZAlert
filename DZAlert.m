//
//  DZAlert.m
//  test
//
//  Created by 陈东芝 on 17/3/8.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZAlert.h"

static float MarginTop = 13.0;
static float MarginLeft = 17.0;
static float maxWidth = 200.0;

@implementation DZAlert

- (id)initWithMessage:(NSString *)message {
    
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = NO;
        messageFont = [UIFont systemFontOfSize:13];
        self.frame = [UIScreen mainScreen].bounds;
        [self alertMessage:message];
        
    }
    
    return  self;
    
}

- (void)alertMessage:(NSString *)message {
    
    centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor clearColor];
    [self addSubview:centerView];
    
    CGSize maxSize = [self messageMaxHeight:message];
    UILabel *LB_Message = [[UILabel alloc] initWithFrame:CGRectMake(MarginLeft, MarginTop, maxSize.width, maxSize.height)];
    LB_Message.numberOfLines = 0;
    LB_Message.text = message;
    LB_Message.font = messageFont;
    LB_Message.textColor = [UIColor colorWithRed:43.0/255 green:43.0/255 blue:43.0/255 alpha:1];
    [centerView addSubview:LB_Message];
    
    CGRect frame;
    frame.size = CGSizeMake(maxSize.width+MarginLeft*2, maxSize.height+MarginTop*2);
    centerView.frame =  frame;
    centerView.center = self.center;
    
    UIVisualEffectView *effectView = [self createBlurViewWithFrame:centerView.bounds];
    [centerView insertSubview:effectView atIndex:0];
    
   centerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
}

- (void)showAnimation {

    [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:18 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        centerView.transform = CGAffineTransformMakeScale(1, 1);
       
    } completion:^(BOOL finished) {
        
        [NSTimer scheduledTimerWithTimeInterval:2.2 target:self selector:@selector(hiddenAnimation) userInfo:nil repeats:NO];
        
    }];
    
}


- (void)hiddenAnimation {

   [ UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        centerView.transform = CGAffineTransformMakeScale(0.3, 0.3);
       centerView.alpha = 0;
       
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];

    
}
#pragma mark - message max height -

- (CGSize)messageMaxHeight:(NSString *)message {
    
    CGSize maxSize = [message boundingRectWithSize:CGSizeMake(maxWidth, 300) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:messageFont} context:nil].size;
    
    return maxSize;
    
}


#pragma mark - 磨砂背景 -

-(UIVisualEffectView *)createBlurViewWithFrame:(CGRect)frame{
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithFrame:frame];
    effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    effectView.layer.masksToBounds = YES;
    effectView.layer.cornerRadius = 5.0;
    
    return effectView;
}



@end
