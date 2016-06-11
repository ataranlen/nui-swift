//
//  NUIActivityIndicatorRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/11/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIActivityIndicatorRenderer: NSObject {
    
    static func render(activityIndicator: UIActivityIndicatorView, withClass className: String) {
        
        // Set activity indicator color
        if NUISettings.hasProperty("color", withClass: className) {
            activityIndicator.color = NUISettings.getColor("color", withClass: className)
        }
    }
}
