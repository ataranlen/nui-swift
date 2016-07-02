//
//  UITabBarItem+NUI.h
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NUIConstants.h"
#import "NUIFileMonitor.h"
#import "NUISettings.h"
#import "UIView+NUI.h"

@interface UITabBarItem (NUI)

@property (nonatomic, retain) NSString* nuiClass;
@property (nonatomic, assign, getter = isNUIApplied) BOOL nuiApplied;

- (void)applyNUI;

@end
