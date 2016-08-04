//
//  UIBarButtonRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/04/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class UIBarButtonRendererTests: XCTestCase {
    
    var sut: UIBarButtonItem!
    var attributes: [String : AnyObject]!
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIBarButtonItem()
        sut.title = "button"
        sut.applyNUI()
        attributes = sut.titleTextAttributes(for: .normal)
    }

    // background-tint-color (Color)
    func testSetTintColor() {
        XCTAssertEqual(sut.tintColor, .orange, "NUI should set bar button tint color")
    }
    
    // MARK: - Fonts
    
    // font-color (Color)
    func testSetFontColor() {
        let fontColor = attributes[NSForegroundColorAttributeName] as! UIColor
        XCTAssertEqual(fontColor, .black, "NUI should set bar button font color")
    }
    
    // font-name (FontName)
    func testSetFontName() {
        let font = attributes[NSFontAttributeName] as! UIFont
        XCTAssertEqual(font.familyName, "Avenir", "NUI should set bar button font name")
    }
    
    // font-size (Number)
    func testSetFontSize() {
        let font = attributes[NSFontAttributeName] as! UIFont
        XCTAssertEqual(font.pointSize, 12, "NUI should set bar button font size")
    }
    
    // text-shadow-color (Color)
    func testSetShadowColor() {
        let shadow = attributes[NSShadowAttributeName] as! NSShadow
        let shadowColor = shadow.shadowColor as! UIColor
        XCTAssertEqual(shadowColor, .darkGray, "NUI should set bar button shadow color")
    }
    
    // text-shadow-offset (Offset)
    func testSetShadowOffset() {
        let shadow = attributes[NSShadowAttributeName] as! NSShadow
        let offset: CGSize = CGSize(width: 1, height: 2)
        XCTAssertEqual(shadow.shadowOffset, offset, "NUI should set bar button shadow offset")
    }
}
