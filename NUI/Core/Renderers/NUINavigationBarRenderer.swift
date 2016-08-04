//
//  NUINavigationBarRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/15/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUINavigationBarRenderer: NSObject {
    
    static func render(_ bar: UINavigationBar, withClass className: String) {
        
        if NUISettings.hasProperty("bar-tint-color", withClass: className) {
            bar.barTintColor = NUISettings.getColor("bar-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            bar.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            bar.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            bar.setBackgroundImage(NUISettings.getImage("background-image", withClass: className),
                                   for: .default)
        }
        
        if NUISettings.hasProperty("shadow-image", withClass: className) {
            bar.shadowImage = NUISettings.getImage("shadow-image", withClass: className)
        }
        
        if NUISettings.hasProperty("title-vertical-offset", withClass: className) {
            let offset = CGFloat(NUISettings.getFloat("title-vertical-offset", withClass: className)!)
            bar.setTitleVerticalPositionAdjustment(offset, for: .default)
        }
        
        renderSizeDependentProperties(bar)
        
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            bar.titleTextAttributes = titleTextAttributes
        }
    }
    
    static func sizeDidChange(_ bar: UINavigationBar) {
        
        renderSizeDependentProperties(bar)
    }
    
    static func renderSizeDependentProperties(_ bar: UINavigationBar) {
        
        let className = bar.nuiClass!
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let frame = bar.bounds
            let topColor = NUISettings.getColor("background-color-top", withClass: className)!
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)!
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor.cgColor, bottom: bottomColor.cgColor,frame: frame)
            
            bar.setBackgroundImage(gradientImage, for: .default)
            
        }
    }
}
