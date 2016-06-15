//
//  NUIControlRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/15/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIControlRenderer: NSObject {
    
    static func render(control: UIControl, withClass className: String) {
        
        if NUISettings.hasProperty("background-image", withClass: className) {
            control.backgroundColor = NUISettings.getColorFromImage("background-image", withClass: className)
        } else if NUISettings.hasProperty("background-color", withClass: className) {
            control.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        NUIViewRenderer.renderBorder(control, withClass: className)
        NUIViewRenderer.renderShadow(control, withClass: className)
    }
}