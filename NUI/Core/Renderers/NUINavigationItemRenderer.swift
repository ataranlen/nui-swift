//
//  NUINavigationItemRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/15/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUINavigationItemRenderer: NSObject {
    
    static func render(_ item: UINavigationItem, withClass className: String) {
        
        if let backBarButtonItem = item.backBarButtonItem {
            NUIRenderer.renderBarButtonItem(backBarButtonItem, withClass: className)
        }
        
        if let leftBarButtonItems = item.leftBarButtonItems {
            for leftBarButtonItem in leftBarButtonItems {
                NUIRenderer.renderBarButtonItem(leftBarButtonItem, withClass: className)
            }
        }
        
        if let rightBarButtonItems = item.rightBarButtonItems {
            for rightBarButtonItem in rightBarButtonItems {
                NUIRenderer.renderBarButtonItem(rightBarButtonItem, withClass: className)
            }
        }
    }
}
