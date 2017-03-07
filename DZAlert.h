//
//  DZAlert.h
//  test
//
//  Created by 陈东芝 on 17/3/8.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZAlert : UIView {
    UIFont *messageFont;
    UIView *centerView;
}

- (id)initWithMessage:(NSString *)message;

- (void)showAnimation;

@end
