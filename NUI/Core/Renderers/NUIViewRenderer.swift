//
//  NUIViewRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIViewRenderer: NSObject {
    
    static func render(view: UIView, withClass className: String) {
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            if NUISettings.hasProperty("background-repeat", withClass: className) &&
                !NUISettings.getBoolean("background-repeat", withClass: className){
                
                view.layer.contents = NUISettings.getImage("background-image", withClass: className)!.CGImage
                
            } else {
                view.backgroundColor = NUISettings.getColorFromImage("background-image", withClass: className)
            }
        } else if NUISettings.hasProperty("background-color", withClass: className) {
            view.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        renderSize(view, withClass: className)
        renderBorder(view, withClass: className)
        renderShadow(view, withClass: className)
    }
    
    static func render(view: UIView, withClass className: String, withSuffix suffix: String) {
        render(view, withClass: className + suffix)
    }
    
    static func renderBorder(view: UIView, withClass className: String) {
        
        let layer = view.layer
        
        if NUISettings.hasProperty("border-color", withClass: className) {
            layer.borderColor = NUISettings.getColor("border-color", withClass: className)!.CGColor
        }
        
        if NUISettings.hasProperty("border-width", withClass: className) {
            layer.borderWidth = CGFloat(NUISettings.getFloat("border-width", withClass: className)!)
        }
        
        if NUISettings.hasProperty("corner-radius", withClass: className) {
            layer.cornerRadius = CGFloat(NUISettings.getFloat("corner-radius", withClass: className)!)
            layer.masksToBounds = true
        }
    }
    
    static func renderShadow(view: UIView, withClass className: String) {
        
        let layer = view.layer
        
        if NUISettings.hasProperty("shadow-radius", withClass: className) {
            layer.shadowRadius = CGFloat(NUISettings.getFloat("shadow-radius", withClass: className)!)
        }
        
        if NUISettings.hasProperty("shadow-offset", withClass: className) {
            layer.shadowOffset = NUISettings.getSize("shadow-offset", withClass: className)!
        }
        
        if NUISettings.hasProperty("shadow-color", withClass: className) {
            layer.shadowColor = NUISettings.getColor("shadow-color", withClass: className)!.CGColor
        }
        
        if NUISettings.hasProperty("shadow-opacity", withClass: className) {
            layer.shadowOpacity = NUISettings.getFloat("shadow-opacity", withClass: className)!
        }
    }
    
    static func renderSize(view: UIView, withClass className: String) {
        
        var height = view.frame.size.height
        if NUISettings.hasProperty("height", withClass: className) {
            height = CGFloat(NUISettings.getFloat("height", withClass: className)!)
        }
        
        var width = view.frame.size.width
        if NUISettings.hasProperty("width", withClass: className) {
            width = CGFloat(NUISettings.getFloat("width", withClass: className)!)
        }
        
        if height != view.frame.size.height || width != view.frame.size.width {
            view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: width, height: height)
        }
    }
    
    static func hasShadowProperties(view: UIView, withClass className: String) -> Bool {
        
        var hasAnyShadowProperty = false
        
        for property in ["shadow-radius", "shadow-offset", "shadow-color", "shadow-opacity"] {
            hasAnyShadowProperty = hasAnyShadowProperty || NUISettings.hasProperty(property, withClass: className)
        }
        
        return hasAnyShadowProperty
    }
}
