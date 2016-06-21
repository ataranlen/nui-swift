//
//  NUISegmentedControlRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/21/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISegmentedControlRenderer: NSObject {
    
    static func render(control: UISegmentedControl, withClass className: String) {
        
        NUIViewRenderer.renderSize(control, withClass: className)
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image", withClass: className)
            control.setBackgroundImage(backgroundImage, forState: .Normal, barMetrics: .Default)
            
            if NUISettings.hasProperty("background-image-selected", withClass: className) {
                
                let backgroundImageSelected = NUISettings.getImage("background-image-selected", withClass: className)
                control.setBackgroundImage(backgroundImageSelected, forState: .Selected, barMetrics: .Default)
            }
            
        } else if NUISettings.hasProperty("background-color", withClass: className) ||
                  NUISettings.hasProperty("border-color", withClass: className) {
            
            let layer = NUIGraphics.roundedRectLayerWithClass(className, size: control.bounds.size)
            let normalImage = NUIGraphics.roundedRectImageWithClass(className, layer: layer)
            
            if NUISettings.hasProperty("background-color-selected", withClass: className) {
                layer.backgroundColor = NUISettings.getColor("background-color-selected", withClass: className).CGColor
            }
            
            let selectedImage = NUIGraphics.roundedRectImageWithClass(className, layer: layer)
            
            control.setBackgroundImage(normalImage, forState: .Normal, barMetrics: .Default)
            control.setBackgroundImage(selectedImage, forState: .Selected, barMetrics: .Default)
            
            if NUISettings.hasProperty("border-color", withClass: className) {
                let dividerColor = NUISettings.getImageFromColor("border-color", withClass: className)
                control.setDividerImage(dividerColor,
                                        forLeftSegmentState: .Normal,
                                        rightSegmentState: .Normal,
                                        barMetrics: .Default)
            }
        }
    
        // Set divider image or divider color
        if NUISettings.hasProperty("divider-image", withClass: className) {
            
            let dividerImage = NUISettings.getImage("divider-image", withClass: className)
            control.setDividerImage(dividerImage,
                                    forLeftSegmentState: .Normal,
                                    rightSegmentState: .Normal,
                                    barMetrics: .Default)
        } else if NUISettings.hasProperty("divider-color", withClass: className) {
            
            let dividerColor = NUISettings.getImageFromColor("divider-color", withClass: className)
            control.setDividerImage(dividerColor,
                                    forLeftSegmentState: .Normal,
                                    rightSegmentState: .Normal,
                                    barMetrics: .Default)
        }
        
        // Set background tint color
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            control.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        var titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            control.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        }
        
        let selectedSegmentAttributeOverrides = NUIUtilities.titleTextAttributesForClass(className, withSuffix: "selected")
        
        if !selectedSegmentAttributeOverrides.isEmpty {
            
            for (key, value) in selectedSegmentAttributeOverrides {
                titleTextAttributes.updateValue(value, forKey: key)
            }
            
            control.setTitleTextAttributes(titleTextAttributes, forState: .Selected)
        }
    }
}
