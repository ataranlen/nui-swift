//
//  NUIWindowRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIWindowRenderer: NSObject {
    
    static func render(window: UIWindow, withClass className: String) {
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            window.rootViewController?.view.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
    }
}
