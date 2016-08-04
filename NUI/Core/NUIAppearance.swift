//
//  NUIAppearance.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIAppearance: NSObject {
    
    static func initDefault() {
        
        self.initUIBarButtonItem()
    }
    
    static func initUIBarButtonItem() {
        
        let className = "BarButton:BarButtonBack"
        let uiClass = UIBarButtonItem.self
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            uiClass.appearance().setTitleTextAttributes(titleTextAttributes, for: UIControlState())
        }
        
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            uiClass.appearance().tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color", withClass: className) ||
            NUISettings.hasProperty("background-color-top", withClass: className) {

            let image = NUIGraphics.backButtonWithClass(className)
            uiClass.appearance().setBackButtonBackgroundImage(image, for: UIControlState(), barMetrics: .default)
        }
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image", withClass: className)
            uiClass.appearance().setBackButtonBackgroundImage(backgroundImage, for: UIControlState(), barMetrics: .default)
        }
        
        if NUISettings.hasProperty("background-image-selected", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image-selected", withClass: className)
            uiClass.appearance().setBackButtonBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        }
        
        if NUISettings.hasProperty("background-image-highlighted", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image-highlighted", withClass: className)
            uiClass.appearance().setBackButtonBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        }
        
        if NUISettings.hasProperty("background-image-disabled", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image-disabled", withClass: className)
            uiClass.appearance().setBackButtonBackgroundImage(backgroundImage, for: .disabled, barMetrics: .default)
        }
    }
}
