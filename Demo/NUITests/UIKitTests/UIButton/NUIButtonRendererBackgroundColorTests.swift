//
//  NUIButtonRendererBackgroundColorTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUIButtonRendererBackgroundColorTests: XCTestCase {
    
    var sut: UIButton!
    
    let NUIButtonBackgroundColorTestsStyleClass = "ButtonWithColor"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton()
        sut.nuiClass = NUIButtonBackgroundColorTestsStyleClass
        sut.applyNUI()
    }
    
    func backgroundColor(for state: UIControlState) -> UIColor? {
        let backgroundImage = sut.backgroundImage(for: state)
        return backgroundImage?.uiColor
    }
    
    // MARK: - Background Color
    
    // background-color (Color)
    func testBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .yellow, "NUI should set button background color (regardless of state)")
    }
    
    // background-color-normal (Color)
    func testBackgroundColorNormal() {
        XCTAssertEqual(backgroundColor(for: .normal), .red, "NUI should set button background color for normal state")
    }
    
    // background-color-disabled (Color)
    func testBackgroundColorDisabled() {
        XCTAssertEqual(backgroundColor(for: .disabled), .green, "NUI should set button background color for disabled state")
    }
    
    // background-color-highlighted (Color)
    func testBackgroundColorHighlighted() {
        XCTAssertEqual(backgroundColor(for: .highlighted), .green,
                       "NUI should set button background color for highlighted state")
    }
    
    // background-color-selected (Color)
    func testBackgroundColorSelected() {
        XCTAssertEqual(backgroundColor(for: .selected), .green, "NUI should set button background color for selected state")
    }
    
    // background-color-selected-disabled (Color)
    func testBackgroundColorSelectedDisabled() {
        XCTAssertEqual(backgroundColor(for: [.selected, .disabled]), .blue,
                       "NUI should set button background color when selected and disabled")
    }
    
    // background-color-selected-highlighted (Color)
    func testBackgroundColorSelectedHighlighted() {
        XCTAssertEqual(backgroundColor(for: [.selected, .highlighted]), .blue,
                       "NUI should set button background color when selected and highlighted")
    }
    
    //    #if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 80200
    
    // font-name (FontName)
    func testSetFontName() {
        
        let expectedFontName: String
        
        if #available(iOS 9, *) {
            expectedFontName = ".SFUIText-Light"
        } else {
            expectedFontName = ".HelveticaNeueInterface-UltraLightP2"
        }

        XCTAssertEqual(sut.titleLabel?.font.fontName, expectedFontName, "NUI should set button font name")
    }
    
    // font-size (Number)
    func testSetFontSize() {
        XCTAssertEqual(sut.titleLabel?.font.pointSize, 13, "NUI should set button font size")
    }
}
