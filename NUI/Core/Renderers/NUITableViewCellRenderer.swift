//
//  NUITableViewCellRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 27/06/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITableViewCellRenderer: NSObject {
    
    static func render(cell: UITableViewCell, withClass className: String) {
        
        renderSizeDependentProperties(cell, withClass: className)
        
        if NUISettings.hasProperty("tint-color", withClass: className) {
            cell.tintColor = NUISettings.getColor("tint-color", withClass: className)
        }
        
        // Set the labels' background colors to clearColor by default, so they don't show a white
        // background on top of the cell background color
        if let label = cell.textLabel {
            
            label.backgroundColor = UIColor.clearColor()
            
            NUIRenderer.renderLabel(label, withClass: className)
        }
        
        if let detailLabel = cell.detailTextLabel {
            
            detailLabel.backgroundColor = UIColor.clearColor()
            NUIRenderer.renderLabel(detailLabel, withClass: className, withSuffix: "Detail")
        }
        
        NUIRenderer.renderView(cell.contentView, withClass: className, withSuffix: "ContentView")
    }
    
    static func sizeDidChange(cell: UITableViewCell) {
        if let className = cell.nuiClass {
            renderSizeDependentProperties(cell, withClass: className)
        }
    }
    
    static func renderSizeDependentProperties(cell: UITableViewCell, withClass className: String) {
        
        if NUISettings.hasProperty("background-color", withClass: className) {
            cell.backgroundColor = NUISettings.getColor("background-color", withClass: className)
        }
        
        if NUISettings.hasProperty("background-color-top", withClass: className) {
            
            let topColor = NUISettings.getColor("background-color-top", withClass: className)!
            let bottomColor = NUISettings.getColor("background-color-bottom", withClass: className)!
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor.CGColor, bottom: bottomColor.CGColor, frame: cell.bounds)
            
            cell.backgroundView = UIImageView(image: gradientImage)
        }
        
        if NUISettings.hasProperty("background-color-selected", withClass: className) {
            
            let selectedBackgroundView = UIView(frame: cell.bounds)
            selectedBackgroundView.backgroundColor = NUISettings.getColor("background-color-selected", withClass: className)
            cell.selectedBackgroundView = selectedBackgroundView

        }
        
        if NUISettings.hasProperty("background-color-top-selected", withClass: className) {
            let topColor = NUISettings.getColor("background-color-top-selected", withClass: className)!
            let bottomColor = NUISettings.getColor("background-color-bottom-selected", withClass: className)!
            let gradientImage = NUIGraphics.gradientImageWithTop(topColor.CGColor, bottom: bottomColor.CGColor, frame: cell.bounds)
            
            cell.selectedBackgroundView = UIImageView(image: gradientImage)
        }
    }
}
