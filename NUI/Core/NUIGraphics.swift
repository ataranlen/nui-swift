//
//  NUIGraphics.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIGraphics: NSObject {
    
    static func backButtonWithClass(className: String) -> UIImage {
        
        let borderWidth: CGFloat = 1.0
        var cornerRadius: CGFloat = 7.0
        let width: CGFloat = 50.0
        let height: CGFloat = 32.0
        let dWidth = width - borderWidth - 0.5
        let dHeight = height - borderWidth - 0.5
        let arrowWidth: CGFloat = 14.0
        
        let shape = CAShapeLayer()
        shape.frame = CGRect(x: 0, y: 0, width: width, height: height)
        shape.backgroundColor = UIColor.clearColor().CGColor
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.clearColor().CGColor
        shape.lineWidth = 0
        shape.lineCap = kCALineCapRound
        shape.lineJoin = kCALineJoinRound
        
        if let _backgroundColor = NUISettings.getColor("background-color", withClass: className) {
            shape.fillColor = _backgroundColor.CGColor
        }
        
        if let _backgroundColorTop = NUISettings.getColor("background-color-top", withClass: className) {
            shape.fillColor = _backgroundColorTop.CGColor
        }
        
        if let _borderColor = NUISettings.getColor("border-color", withClass: className) {
            shape.strokeColor = _borderColor.CGColor
        }
        
        if let _borderWidth = NUISettings.getFloat("border-width", withClass: className) {
            shape.lineWidth = CGFloat(_borderWidth)
        }
        
        if let _cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) {
            cornerRadius = CGFloat(_cornerRadius)
        }
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, dWidth, dHeight - cornerRadius)
        CGPathAddArcToPoint(path, nil, dWidth, dHeight, dWidth - cornerRadius, dHeight, cornerRadius)
        CGPathAddLineToPoint(path, nil, arrowWidth, dHeight)
        CGPathAddLineToPoint(path, nil, borderWidth + 0.5, height / 2)
        CGPathAddLineToPoint(path, nil, arrowWidth, borderWidth + 0.5)
        CGPathAddLineToPoint(path, nil, dWidth - cornerRadius, borderWidth + 0.5)
        CGPathAddArcToPoint(path, nil, dWidth, borderWidth, dWidth, borderWidth + cornerRadius, cornerRadius)
        CGPathAddLineToPoint(path, nil, dWidth, dHeight - cornerRadius)
        
        shape.path = path
        // ???: CFRelease(path)
        
        let insets = UIEdgeInsets(top: 1, left: arrowWidth + 5, bottom: 1, right: cornerRadius + 5)
        let image = caLayerToUIImage(shape)
        
        return image.resizableImageWithCapInsets(insets, resizingMode: .Stretch)
    }
    
    static func roundedRectLayerWithClass(className: String, size: CGSize) -> CALayer {
        
        let layer = CALayer()
        layer.frame = CGRect(origin: CGPointZero, size: size)
        layer.masksToBounds = true
        
        if let backgroundColor = NUISettings.getColor("background-color", withClass: className) {
            layer.backgroundColor = backgroundColor.CGColor
        }
        
        if let borderColor = NUISettings.getColor("border-color", withClass: className) {
            layer.borderColor = borderColor.CGColor
        }
        
        if let borderWidth = NUISettings.getFloat("border-width", withClass: className) {
            layer.borderWidth = CGFloat(borderWidth)
        }
        
        if let cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
        
        return layer
    }
    
    static func roundedRectImageWithClass(className: String, size: CGSize) -> UIImage? {
        let layer = roundedRectLayerWithClass(className, size: size)
        return roundedRectImageWithClass(className, layer: layer)
    }
    
    static func roundedRectImageWithClass(className: String, layer: CALayer) -> UIImage? {
        
        guard let _cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) else { return nil }
        let cornerRadius = CGFloat(_cornerRadius)
        var insetLength = cornerRadius
        
        if cornerRadius < 5 {
            insetLength = 5
        }
        insetLength += 3
        
        let insets = UIEdgeInsets(top: insetLength, left: insetLength, bottom: insetLength, right: insetLength)
        
        let image = caLayerToUIImage(layer)
        
        return image.resizableImageWithCapInsets(insets, resizingMode: .Stretch)
    }
    
    static func uiColorToCIColor(color: UIColor) -> CIColor {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return CIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func caLayerToUIImage(layer: CALayer) -> UIImage {
        
        let screen = UIScreen.mainScreen()
        let scale = screen.scale
        
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func uiImageToCALayer(image: UIImage) -> CALayer {
        
        let layer = CALayer()
        let nativeWidth = CGImageGetWidth(image.CGImage)
        let nativeHeight = CGImageGetHeight(image.CGImage)
        
        let frame = CGRect(x: 0, y: 0, width: nativeWidth, height: nativeHeight)
        layer.contents = image.CGImage
        layer.frame = frame
        
        return layer
    }
    
    static func tintCIImage(image: CIImage, withColor color: CIColor) -> CIImage {
        
        let monochromeFilter = CIFilter(name: "CIColorMonochrome")!
        monochromeFilter.setValue(image, forKey: "inputImage")
        monochromeFilter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        monochromeFilter.setValue(1.0, forKey: "inputIntensity")
        
        let compositingFilter = CIFilter(name: "CIMultiplyCompositing")!
        let colorGenerator = CIFilter(name: "CIConstantColorGenerator")!
        colorGenerator.setValue(color, forKey: "inputColor")
        compositingFilter.setValue(colorGenerator.valueForKey("outputImage"), forKey: "inputImage")
        compositingFilter.setValue(monochromeFilter.valueForKey("outputImage"), forKey: "inputBackgroundImage")
        
        return compositingFilter.valueForKey("outputImage")! as! CIImage
    }
    
    static func colorImage(color: UIColor, withFrame frame: CGRect) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        color.setFill()
        UIRectFill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func gradientLayerWithTop(topColor: CGColor, bottom bottomColor: CGColor,
                                     frame: CGRect) -> CAGradientLayer {
        
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.colors = [topColor, bottomColor]
        return layer
    }
    
    static func gradientImageWithTop(topColor: CGColor, bottom bottomColor: CGColor, frame: CGRect) -> UIImage {
       
       let layer = gradientLayerWithTop(topColor, bottom: bottomColor, frame: frame)
        
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
