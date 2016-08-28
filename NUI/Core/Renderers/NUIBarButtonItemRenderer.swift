//
//  NUIBarButtonItemRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/11/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIBarButtonItemRenderer: NSObject {
    
    static func render(_ item: UIBarButtonItem, withClass className: String) {
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            
            let backgroundImage = NUISettings.getImage("background-image", withClass: className)
            item.setBackgroundImage(backgroundImage, for: UIControlState(), barMetrics: .default)
            
        } else if NUISettings.hasProperty("background-tint-color", withClass: className) {
            
            item.tintColor = NUISettings.getColor("background-tint-color", withClass: className)
            
        } else if NUISettings.hasProperty("background-color", withClass: className) ||
            NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let layer = CALayer()
            layer.frame = CGRect(x: 0, y: 0, width: 30, height: 26)
            layer.masksToBounds = true
            
            if NUISettings.hasProperty("background-color-top", withClass: className) {
                
                let topColor = NUISettings.getColor("background-color-top", withClass: className)!
                let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)!
                let gradientLayer = NUIGraphics.gradientLayerWithTop(topColor.cgColor, bottom: bottomColor.cgColor, frame: layer.frame)
                
                if item.gradientLayer != nil {
                    layer.replaceSublayer(item.gradientLayer, with: gradientLayer)
                } else {
                    layer.insertSublayer(gradientLayer, at: 0)
                }
                
                item.gradientLayer = gradientLayer
            }
            
            if NUISettings.hasProperty("background-color", withClass: className) {
                layer.backgroundColor = NUISettings.getColor("background-color", withClass: className)!.cgColor
            }
            
            if NUISettings.hasProperty("border-color", withClass: className) {
                layer.borderColor = NUISettings.getColor("border-color", withClass: className)!.cgColor
            }
            
            if NUISettings.hasProperty("border-width", withClass: className) {
                layer.borderWidth = CGFloat(NUISettings.getFloat("border-width", withClass: className)!)
            }
            
            let cornerRadius = NUISettings.getFloat("corner-radius", withClass: className)!
            var insetLength = cornerRadius
            
            if cornerRadius < 5 {
                insetLength = 5
            }
            insetLength = insetLength + 3.0
            
            if NUISettings.hasProperty("corner-radius", withClass: className) {
                layer.cornerRadius = CGFloat(NUISettings.getFloat("corner-radius", withClass: className)!)
            }
            
            let insets = UIEdgeInsets(top: CGFloat(insetLength),
                                      left: CGFloat(insetLength),
                                      bottom: CGFloat(insetLength),
                                      right: CGFloat(insetLength))
            
            var image = NUIGraphics.caLayerToUIImage(layer)
            
            image = image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
            
            item.setBackgroundImage(image, for: UIControlState(), barMetrics: .default)
            
            if NUISettings.hasProperty("background-color-highlighted", withClass: className) {
                let highlightedLayer = layer
                
                highlightedLayer.backgroundColor = NUISettings.getColor("background-color-highlighted",
                    withClass: className)!.cgColor
                
                var highlightedImage = NUIGraphics.caLayerToUIImage(highlightedLayer)
                highlightedImage = highlightedImage.resizableImage(withCapInsets: insets, resizingMode: .stretch)
                
                item.setBackgroundImage(highlightedImage, for: .highlighted, barMetrics: .default)
            }
        }
        
        let titleTextAttributes = NUIUtilities.titleTextAttributesForClass(className)
        
        if !titleTextAttributes.isEmpty {
            item.setTitleTextAttributes(titleTextAttributes, for: UIControlState())
        }
    }
}
