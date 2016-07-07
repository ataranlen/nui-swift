//
//  UITabBar+NUI.h
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NUIConstants.h"

#import "UIView+NUI.h"
#import "UITabBarItem+NUI.h"

@interface UITabBar (NUI)

- (void)orientationDidChange:(NSNotification*)notification;

@end
