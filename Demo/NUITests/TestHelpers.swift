//
//  TestHelpers.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 04.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

extension UIImage {

    /// Creates a 1x1 context, draws the image then returns a UIColor from the remaining pixel
    var uiColor: UIColor? {

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 4)
        defer {
            buffer.deinitialize(count: 4)
            buffer.deallocate(capacity: 4)
        }
        let bitmapInfo = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue

        guard let context = CGContext(data: buffer,
                                      width: 1, height: 1,
                                      bitsPerComponent: 8,
                                      bytesPerRow: 4,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo),
            let cgImage = cgImage else { return nil }

        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: 1, height: 1))

        let r = CGFloat(buffer[0]) / 255.0
        let g = CGFloat(buffer[1]) / 255.0
        let b = CGFloat(buffer[2]) / 255.0
        let a = CGFloat(buffer[3]) / 255.0

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
