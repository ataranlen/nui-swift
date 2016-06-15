//
//  NUIProgressViewRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 15.06.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIProgressViewRenderer: NSObject {
    
    static func render(progressView: UIProgressView) {
        
        render(progressView, withClass: "Progress")
    }
    
    static func render(progressView: UIProgressView, withClass className: String) {
        
        if NUISettings.hasProperty("progress-tint-color", withClass: className) {
            progressView.progressTintColor = NUISettings.getColor("progress-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("progress-image", withClass: className) {
            progressView.progressImage = NUISettings.getImage("progress-image", withClass: className)
        }
        
        if NUISettings.hasProperty("track-tint-color", withClass: className) {
            progressView.trackTintColor = NUISettings.getColor("track-tint-color", withClass: className)
        }
        
        if NUISettings.hasProperty("track-image", withClass: className) {
            progressView.trackImage = NUISettings.getImage("track-image", withClass: className)
        }
        
        NUIViewRenderer.renderSize(progressView, withClass: className)
    }
}
