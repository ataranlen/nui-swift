//
//  NUILabelRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/15/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUILabelRenderer: NSObject {
    
    static func render(_ label: UILabel, withClass className: String, withSuffix suffix: String = "") {
        
        var className = className
        
        if suffix != "" {
            className += suffix
        }
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            label.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        } else if label.backgroundColor == nil || label.backgroundColor == .white {
            
            // UILabels created programmatically have a white background by default
            label.backgroundColor = .clear
        }
        
        if NUISettings.hasProperty("font-color", withClass: className) {
            label.textColor = NUISettings.getColor("font-color", withClass: className)
        }
        
        if NUISettings.hasProperty("font-color-highlighted", withClass: className) {
            label.highlightedTextColor = NUISettings.getColor("font-color-highlighted", withClass: className)
        }
        
        NUIViewRenderer.renderSize(label, withClass: className)
        NUIViewRenderer.renderBorder(label, withClass: className)
        NUIViewRenderer.renderShadow(label, withClass: className)
        renderText(label, withClass: className)
    }
    
    static func renderText(_ label: UILabel, withClass className: String) {
        
        if NUISettings.hasFontPropertiesWithClass(className) {
            label.font = NUISettings.getFontWithClass(className, baseFont: label.font)
        }
        
        if NUISettings.hasProperty("text-align", withClass: className) {
            label.textAlignment = NUISettings.getTextAlignment("text-align", withClass: className)
        }
        
        if NUISettings.hasProperty("text-alpha", withClass: className) {
            label.alpha = CGFloat(NUISettings.getFloat("text-alpha", withClass: className)!)
        }
        
        if NUISettings.hasProperty("text-auto-fit", withClass: className) {
            label.adjustsFontSizeToFitWidth = NUISettings.getBoolean("text-auto-fit", withClass: className)
        }
        
        if NUISettings.hasProperty("text-shadow-color", withClass: className) {
            label.shadowColor = NUISettings.getColor("text-shadow-color", withClass: className)
        }
        
        if NUISettings.hasProperty("text-shadow-offset", withClass: className) {
            label.shadowOffset = NUISettings.getSize("text-shadow-offset", withClass: className)!
        }
        
        if NUISettings.hasProperty("text-line-clamp", withClass: className) {
            label.numberOfLines = NUISettings.getInteger("text-line-clamp", withClass: className)!
        }
    }
    
    static func needsTextTransformWithClass(_ className: String) -> Bool {
        
        return NUISettings.hasProperty("text-transform", withClass: className)
    }
    
    static func transformText(_ text: String, withClass className: String) -> String {
        
        if !needsTextTransformWithClass(className) {
            return text
        }
            
        guard let transform = NUISettings.get("text-transform", withClass: className) else {
            return text
        }
        
        switch transform {
        case "uppercase":
            return text.uppercased()
        case "lowercase":
            return text.lowercased()
        case "capitalize":
            return text.capitalized
        default:
            return text
        }
        
    }
    
    static func transformAttributedText(_ attributedText: NSAttributedString,
                                        withClass className: String) -> NSAttributedString {
        
        if !needsTextTransformWithClass(className) {
            return attributedText
        }
        
        var attributes = [([String : Any], NSRange)]()
        
        let range = NSRange(location: 0, length: attributedText.length)
        
        attributedText.enumerateAttributes(in: range, options: .longestEffectiveRangeNotRequired)
        { (attrs, range, _) in
            attributes.append( (attrs, range) )
        }
        
        let transformedText = transformText(attributedText.string, withClass: className)
        
        let transformedAttributedText = attributedText.mutableCopy() as! NSMutableAttributedString
        
        transformedAttributedText.replaceCharacters(in: range, with: transformedText)
        
        for attribute in attributes {
            transformedAttributedText.setAttributes(attribute.0, range: attribute.1)
        }
        
        return transformedAttributedText
    }
}
