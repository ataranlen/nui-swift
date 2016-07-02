//
//  UITableView+NUI.h
//  Pods
//
//  Created by Tobias Heinicke on 19.06.13.
//
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NUIConstants.h"
#import "NUIFileMonitor.h"
#import "NUISettings.h"
#import "UIView+NUI.h"

@interface UITableView (NUI)

- (void)orientationDidChange:(NSNotification*)notification;

@end
