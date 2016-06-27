//
//  NUIToolbarRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIToolbarRenderer: NSObject {
    
    static func render(bar: UIToolbar, withClass className: String) {
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            bar.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            bar.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            let image = NUISettings.getImage("background-image", withClass: className)
            bar.setBackgroundImage(image, forToolbarPosition: .Any, barMetrics: .Default)
        }
        
        if NUISettings.hasProperty("background-image-top", withClass: className) {
            let image = NUISettings.getImage("background-image-top", withClass: className)
            bar.setBackgroundImage(image, forToolbarPosition: .Top, barMetrics: .Default)
        }
        
        if NUISettings.hasProperty("background-image-bottom", withClass: className) {
            let image = NUISettings.getImage("background-image-bottom", withClass: className)
            bar.setBackgroundImage(image, forToolbarPosition: .Bottom, barMetrics: .Default)
        }
        
        if NUISettings.hasProperty("background-image-top-landscape", withClass: className) {
            let image = NUISettings.getImage("background-image-top-landscape", withClass: className)
            bar.setBackgroundImage(image, forToolbarPosition: .Top, barMetrics: .Compact)
        }
        
        if NUISettings.hasProperty("background-image-bottom-landscape", withClass: className) {
            let image = NUISettings.getImage("background-image-bottom-landscape", withClass: className)
            bar.setBackgroundImage(image, forToolbarPosition: .Bottom, barMetrics: .Compact)
        }
        
        if NUISettings.hasProperty("shadow-image", withClass: className) {
            let shadowImage = NUISettings.getImage("shadow-image", withClass: className)
            bar.setShadowImage(shadowImage, forToolbarPosition: .Any)
        }
        
        if NUISettings.hasProperty("shadow-image-top", withClass: className) {
            let shadowImage = NUISettings.getImage("shadow-image-top", withClass: className)
            bar.setShadowImage(shadowImage, forToolbarPosition: .Top)
        }
        
        if NUISettings.hasProperty("shadow-image-bottom", withClass: className) {
            let shadowImage = NUISettings.getImage("shadow-image-bottom", withClass: className)
            bar.setShadowImage(shadowImage, forToolbarPosition: .Bottom)
        }
    }
}
