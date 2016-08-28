//
//  UITextField+NUI.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

extension UITextField {
    
    func initNUI() {
        if nuiClass == nil {
            nuiClass = "TextField"
        }
    }
    
    open override func applyNUI() {
        
        initNUI()
        if nuiShouldBeApplied() {
            NUIRenderer.renderTextField(self, withClass: nuiClass)
        }
        isNUIApplied = true
    }
    
    func override_didMoveToWindow() {
        
        if !isNUIApplied {
            applyNUI()
        }
        override_didMoveToWindow()
    }
    
    func nuiShouldBeApplied() -> Bool {
        if nuiClass != kNUIClassNone && !(superview is UISearchBar) {
            return true
        }
        
        return false
    }
    
    // Padding apparently can't be modified during didMoveToWindow
    func override_textRectForBounds(_ bounds: CGRect) -> CGRect {
        
        guard nuiShouldBeApplied() && nuiClass != nil else {
            return override_textRectForBounds(bounds)
        }
        
        if let insets = NUISettings.getEdgeInsets("padding", withClass: nuiClass) {
            return CGRect(x: bounds.origin.x + insets.left,
                          y: bounds.origin.y + insets.top,
                          width: bounds.size.width - (insets.left + insets.right),
                          height: bounds.size.height - (insets.top + insets.bottom))
        }
        
        return override_textRectForBounds(bounds)
    }
    
    func override_editingRectForBounds(_ bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
