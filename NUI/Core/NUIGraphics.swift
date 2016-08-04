//
//  NUIGraphics.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIGraphics: NSObject {
    
    static func backButtonWithClass(_ className: String) -> UIImage {
        
        let borderWidth: CGFloat = 1.0
        var cornerRadius: CGFloat = 7.0
        let width: CGFloat = 50.0
        let height: CGFloat = 32.0
        let dWidth = width - borderWidth - 0.5
        let dHeight = height - borderWidth - 0.5
        let arrowWidth: CGFloat = 14.0
        
        let shape = CAShapeLayer()
        shape.frame = CGRect(x: 0, y: 0, width: width, height: height)
        shape.backgroundColor = UIColor.clear.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.clear.cgColor
        shape.lineWidth = 0
        shape.lineCap = kCALineCapRound
        shape.lineJoin = kCALineJoinRound
        
        if let _backgroundColor = NUISettings.getColor("background-color", withClass: className) {
            shape.fillColor = _backgroundColor.cgColor
        }
        
        if let _backgroundColorTop = NUISettings.getColor("background-color-top", withClass: className) {
            shape.fillColor = _backgroundColorTop.cgColor
        }
        
        if let _borderColor = NUISettings.getColor("border-color", withClass: className) {
            shape.strokeColor = _borderColor.cgColor
        }
        
        if let _borderWidth = NUISettings.getFloat("border-width", withClass: className) {
            shape.lineWidth = CGFloat(_borderWidth)
        }
        
        if let _cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) {
            cornerRadius = CGFloat(_cornerRadius)
        }
        
        let path = CGMutablePath()
        path.moveTo(nil, x: dWidth, y: dHeight - cornerRadius)
        path.addArc(nil, x1: dWidth, y1: dHeight, x2: dWidth - cornerRadius, y2: dHeight, radius: cornerRadius)
        path.addLineTo(nil, x: arrowWidth, y: dHeight)
        path.addLineTo(nil, x: borderWidth + 0.5, y: height / 2)
        path.addLineTo(nil, x: arrowWidth, y: borderWidth + 0.5)
        path.addLineTo(nil, x: dWidth - cornerRadius, y: borderWidth + 0.5)
        path.addArc(nil, x1: dWidth, y1: borderWidth, x2: dWidth, y2: borderWidth + cornerRadius, radius: cornerRadius)
        path.addLineTo(nil, x: dWidth, y: dHeight - cornerRadius)
        
        shape.path = path
        
        let insets = UIEdgeInsets(top: 1, left: arrowWidth + 5, bottom: 1, right: cornerRadius + 5)
        let image = caLayerToUIImage(shape)
        
        return image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    static func roundedRectLayerWithClass(_ className: String, size: CGSize) -> CALayer {
        
        let layer = CALayer()
        layer.frame = CGRect(origin: .zero, size: size)
        layer.masksToBounds = true
        
        if let backgroundColor = NUISettings.getColor("background-color", withClass: className) {
            layer.backgroundColor = backgroundColor.cgColor
        }
        
        if let borderColor = NUISettings.getColor("border-color", withClass: className) {
            layer.borderColor = borderColor.cgColor
        }
        
        if let borderWidth = NUISettings.getFloat("border-width", withClass: className) {
            layer.borderWidth = CGFloat(borderWidth)
        }
        
        if let cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
        
        return layer
    }
    
    static func roundedRectImageWithClass(_ className: String, size: CGSize) -> UIImage? {
        let layer = roundedRectLayerWithClass(className, size: size)
        return roundedRectImageWithClass(className, layer: layer)
    }
    
    static func roundedRectImageWithClass(_ className: String, layer: CALayer) -> UIImage? {
        
        guard let _cornerRadius = NUISettings.getFloat("corner-radius", withClass: className) else { return nil }
        let cornerRadius = CGFloat(_cornerRadius)
        var insetLength = cornerRadius
        
        if cornerRadius < 5 {
            insetLength = 5
        }
        insetLength += 3
        
        let insets = UIEdgeInsets(top: insetLength, left: insetLength, bottom: insetLength, right: insetLength)
        
        let image = caLayerToUIImage(layer)
        
        return image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    static func uiColorToCIColor(_ color: UIColor) -> CIColor {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return CIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func caLayerToUIImage(_ layer: CALayer) -> UIImage {
        
        let screen = UIScreen.main
        let scale = screen.scale
        
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    static func uiImageToCALayer(_ image: UIImage) -> CALayer {
        
        let layer = CALayer()
        let nativeWidth = image.cgImage?.width
        let nativeHeight = image.cgImage?.height
        
        let frame = CGRect(x: 0, y: 0, width: nativeWidth!, height: nativeHeight!)
        layer.contents = image.cgImage
        layer.frame = frame
        
        return layer
    }
    
    static func tintCIImage(_ image: CIImage, withColor color: CIColor) -> CIImage {
        
        let monochromeFilter = CIFilter(name: "CIColorMonochrome")!
        monochromeFilter.setValue(image, forKey: "inputImage")
        monochromeFilter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        monochromeFilter.setValue(1.0, forKey: "inputIntensity")
        
        let compositingFilter = CIFilter(name: "CIMultiplyCompositing")!
        let colorGenerator = CIFilter(name: "CIConstantColorGenerator")!
        colorGenerator.setValue(color, forKey: "inputColor")
        compositingFilter.setValue(colorGenerator.value(forKey: "outputImage"), forKey: "inputImage")
        compositingFilter.setValue(monochromeFilter.value(forKey: "outputImage"), forKey: "inputBackgroundImage")
        
        return compositingFilter.value(forKey: "outputImage")! as! CIImage
    }
    
    static func colorImage(_ color: UIColor, withFrame frame: CGRect) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        color.setFill()
        UIRectFill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    static func gradientLayerWithTop(_ topColor: CGColor, bottom bottomColor: CGColor,
                                     frame: CGRect) -> CAGradientLayer {
        
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.colors = [topColor, bottomColor]
        return layer
    }
    
    static func gradientImageWithTop(_ topColor: CGColor, bottom bottomColor: CGColor, frame: CGRect) -> UIImage {
       
       let layer = gradientLayerWithTop(topColor, bottom: bottomColor, frame: frame)
        
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
