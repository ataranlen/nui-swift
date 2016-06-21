//
//  NUISliderRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/21/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISliderRenderer: NSObject {
    
    static func render(slider: UISlider, withClass className: String) {
        
        if NUISettings.hasProperty("minimum-track-tint-color", withClass: className) {
            slider.minimumTrackTintColor = NUISettings.getColor("minimum-track-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("maximum-track-tint-color", withClass: className) {
            slider.maximumTrackTintColor = NUISettings.getColor("maximum-track-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("minimum-value-image", withClass: className) {
            slider.minimumValueImage = NUISettings.getImage("minimum-value-image", withClass: className)
        }
        
        if NUISettings.hasProperty("maximum-value-image", withClass: className) {
            slider.maximumValueImage = NUISettings.getImage("maximum-value-image", withClass: className)
        }
        
        if NUISettings.hasProperty("thumb-image", withClass: className) {
            slider.setThumbImage(NUISettings.getImage("thumb-image", withClass: className), forState: .Normal)
        }
        
        if NUISettings.hasProperty("thumb-tint-color", withClass: className) {
            slider.thumbTintColor = NUISettings.getColor("thumb-tint-color", withClass: className)
        }
    }
}
