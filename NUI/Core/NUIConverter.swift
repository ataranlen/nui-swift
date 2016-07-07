//
//  NUIConverter.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/05/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIConverter: NSObject {
    
    // TODO: Try not to use NSString
    static func toBoolean(value: String) -> Bool {
        if value == "true" {
            return true
        } else if value == "false" {
            return false
        }
        return (value as NSString).boolValue
    }
    
    // TODO: Try not to use NSString
    static func toFloat(value: String) -> Float? {
        return (value as NSString).floatValue
    }
    
    // TODO: Try not to use NSString
    static func toInteger(value: String) -> Int? {
        return (value as NSString).integerValue
    }
    
    static func toSize(value: String) -> CGSize? {
        
        let strings = value.componentsSeparatedByString(" , ").map { Double($0) }
        
        guard let width = strings[0],
              let height = strings[1] else { return nil }
        
        return CGSize(width: width, height: height)
    }
    
    static func toOffset(value: String) -> UIOffset? {
        
        guard let size = toSize(value) else { return nil }
        return UIOffset(horizontal: size.width, vertical: size.height)
    }
    
    static func toEdgeInsets(value: String) -> UIEdgeInsets? {
        
        let values = value.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).filter {
            $0 != ""
        }
        
        // edges will contain a CSS-like ordering of edges (top, right, bottom, left)
        var edges = [String](count: 4, repeatedValue: "")
        
        switch values.count {
        case 1:
            edges = [values[0], values[0], values[0], values[0]]
        case 2:
            edges = [values[0], values[1], values[0], values[1]]
        case 3:
            edges = [values[0], values[1], values[2], values[1]]
        case 4:
            edges = [values[0], values[1], values[2], values[3]]
        default:
            break
        }
        
        guard let top = toFloat(edges[0]),
              let left = toFloat(edges[3]),
              let bottom = toFloat(edges[2]),
              let right = toFloat(edges[1]) else { return nil }
        
        return UIEdgeInsets(top: CGFloat(top),
                            left: CGFloat(left),
                            bottom: CGFloat(bottom),
                            right: CGFloat(right))
    }
    
    static func toBorderStyle(value: String) -> UITextBorderStyle {
        switch value {
        case "line":
            return .Line
        case "bezel":
            return .Bezel
        case "rounded":
            return .RoundedRect
        default:
            return .None
        }
    }
    
    static func toSeparatorStyle(value: String) -> UITableViewCellSeparatorStyle {
        switch value {
        case "single-line":
            return .SingleLine
        case "single-line-etched":
            return .SingleLineEtched
        default:
            return .None
        }
    }
    
    static func toColor(value: String) -> UIColor? {
        switch value {
        case "black":
            return UIColor.blackColor()
        case "darkGray":
            return UIColor.darkGrayColor()
        case "lightGray":
            return UIColor.lightGrayColor()
        case "white":
            return UIColor.whiteColor()
        case "gray":
            return UIColor.grayColor()
        case "red":
            return UIColor.redColor()
        case "green":
            return UIColor.greenColor()
        case "blue":
            return UIColor.blueColor()
        case "cyan":
            return UIColor.cyanColor()
        case "yellow":
            return UIColor.yellowColor()
        case "magenta":
            return UIColor.magentaColor()
        case "orange":
            return UIColor.orangeColor()
        case "purple":
            return UIColor.purpleColor()
        case "brown":
            return UIColor.brownColor()
        case "clear":
            return UIColor.clearColor()
        default:
            break
        }
        
        // Remove all whitespace.
        let cString = value.componentsSeparatedByCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()).reduce("", combine: +).uppercaseString
        
        let hexStrings = getCapturedStrings(cString, withPattern: "(?:0X|#)([0-9A-F]{6})")
        
        let csStrings = getCapturedStrings(cString, withPattern: "(RGB|RGBA|HSL|HSLA)\\((\\d{1,3}|[0-9.]+),(\\d{1,3}|[0-9.]+),(\\d{1,3}|[0-9.]+)(?:,(\\d{1,3}|[0-9.]+))?\\)")
        
        var color: UIColor?
        
        if let hexStrings = hexStrings {
            var c: UInt32 = 0
            NSScanner(string: hexStrings[1]).scanHexInt(&c)
            
            color = UIColor(red: CGFloat((c >> 16) & 0xFF) / 255.0,
                            green: CGFloat((c >> 8) & 0xFF) / 255.0,
                            blue: CGFloat((c >> 0) & 0xFF) / 255.0,
                            alpha: 1.0)
        } else if let csStrings = csStrings {
            let isRGB = csStrings[1].hasPrefix("RGB")
            let isAlpha = csStrings[1].hasSuffix("A")
            
            // Color space with alpha specified but no alpha provided.
            if isAlpha && csStrings[5] == "" {
                return nil
            }
            
            guard let component2 = parseColorComponent(csStrings[2]),
                  let component3 = parseColorComponent(csStrings[3]),
                  let component4 = parseColorComponent(csStrings[4]),
                  let alpha = isAlpha ? parseColorComponent(csStrings[5]) : 1.0 else { return nil }
            
            if isRGB {
                color = UIColor(red: component2,
                                green: component3,
                                blue: component4,
                                alpha: alpha)
            } else {
                color = UIColor(hue: component2,
                                saturation: component3,
                                brightness: component4,
                                alpha: alpha)
            }
        }
        
        return color
    }
    
    /**
     Parses a color component in a color expression. Values containing
     periods (.) are treated as unscaled floats. Integer values
     are normalized by 255.
     */
    static func parseColorComponent(value: String) -> CGFloat? {
        guard let floatValue = Float(value) else { return nil }
        if value.rangeOfString(".") != nil {
            return CGFloat(floatValue)
        } else {
            return CGFloat(floatValue) / 255.0
        }
    }
    
    static func toColorFromImageName(value: String) -> UIColor? {
        guard let image = toImageFromImageName(value) else { return nil }
        return UIColor(patternImage: image)
    }
    
    static func toImageFromColorName(value: String) -> UIImage? {
        guard let color = toColor(value) else { return nil }
        
        var alpha: CGFloat = 1.0
        color.getRed(nil, green: nil, blue: nil, alpha: &alpha)
        let isOpaque = (alpha == 1.0)
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, isOpaque, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func toImageFromImageName(value: String) -> UIImage? {
        return UIImage(named: value)
    }
    
    static func toTextAlignment(value: String) -> NSTextAlignment {
        switch value {
        case "center":
            return .Center
        case "right":
            return .Right
        default:
            return .Left
        }
    }
    
    static func toControlContentHorizontalAlignment(value: String) -> UIControlContentHorizontalAlignment {
        switch value {
        case "center":
            return .Center
        case "right":
            return .Right
        case "fill":
            return .Fill
        default:
            return .Left
        }
    }
    
    static func toControlContentVerticalAlignment(value: String) -> UIControlContentVerticalAlignment {
        switch value {
        case "center":
            return .Center
        case "bottom":
            return .Bottom
        case "fill":
            return .Fill
        default:
            return .Top
        }
    }
    
    static func toKeyboardAppearance(value: String) -> UIKeyboardAppearance {
        switch value {
        case "dark":
            return .Dark
        case "light":
            return .Light
        default:
            return .Default
        }
    }
    
    /**
     Matches the given content against the regular expression pattern, extracting
     any captured groups into an array. Unmatched captured groups are represented
     by an empty string instances in the returned array.
     */
    static func getCapturedStrings(content: String, withPattern pattern: String) -> [String]? {
        
        var regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions(rawValue: 0))
        } catch {
            return nil
        }
        
        guard let result = regex.firstMatchInString(content, options: NSMatchingOptions(rawValue: 0),
                                                    range: NSRange(location: 0, length: content.characters.count))
            else { return nil }
        
        var capturedStrings = [String]()
        
        for i in 0...regex.numberOfCaptureGroups {
            
            let capturedRange = result.rangeAtIndex(i).toRange()
            
            if let capturedRange = capturedRange {
                
                let start = content.startIndex.advancedBy(capturedRange.startIndex)
                let end = content.startIndex.advancedBy(capturedRange.endIndex)
                capturedStrings.append(content.substringWithRange(start..<end))
                
            } else {
                capturedStrings.append("")
            }
        }
        
        return capturedStrings
    }
}
