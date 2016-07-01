//
//  NUIUtilities.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/01/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIUtilities: NSObject {
    
    static func titleTextAttributesForClass(className: String, withSuffix suffix: String)  -> [String : AnyObject] {
        
        var titleTextAttributes = [String : AnyObject]()
        
        
        let fontColorSelector = selector("font-color", withSuffix: suffix)
        let textShadowColorSelector = selector("text-shadow-color", withSuffix: suffix)
        let textShadowOffsetSelector = selector("text-shadow-offset", withSuffix: suffix)
        
        if NUISettings.hasFontPropertiesWithClass(className) {
            titleTextAttributes[NSFontAttributeName] = NUISettings.getFontWithClass(className)
        }
        
        if NUISettings.hasProperty(fontColorSelector, withClass: className) {
            titleTextAttributes[NSForegroundColorAttributeName] = NUISettings.getColor(fontColorSelector, withClass: className)
        }
        
        if NUISettings.hasProperty(textShadowColorSelector, withClass: className) ||
            NUISettings.hasProperty(textShadowOffsetSelector, withClass: className) {
            
            let shadow = NSShadow()
            
            if NUISettings.hasProperty(textShadowColorSelector, withClass: className) {
                shadow.shadowColor = NUISettings.getColor(textShadowColorSelector, withClass: className)
            }
            
            if NUISettings.hasProperty(textShadowOffsetSelector, withClass: className) {
                shadow.shadowOffset = NUISettings.getSize(textShadowOffsetSelector, withClass: className)
            }
            
            titleTextAttributes[NSShadowAttributeName] = shadow
        }
        
        return titleTextAttributes
    }
    
    static func titleTextAttributesForClass(className: String) -> [String : AnyObject] {
        return titleTextAttributesForClass(className, withSuffix: "")
    }
    
    static func selector(selector: String, withSuffix suffix: String) -> String {
        
        if suffix.isEmpty {
            return selector
        }
        
        return selector + "-" + suffix
    }
}
