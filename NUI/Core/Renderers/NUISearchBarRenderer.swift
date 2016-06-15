//
//  NUISearchBarRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/16/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISearchBarRenderer: NSObject {
    
    static func render(bar: UISearchBar, withClass className: String) {
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            bar.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            bar.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let topColor = NUISettings.getColor("background-color-top", withClass: className)
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor, bottom: bottomColor, frame: bar.bounds)
            
            bar.backgroundImage = gradientImage
        }
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            bar.backgroundImage = NUISettings.getImage("background-image", withClass: className)
        }
        
        // Render scope bar
        
        if NUISettings.hasProperty("scope-background-color", withClass: className) {
            bar.scopeBarBackgroundImage = NUISettings.getImageFromColor("scope-background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("scope-background-image", withClass: className) {
            bar.scopeBarBackgroundImage = NUISettings.getImage("scope-background-image", withClass: className)
        }
        
        let scopeBarClassName = "SegmentedControl:\(className)ScopeBar"
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(scopeBarClassName) as? [String : AnyObject]
        
        if let titleTextAttributes = titleTextAttributes where !titleTextAttributes.isEmpty {
            bar.setScopeBarButtonTitleTextAttributes(titleTextAttributes, forState: .Normal)
        }
        
        if NUISettings.hasProperty("background-color", withClass: scopeBarClassName) ||
            NUISettings.hasProperty("border-color", withClass: scopeBarClassName) {
            
            let layer = NUIGraphics.roundedRectLayerWithClass(scopeBarClassName, size: bar.bounds.size)
            let normalImage = NUIGraphics.roundedRectImageWithClass(scopeBarClassName, layer: layer)
            
            if NUISettings.hasProperty("background-color-selected", withClass: scopeBarClassName) {
                layer.backgroundColor = NUISettings.getColor("background-color-selected",
                                                             withClass: scopeBarClassName).CGColor
            }
            
            let selectedImage = NUIGraphics.roundedRectImageWithClass(scopeBarClassName, layer: layer)
            
            bar.setScopeBarButtonBackgroundImage(normalImage, forState: .Normal)
            bar.setScopeBarButtonBackgroundImage(selectedImage, forState: .Selected)
            
            if NUISettings.hasProperty("border-color", withClass: scopeBarClassName) {
                let dividerImage = NUISettings.getImageFromColor("border-color", withClass: scopeBarClassName)
                bar.setScopeBarButtonDividerImage(dividerImage, forLeftSegmentState: .Normal, rightSegmentState: .Normal)
            }
        }
    }
}
