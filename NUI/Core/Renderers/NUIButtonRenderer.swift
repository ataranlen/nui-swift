//
//  NUIButtonRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/15/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIButtonRenderer: NSObject {
    
    /**
     Renders a button using properties described inside a specific NUI class
     
     - parameter button:    Button to render
     - parameter className: The name of NUI class to use
     */
    static func render(_ button: UIButton, withClass className: String) {
        
        NUIViewRenderer.renderSize(button, withClass: className)
        
        
        // ???
        // UIButtonTypeRoundedRect's first two sublayers contain its background and border, which
        // need to be hidden for NUI's rendering to be displayed correctly. Ideally we would switch
        // over to a UIButtonTypeCustom, but this appears to be impossible.
        if button.buttonType == .system && button.layer.sublayers != nil && button.layer.sublayers!.count > 2 {
            button.layer.sublayers![0].opacity = 0
            button.layer.sublayers![1].opacity = 0
        }
        
        // MARK: Set padding
        if NUISettings.hasProperty("padding", withClass: className) {
            button.titleEdgeInsets = NUISettings.getEdgeInsets("padding", withClass: className)!
        }
        
        // MARK: Set background color
        if NUISettings.hasProperty("background-color", withClass: className) {
            button.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color-normal", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-normal", withClass: className)
            button.setBackgroundImage(backgroundImage, for: UIControlState())
        }
        
        if NUISettings.hasProperty("background-color-highlighted", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-highlighted", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .highlighted)
        }
        
        if NUISettings.hasProperty("background-color-selected", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-selected", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .selected)
        }
        
        if NUISettings.hasProperty("background-color-selected-highlighted", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-selected-highlighted", withClass: className)
            button.setBackgroundImage(backgroundImage, for: [.selected, .highlighted])
        }
        
        if NUISettings.hasProperty("background-color-selected-disabled", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-selected-disabled", withClass: className)
            button.setBackgroundImage(backgroundImage, for: [.selected, .disabled])
        }
        
        if NUISettings.hasProperty("background-color-disabled", withClass: className) {
            let backgroundImage = NUISettings.getImageFromColor("background-color-disabled", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .disabled)
        }
        
        // MARK: Set background gradient
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            let topColor = NUISettings.getColor("background-color-top", withClass: className)!
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)!
            let gradientLayer = NUIGraphics.gradientLayerWithTop(topColor.cgColor, bottom: bottomColor.cgColor, frame: button.bounds)
            
            if button.gradientLayer != nil {
                button.layer.replaceSublayer(button.gradientLayer, with: gradientLayer)
            } else {
                let backgroundLayerIndex = UInt32(button.layer.sublayers?.count == 1 ? 0 : 1)
                button.layer.insertSublayer(gradientLayer, at: backgroundLayerIndex)
            }
            
            button.gradientLayer = gradientLayer
        }
        
        // MARK: Set background image
        if NUISettings.hasProperty("background-image", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image", withClass: className)
            button.setBackgroundImage(backgroundImage, for: UIControlState())
        }
        
        if NUISettings.hasProperty("background-image-highlighted", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image-highlighted", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .highlighted)
        }
        
        if NUISettings.hasProperty("background-image-selected", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image-selected", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .selected)
        }
        
        if NUISettings.hasProperty("background-image-selected-highlighted", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image-selected-highlighted", withClass: className)
            button.setBackgroundImage(backgroundImage, for: [.selected, .highlighted])
        }
        
        if NUISettings.hasProperty("background-image-selected-disabled", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image-selected-disabled", withClass: className)
            button.setBackgroundImage(backgroundImage, for: [.selected, .disabled])
        }
        
        if NUISettings.hasProperty("background-image-disabled", withClass: className) {
            let backgroundImage = NUISettings.getImage("background-image-disabled", withClass: className)
            button.setBackgroundImage(backgroundImage, for: .disabled)
        }
        
        // MARK: Set image
        if NUISettings.hasProperty("image", withClass: className) {
            let image = NUISettings.getImage("image", withClass: className)
            button.setImage(image, for: UIControlState())
        }
        
        if NUISettings.hasProperty("image-highlighted", withClass: className) {
            let image = NUISettings.getImage("image-highlighted", withClass: className)
            button.setImage(image, for: .highlighted)
        }
        
        if NUISettings.hasProperty("image-selected", withClass: className) {
            let image = NUISettings.getImage("image-selected", withClass: className)
            button.setImage(image, for: .selected)
        }
        
        if NUISettings.hasProperty("image-selected-highlighted", withClass: className) {
            let image = NUISettings.getImage("image-selected-highlighted", withClass: className)
            button.setImage(image, for: [.selected, .highlighted])
        }
        
        if NUISettings.hasProperty("image-selected-disabled", withClass: className) {
            let image = NUISettings.getImage("image-selected-dsiabled", withClass: className)
            button.setImage(image, for: [.selected, .disabled])
        }
        
        if NUISettings.hasProperty("image-disabled", withClass: className) {
            let image = NUISettings.getImage("image-dsiabled", withClass: className)
            button.setImage(image, for: .disabled)
        }
        if let titleLabel = button.titleLabel {
            NUILabelRenderer.renderText(titleLabel, withClass: className)
        }
        
        // MARK: Set text align
        if NUISettings.hasProperty("text-align", withClass: className) {
            button.contentHorizontalAlignment = NUISettings.getControlContentHorizontalAlignment("text-align",
                                                                                                 withClass: className)
        }
        
        // MARK: Set font color
        if NUISettings.hasProperty("font-color", withClass: className) {
            let fontColor = NUISettings.getColor("font-color", withClass: className)
            button.setTitleColor(fontColor, for: UIControlState())
        }
        
        if NUISettings.hasProperty("font-color-highlighted", withClass: className) {
            let fontColor = NUISettings.getColor("font-color-highlighted", withClass: className)
            button.setTitleColor(fontColor, for: .highlighted)
        }
        
        if NUISettings.hasProperty("font-color-selected", withClass: className) {
            let fontColor = NUISettings.getColor("font-color-selected", withClass: className)
            button.setTitleColor(fontColor, for: .selected)
        }
        
        if NUISettings.hasProperty("font-color-selected-highlighted", withClass: className) {
            let fontColor = NUISettings.getColor("font-color-selected-highlighted", withClass: className)
            button.setTitleColor(fontColor, for: [.selected, .highlighted])
        }
        
        if NUISettings.hasProperty("font-color-selected-disabled", withClass: className) {
            let fontColor = NUISettings.getColor("font-color-selected-disabled", withClass: className)
            button.setTitleColor(fontColor, for: [.selected, .disabled])
        }
        
        if NUISettings.hasProperty("font-color-disabled", withClass: className) {
            let fontColor = NUISettings.getColor("font-color-disabled", withClass: className)
            button.setTitleColor(fontColor, for: .disabled)
        }
        
        // MARK: Set text shadow color
        if NUISettings.hasProperty("text-shadow-color", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: UIControlState())
        }
        
        if NUISettings.hasProperty("text-shadow-color-highlighted", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color-highlighted", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: .highlighted)
        }
        
        if NUISettings.hasProperty("text-shadow-color-selected", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color-selected", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: .selected)
        }
        
        if NUISettings.hasProperty("text-shadow-color-selected-highlighted", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color-selected-highlighted", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: [.selected, .highlighted])
        }
        
        if NUISettings.hasProperty("text-shadow-color-selected-disabled", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color-selected-disabled", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: [.selected, .disabled])
        }
        
        if NUISettings.hasProperty("text-shadow-color-disabled", withClass: className) {
            let textShadowColor = NUISettings.getColor("text-shadow-color-disabled", withClass: className)
            button.setTitleShadowColor(textShadowColor, for: .disabled)
        }
        
        // MARK: Set title insets
        if NUISettings.hasProperty("title-insets", withClass: className) {
            button.titleEdgeInsets = NUISettings.getEdgeInsets("title-insets", withClass: className)!
        }
        
        // MARK: Set content insets
        if NUISettings.hasProperty("title-insets", withClass: className) {
            button.contentEdgeInsets = NUISettings.getEdgeInsets("content-insets", withClass: className)!
        }
        
        NUIViewRenderer.renderBorder(button, withClass: className)
        
        // If a shadow-* is configured and corner-radius is set disable mask to bounds and fall back
        // to manually applying corner radius to all sub-views (except the label)
        if NUIViewRenderer.hasShadowProperties(button, withClass: className) &&
            NUISettings.hasProperty("corner-radius", withClass: className) {
            
            let radius = CGFloat(NUISettings.getFloat("corner-radius", withClass: className)!)
            
            for subview in button.subviews {
                if !(subview is UILabel) {
                    subview.layer.cornerRadius = radius
                }
            }
            
            button.layer.masksToBounds = false
        }
        
        NUIViewRenderer.renderShadow(button, withClass: className)
    }
}
