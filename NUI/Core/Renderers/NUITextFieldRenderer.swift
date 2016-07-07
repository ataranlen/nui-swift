//
//  NUITextFieldRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITextFieldRenderer: NSObject {
    
    static func render(textField: UITextField, withClass className: String) {
        
        if NUISettings.hasFontPropertiesWithClass(className) {
            textField.font = NUISettings.getFontWithClass(className, baseFont: textField.font)
        }
        
        if NUISettings.hasProperty("font-color", withClass: className) {
            textField.textColor = NUISettings.getColor("font-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            textField.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let topColor = NUISettings.getColor("background-color-top", withClass: className)!
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)!
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor.CGColor, bottom: bottomColor.CGColor, frame: textField.bounds)
            
            textField.background = gradientImage
        }
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            textField.background = NUISettings.getImage("background-image", withClass: className)
        }
        
        if NUISettings.hasProperty("vertical-align", withClass: className) {
            textField.contentVerticalAlignment = NUISettings.getControlContentVerticalAlignment("vertical-align",
                                                                                                withClass: className)
        }
        
        if NUISettings.hasProperty("border-style", withClass: className) {
            textField.borderStyle = NUISettings.getBorderStyle("border-style", withClass: className)
        }
        
        if NUISettings.hasProperty("tint-color", withClass: className) {
            textField.tintColor = NUISettings.getColor("tint-color", withClass: className)
        }
        
        NUIViewRenderer.renderSize(textField, withClass: className)
        NUIViewRenderer.renderBorder(textField, withClass: className)
        NUIViewRenderer.renderShadow(textField, withClass: className)
        NUITextInputTraitsRenderer.renderKeyboard(textField, withClass: className)
    }
}
