//
//  NUITextViewRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITextViewRenderer: NSObject {
    
    static func render(textView: UITextView, withClass className: String) {
        
        NUIViewRenderer.render(textView, withClass: className)
        
        if NUISettings.hasProperty("font-color", withClass: className) {
            textView.textColor = NUISettings.getColor("font-color", withClass: className)
        }
        
        if NUISettings.hasFontPropertiesWithClass(className) {
            textView.font = NUISettings.getFontWithClass(className, baseFont: textView.font)
        }
        
        if NUISettings.hasProperty("padding", withClass: className) {
            textView.contentInset = NUISettings.getEdgeInsets("padding", withClass: className)!
        }
        
        NUITextInputTraitsRenderer.renderKeyboard(textView, withClass: className)
    }
}
