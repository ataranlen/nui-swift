//
//  NUITabBarItemRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/26/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITabBarItemRenderer: NSObject {
    
    static func render(_ item: UITabBarItem, withClass className: String) {
        
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            item.setTitleTextAttributes(titleTextAttributes, for: UIControlState())
        }
        
        let selectedTextAttributes = NUIUtilities.titleTextAttributesForClass(className,
                                                                              withSuffix: "selected")
        
        if !selectedTextAttributes.isEmpty {
            item.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        }
        
        if NUISettings.hasProperty("text-offset", withClass: className) {
            item.titlePositionAdjustment = NUISettings.getOffset("text-offset", withClass: className)!
        }
        
        if NUISettings.hasProperty("finished-image", withClass: className) {
            
            let unselectedImage = NUISettings.getImage("finished-image", withClass: className)!
                                             .withRenderingMode(.alwaysOriginal)
            item.image = unselectedImage
        }
        
        if NUISettings.hasProperty("finished-image-selected", withClass: className) {
            
            let selectedImage = NUISettings.getImage("finished-image-selected", withClass: className)!
                                           .withRenderingMode(.alwaysOriginal)
            
            item.selectedImage = selectedImage
        }
    }
}
