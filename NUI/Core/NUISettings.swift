//
//  NUISettings.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUISettings: NSObject {
    
    static var instance: NUISettings!
    
    static func initDefault() {
        initWithStylesheet("NUIStyle")
    }
    
    static func initWithStylesheet(name: String) {
        
        instance = getInstance()
        instance._stylesheetName = name
        
        let orientation = UIApplication.sharedApplication().statusBarOrientation
        
        instance._stylesheetOrientation = stylesheetOrientationFromInterfaceOrientation(orientation)
        
        let parser = NUIStyleParser()
        instance._styles = (parser.getStylesFromFile(name) as [NSObject : AnyObject]) as! [String : [String : String]]
        
        NUIAppearance.initDefault()
    }
    
    static func appendStylesheet(name: String) {
        
        instance = getInstance()
        
        instance._additionalStylesheetNames.append(name)
        let parser = NUIStyleParser()
        instance.appendStyles(parser.getStylesFromFile(name) as [NSObject : AnyObject] as! [String : [String : String]])
    }
    
    static func loadStylesheetByPath(path: String) {
        
        instance = getInstance()
        let parser = NUIStyleParser()
        instance._styles = (parser.getStylesFromFile(path) as [NSObject : AnyObject]) as! [String : [String : String]]
    }
    
    static func reloadStylesheets() {
        
        instance = getInstance()
        
        let parser = NUIStyleParser()
        instance._styles = (parser.getStylesFromFile(instance._stylesheetName) as [NSObject : AnyObject]) as! [String : [String : String]]
    
        for name in instance._additionalStylesheetNames {
            let styles = (parser.getStylesFromFile(name) as [NSObject : AnyObject]) as! [String : [String : String]]
            instance.appendStyles(styles)
        }
        
        
    }
    
    static func reloadStylesheetsOnOrientationChange(orientation: UIInterfaceOrientation) -> Bool {
        
        instance = getInstance()
        
        let newStylesheetOrientation = stylesheetOrientationFromInterfaceOrientation(orientation)
        
        if newStylesheetOrientation == instance._stylesheetOrientation {
            return false
        }
        
        instance._stylesheetOrientation = newStylesheetOrientation
        reloadStylesheets()
        return true
    }
    
    static func autoUpdateIsEnabled() -> Bool {
        instance = getInstance()
        return instance._autoUpdatePath != nil
    }
    
    static func autoUpdatePath() -> String? {
        instance = getInstance()
        return instance._autoUpdatePath
    }
    
    static func setAutoUpdatePath(path: String) {
        instance = getInstance()
        instance._autoUpdatePath = path
    }
    
    static func hasProperty(property: String, withExplicitClass className: String) -> Bool {
        instance = getInstance()
        return instance._styles[className]?[property] != nil
    }
    
    static func hasProperty(property: String, withClass className: String) -> Bool {
        
        let classes = getClasses(className)
        for inheritedClass in classes where hasProperty(property, withExplicitClass: inheritedClass) {
            return true
        }
        
        return false
    }
    
    static func hasFontPropertiesWithClass(className: String) -> Bool {
        return hasProperty("font-name", withClass: className) ||
               hasProperty("font-size", withClass: className)
    }
    
    static func get(property: String, withExplicitClass className: String) -> String? {
        instance = getInstance()
        return instance._styles[className]?[property]
    }
    
    static func get(property: String, withClass className: String) -> String? {
        
        let classes = getClasses(className)
        for inheritedClass in classes where hasProperty(property, withExplicitClass: inheritedClass) {
            return get(property, withExplicitClass: inheritedClass)
        }
        return nil
    }
    
    static func getBoolean(property: String, withClass className: String) -> Bool {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toBoolean(propertyValue)
        }
        return false
    }
    
    static func getFloat(property: String, withClass className: String) -> Float? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toFloat(propertyValue)
        }
        return nil
    }
    
    static func getInteger(property: String, withClass className: String) -> Int? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toInteger(propertyValue)
        }
        return nil
    }
    
    static func getSize(property: String, withClass className: String) -> CGSize? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toSize(propertyValue)
        }
        return nil
    }
    
    static func getOffset(property: String, withClass className: String) -> UIOffset? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toOffset(propertyValue)
        }
        return nil
    }
    
    static func getEdgeInsets(property: String, withClass className: String) -> UIEdgeInsets? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toEdgeInsets(propertyValue)
        }
        return nil
    }
    
    static func getBorderStyle(property: String, withClass className: String) -> UITextBorderStyle {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toBorderStyle(propertyValue)
        }
        return .None
    }
    
    static func getSeparatorStyle(property: String, withClass className: String) -> UITableViewCellSeparatorStyle {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toSeparatorStyle(propertyValue)
        }
        return .None
    }
    
    static func getFontWithClass(className: String) -> UIFont? {
        return getFontWithClass(className, baseFont: nil)
    }
    
    static func getFontWithClass(className: String, baseFont: UIFont?) -> UIFont {
        
        var fontSize: CGFloat
        var font: UIFont?
        
        if let _fontSize = getFloat("font-size", withClass: className) {
            fontSize = CGFloat(_fontSize)
        } else {
            fontSize = baseFont?.pointSize ?? UIFont.systemFontSize()
        }
        
        if let fontName = get("font-name", withClass: className) {
            
            if #available(iOS 8.2, *) {
                switch fontName {
                case "blackSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightBlack)
                case "heavySystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightHeavy)
                case "lightSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightLight)
                case "mediumSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightMedium)
                case "semiboldSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightSemibold)
                case "thinSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightThin)
                case "ultraLightSystem":
                    font = UIFont.systemFontOfSize(fontSize, weight: UIFontWeightUltraLight)
                default:
                    break
                }
            }
            
            if font == nil {
                switch fontName {
                case "system":
                    font = UIFont.systemFontOfSize(fontSize)
                case "boldSystem":
                    font = UIFont.boldSystemFontOfSize(fontSize)
                case "italicSystem":
                    font = UIFont.italicSystemFontOfSize(fontSize)
                default:
                    font = UIFont(name: fontName, size: fontSize)
                }
            }
        }
        
        if font == nil {
            font = baseFont?.fontWithSize(fontSize) ?? UIFont.systemFontOfSize(fontSize)
        }
        
        return font!
    }
    
    static func getColor(property: String, withClass className: String) -> UIColor? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toColor(propertyValue)
        }
        return nil
    }
    
    static func getColorFromImage(property: String, withClass className: String) -> UIColor? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toColorFromImageName(propertyValue)
        }
        return nil
    }
    
    static func getImageFromColor(property: String, withClass className: String) -> UIImage? {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toImageFromColorName(propertyValue)
        }
        return nil
    }
    
    static func getImage(property: String, withClass className: String) -> UIImage? {
        
        guard let propertyValue = get(property, withClass: className) else { return nil }
        guard let image = NUIConverter.toImageFromImageName(propertyValue) else { return nil }
        let insetsProperty = property + "-insets"
        guard let insets = getEdgeInsets(insetsProperty, withClass: className) else { return image }
        
        return image.resizableImageWithCapInsets(insets)
    }
    
    static func getTextAlignment(property: String, withClass className: String) -> NSTextAlignment {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toTextAlignment(propertyValue)
        }
        return .Left
    }
    
    static func getControlContentHorizontalAlignment(
        property: String, withClass className: String) -> UIControlContentHorizontalAlignment {
        
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toControlContentHorizontalAlignment(propertyValue)
        }
        return .Left
    }
    
    static func getControlContentVerticalAlignment(
        property: String, withClass className: String) -> UIControlContentVerticalAlignment {
        
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toControlContentVerticalAlignment(propertyValue)
        }
        return .Top
    }
    
    static func getKeyboardAppearance(property: String, withClass className: String) -> UIKeyboardAppearance {
        if let propertyValue = get(property, withClass: className) {
            return NUIConverter.toKeyboardAppearance(propertyValue)
        }
        return .Default
    }
    
    static func getClasses(className: String) -> [String] {
        return className.componentsSeparatedByString(":").reverse()
    }
    
    static func setGlobalExclusions(array: [String]) {
        instance = getInstance()
        instance._globalExclusions = array
    }
    
    static func getGlobalExclusions() -> [String]? {
        instance = getInstance()
        return instance._globalExclusions
    }
    
    static func stylesheetOrientation() -> String? {
        instance = getInstance()
        return instance._stylesheetOrientation
    }
    
    static func stylesheetOrientationFromInterfaceOrientation(orientation: UIInterfaceOrientation) -> String {
        return UIInterfaceOrientationIsLandscape(orientation) ? "landscape" : "portrait"
    }
    
    var _autoUpdatePath: String?
    var _styles = [String : [String : String]]()
    var _stylesheetName: String?
    var _additionalStylesheetNames = [String]()
    var _globalExclusions = [String]()
    var _stylesheetOrientation: String?
    
    func appendStyles(newStyles: [String : [String : String]]) {
        
        for (key, style) in newStyles {
            if _styles[key] == nil {
                _styles[key] = style
                continue
            }
            
            for (propertyKey, propertyValue) in style {
                _styles[key]![propertyKey] = propertyValue
            }
        }
    }
    
    static func getInstance() -> NUISettings {
        
        let settingsQueue = dispatch_queue_create("com.NUI.NUISettingsQueue", nil)
        dispatch_sync(settingsQueue) { 
            if instance == nil {
                NUISwizzler().swizzleAll()
                instance = NUISettings()
            }
        }
        return instance!
    }
}
