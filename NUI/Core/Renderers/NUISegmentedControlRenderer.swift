//
//  NUISegmentedControlRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/21/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISegmentedControlRenderer: NSObject {
    
    static func render(_ control: UISegmentedControl, withClass className: String) {
        
        NUIViewRenderer.renderSize(control, withClass: className)
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image", withClass: className)
            control.setBackgroundImage(backgroundImage, for: UIControlState(), barMetrics: .default)
            
            if NUISettings.hasProperty("background-image-selected", withClass: className) {
                
                let backgroundImageSelected = NUISettings.getImage("background-image-selected", withClass: className)
                control.setBackgroundImage(backgroundImageSelected, for: .selected, barMetrics: .default)
            }
            
        } else if NUISettings.hasProperty("background-color", withClass: className) ||
                  NUISettings.hasProperty("border-color", withClass: className) {
            
            let layer = NUIGraphics.roundedRectLayerWithClass(className, size: control.bounds.size)
            let normalImage = NUIGraphics.roundedRectImageWithClass(className, layer: layer)
            
            if NUISettings.hasProperty("background-color-selected", withClass: className) {
                layer.backgroundColor = NUISettings.getColor("background-color-selected", withClass: className)!.cgColor
            }
            
            let selectedImage = NUIGraphics.roundedRectImageWithClass(className, layer: layer)
            
            control.setBackgroundImage(normalImage, for: UIControlState(), barMetrics: .default)
            control.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
            
            if NUISettings.hasProperty("border-color", withClass: className) {
                let dividerColor = NUISettings.getImageFromColor("border-color", withClass: className)
                control.setDividerImage(dividerColor,
                                        forLeftSegmentState: UIControlState(),
                                        rightSegmentState: UIControlState(),
                                        barMetrics: .default)
            }
        }
    
        // Set divider image or divider color
        if NUISettings.hasProperty("divider-image", withClass: className) {
            
            let dividerImage = NUISettings.getImage("divider-image", withClass: className)
            control.setDividerImage(dividerImage,
                                    forLeftSegmentState: UIControlState(),
                                    rightSegmentState: UIControlState(),
                                    barMetrics: .default)
        } else if NUISettings.hasProperty("divider-color", withClass: className) {
            
            let dividerColor = NUISettings.getImageFromColor("divider-color", withClass: className)
            control.setDividerImage(dividerColor,
                                    forLeftSegmentState: UIControlState(),
                                    rightSegmentState: UIControlState(),
                                    barMetrics: .default)
        }
        
        // Set background tint color
        if NUISettings.hasProperty("background-tint-color", withClass: className) {
            control.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
        }
        
        var titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            control.setTitleTextAttributes(titleTextAttributes, for: UIControlState())
        }
        
        let selectedSegmentAttributeOverrides = NUIUtilities.titleTextAttributesForClass(className, withSuffix: "selected")
        
        if !selectedSegmentAttributeOverrides.isEmpty {
            
            for (key, value) in selectedSegmentAttributeOverrides {
                titleTextAttributes.updateValue(value, forKey: key)
            }
            
            control.setTitleTextAttributes(titleTextAttributes, for: .selected)
        }
    }
}
