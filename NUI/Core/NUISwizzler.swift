//
//  NUISwizzler.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/01/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISwizzler: NSObject {
    
    func swizzleAll() {
        
        swizzleDidMoveToWindow(UIActivityIndicatorView.self)
        swizzleDidMoveToWindow(UIBarButtonItem.self)
        swizzleDidMoveToWindow(UIButton.self)
        swizzleDidMoveToWindow(UILabel.self)
        swizzleDidMoveToWindow(UINavigationBar.self)
        swizzleDidMoveToWindow(UINavigationItem.self)
        swizzleDidMoveToWindow(UIProgressView.self)
        swizzleDidMoveToWindow(UISearchBar.self)
        swizzleDidMoveToWindow(UISegmentedControl.self)
        swizzleDidMoveToWindow(UISlider.self)
        swizzleDidMoveToWindow(UISwitch.self)
        swizzleDidMoveToWindow(UITabBar.self)
        swizzleDidMoveToWindow(UITableViewCell.self)
        swizzleDidMoveToWindow(UITextField.self)
        swizzleDidMoveToWindow(UITextView.self)
        swizzleDidMoveToWindow(UIToolbar.self)
        swizzleDidMoveToWindow(UIPageControl.self)
        swizzleDidMoveToWindow(UIControl.self)
        swizzleDidMoveToWindow(UIView.self)
        
        swizzle(UITextField.self, methodName: "textRectForBounds:")
        swizzle(UITextField.self, methodName: "editingRectForBounds:")
        swizzle(UIWindow.self, methodName: "becomeKeyWindow")
        
        swizzle(UILabel.self, methodName: "setText:")
        swizzle(UIButton.self, methodName: "setTitle:forState:")
        
        swizzle(UILabel.self, methodName: "setAttributedText:")
        swizzle(UIButton.self, methodName: "setAttributedTitle:forState:")
        
        swizzleDealloc(UINavigationBar.self)
        swizzleDealloc(UITabBar.self)
        swizzleDealloc(UITableViewCell.self)
        swizzleDealloc(UITableView.self)
    }
    
    func swizzleDidMoveToWindow(className: AnyClass) {
        swizzle(className, methodName: "didMoveToWindow")
    }
    
    func swizzleDealloc(className: AnyClass) {
        swizzle(className, methodName: "dealloc")
    }
    
    func swizzle(className: AnyClass, methodName: String) {
        
        let originalMethod = NSSelectorFromString(methodName)
        let newMethod = NSSelectorFromString("override_" + methodName)
        
        swizzle(className, from: originalMethod, to: newMethod)
    }
    
    func swizzle(className: AnyClass, from original: Selector, to new: Selector) {
        
        let originalMethod = class_getInstanceMethod(className, original)
        let newMethod = class_getInstanceMethod(className, new)
        
        if class_addMethod(className, original, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)) {
            
            class_replaceMethod(className, new, method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, newMethod)
        }
    }
}
