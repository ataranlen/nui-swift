//
//  NUITableViewRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITableViewRenderer: NSObject {
    
    static func render(tableView: UITableView, withClass className: String) {
    
        if NUISettings.hasProperty("background-color", withClass: className) {
            tableView.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("separator-style", withClass: className) {
            tableView.separatorStyle = NUISettings.getSeparatorStyle("separator-style", withClass: className)
        }
        
        if NUISettings.hasProperty("separator-color", withClass: className) {
            tableView.separatorColor = NUISettings.getColor("separator-color", withClass: className)
        }
        
        if NUISettings.hasProperty("row-height", withClass: className) {
            tableView.rowHeight = CGFloat(NUISettings.getFloat("row-height", withClass: className))
        }
        
        renderSizeDependentProperties(tableView, withClass: className)
    }
    
    static func sizeDidChange(tableView: UITableView) {
        renderSizeDependentProperties(tableView, withClass: tableView.nuiClass)
    }
    
    static func renderSizeDependentProperties(tableView: UITableView, withClass className: String) {
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let topColor = NUISettings.getColor("background-color-top", withClass: className)
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor, bottom: bottomColor, frame: tableView.bounds)
            
            tableView.backgroundView = UIImageView(image: gradientImage)
        }
    }
}