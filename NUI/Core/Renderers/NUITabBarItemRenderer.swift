//
//  NUITabBarItemRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/26/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITabBarItemRenderer: NSObject {
    
    static func render(item: UITabBarItem, withClass className: String) {
        
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className) as? [String : AnyObject]
        
        if let titleTextAttributes = titleTextAttributes where !titleTextAttributes.isEmpty {
            item.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        }
        
        let selectedTextAttributes = NUIUtilities.titleTextAttributesForClass(className,
                                                                              withSuffix: "selected") as? [String : AnyObject]
        
        if let selectedTextAttributes = selectedTextAttributes where !selectedTextAttributes.isEmpty {
            item.setTitleTextAttributes(selectedTextAttributes, forState: .Selected)
        }
        
        if NUISettings.hasProperty("text-offset", withClass: className) {
            item.titlePositionAdjustment = NUISettings.getOffset("text-offset", withClass: className)
        }
        
        if NUISettings.hasProperty("finished-image", withClass: className) {
            
            let unselectedImage = NUISettings.getImage("finished-image", withClass: className)
                                             .imageWithRenderingMode(.AlwaysOriginal)
            item.image = unselectedImage
        }
        
        if NUISettings.hasProperty("finished-image-selected", withClass: className) {
            
            let selectedImage = NUISettings.getImage("finished-image-selected", withClass: className)
                                           .imageWithRenderingMode(.AlwaysOriginal)
            
            item.selectedImage = selectedImage
        }
    }
}