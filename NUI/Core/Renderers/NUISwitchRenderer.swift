//
//  NUISwitchRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/21/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISwitchRenderer: NSObject {
    
    static func render(_ uiSwitch: UISwitch, withClass className: String) {
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            uiSwitch.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("on-tint-color", withClass: className) {
            uiSwitch.onTintColor = NUISettings.getColor("on-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("thumb-tint-color", withClass: className) {
            uiSwitch.thumbTintColor = NUISettings.getColor("thumb-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("tint-color", withClass: className) {
            uiSwitch.tintColor = NUISettings.getColor("tint-color", withClass: className)
        }
    }
}
