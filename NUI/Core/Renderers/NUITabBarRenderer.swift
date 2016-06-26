//
//  NUITabBarRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITabBarRenderer: NSObject {
    
    static func render(bar: UITabBar, withClass className: String) {
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            bar.backgroundImage = NUISettings.getImage("background-image", withClass: className)
        }
        
        if NUISettings.hasProperty("selected-image", withClass: className) {
            bar.selectionIndicatorImage = NUISettings.getImage("selected-image", withClass: className)
        }
        
        if NUISettings.hasProperty("selected-image-tint-color", withClass: className) {
            bar.tintColor = NUISettings.getColor("selected-image-tint-color", withClass: className)
        }
        
        renderSizeDependentProperties(bar)
        
        // Apply UITabBarItem's background-image-selected property to bar.selectionIndicatorImage
        if let items =  bar.items where !items.isEmpty,
           let firstItemClasses = items[0].nuiClass?.componentsSeparatedByString(":") {
            
            for itemClass in firstItemClasses
                where NUISettings.hasProperty("background-image-selected", withClass: itemClass) {
                                                                                
                bar.selectionIndicatorImage = NUISettings.getImage("background-image-selected", withClass: itemClass)
            }
        }
        
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            bar.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("bar-tint-color", withClass: className) {
            bar.barTintColor = NUISettings.getColor("bar-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            bar.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
    }
    
    static func sizeDidChange(bar: UITabBar) {
        renderSizeDependentProperties(bar)
    }
    
    static func renderSizeDependentProperties(bar: UITabBar) {
        
        let className = bar.nuiClass
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let frame = bar.bounds
            let topColor = NUISettings.getColor("background-color-top", withClass: className)
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor, bottom: bottomColor, frame: frame)
            
            bar.backgroundImage = gradientImage
        }
    }
}