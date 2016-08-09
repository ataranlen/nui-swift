//
//  NUIButtonRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUIButtonRendererTests: XCTestCase {
    
    var sut: UIButton!
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton()
        sut.setTitle("button", for: .normal)
        sut.applyNUI()
    }
    
    // MARK: - Borders
    
    // border-color (Color)
    func testBorderColor() {
        let layerColor: UIColor? = sut.layer.borderColor != nil ? UIColor(cgColor: sut.layer.borderColor!) : nil
        XCTAssertEqual(layerColor, .orange, "NUI should set button border color")
    }
    
    // border-width (Number)
    func testSetBorderWidth() {
        XCTAssertEqual(sut.layer.borderWidth, 2, "NUI should set button border width")
    }
    
    // content-insets (Box)
    func testSetContentInsets() {
        let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        XCTAssertEqual(sut.contentEdgeInsets, insets, "NUI should set button content insets")
    }
    
    // corner-radius (Number)
    func testSetCornerRadius() {
        XCTAssertEqual(sut.layer.cornerRadius, 4, "NUI should set button corner radius")
    }
    
    // MARK: - Fonts
    
    // font-color (Color)
    func testFontColor() {
        XCTAssertEqual(sut.titleColor(for: .normal), .black, "NUI should set button font color")
    }
    
    // font-color-disabled (Color)
    func testFontColorDisabled() {
        XCTAssertEqual(sut.titleColor(for: .disabled), .gray, "NUI should set button font color disabled")
    }
    
    // font-color-highlighted (Color)
    func testFontColorHighlighted() {
        XCTAssertEqual(sut.titleColor(for: .highlighted), .lightGray,
                       "NUI should set button font color highlighted")
    }
    
    // font-color-selected (Color)
    func testFontColorSelected() {
        XCTAssertEqual(sut.titleColor(for: .selected), .darkGray,
                       "NUI should set button font color selected")
    }
    
    // font-color-selected-disabled (Color)
    func testFontColorSelectedDisabled() {
        XCTAssertEqual(sut.titleColor(for: [.selected, .disabled]), .red,
                       "NUI should set button font color whtn selected and disabled")
    }
    
    // font-color-selected-highlighted (Color)
    func testFontColorSelectedHighlighted() {
        XCTAssertEqual(sut.titleColor(for: [.selected, .highlighted]), .green,
                       "NUI should set button font color when selected and highlighted")
    }
    
    // font-name (FontName)
    func testSetFontName() {
        let font = sut.titleLabel?.font
        XCTAssertEqual(font?.familyName, "Avenir", "NUI should set button font name")
    }
    
    // font-size (Number)
    func testSetFontSize() {
        let font = sut.titleLabel?.font
        XCTAssertEqual(font?.pointSize, 16, "NUI should set button font size")
    }
    
    // MARK: - Padding
    
    // padding (Box)
    func testSetPadding() {
        let insets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        XCTAssertEqual(sut.titleEdgeInsets, insets, "NUI should set button padding")
    }
    
    // MARK: - Shadows
    
    // shadow-color (Color)
    func testShadowColor() {
        let layerColor: UIColor? = sut.layer.shadowColor != nil ? UIColor(cgColor: sut.layer.shadowColor!) : nil
        XCTAssertEqual(layerColor, .black, "NUI should set button shadow color")
    }
    
    // shadow-offset (Offset)
    func testShadowOffset() {
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(sut.layer.shadowOffset, offset, "NUI should set button shadow offset")
    }
    
    // shadow-opacity (Number)
    func testShadowOpacity() {
        XCTAssertEqual(sut.layer.shadowOpacity, 0.5, "NUI should set button shadow opacity")
    }
    
    // shadow-radius (Number)
    func testShadowRadius() {
        XCTAssertEqual(sut.layer.shadowRadius, 4, "NUI should set button shadow radius")
    }
    
    // MARK: - Text
    
    // text-align (TextAlign)
    func testTextAlign() {
        XCTAssertEqual(sut.contentHorizontalAlignment, .left, "NUI should set button text-align")
    }
    
    // text-alpha (Number)
    func testTextAlpha() {
        XCTAssertEqualWithAccuracy(sut.titleLabel!.alpha, 0.8, accuracy: 0.0001,
                                   "NUI should set button text alpha")
    }
    
    // text-auto-fit (Boolean)
    func testTextAutoFit() {
        XCTAssertTrue(sut.titleLabel!.adjustsFontSizeToFitWidth, "NUI should set button text auto fit")
    }
    
    // text-shadow-color (Color)
    func testTextShadowColor() {
        XCTAssertEqual(sut.titleLabel?.shadowColor, .black, "NUI should set button text shadow color")
    }
    
    // text-shadow-color-disabled (Color)
    func testTextShadowColorDisabled() {
        XCTAssertEqual(sut.titleShadowColor(for: .disabled), .gray,
                       "NUI should set button text shadow disabled color")
    }
    
    // text-shadow-color-highlighted (Color)
    func testTextShadowColorHighlighted() {
        XCTAssertEqual(sut.titleShadowColor(for: .highlighted), .lightGray,
                       "NUI should set button text shadow highlighted color")
    }
    
    // text-shadow-color-selected (Color)
    func testTextShadowColorSelected() {
        XCTAssertEqual(sut.titleShadowColor(for: .selected), .darkGray,
                       "NUI should set button text shadow selected color")
    }
    
    // text-shadow-color-selected-disabled (Color)
    func testTextShadowColorSelectedDisabled() {
        XCTAssertEqual(sut.titleShadowColor(for: [.selected, .disabled]), .green,
                       "NUI should set button text shadow selected and disabled color")
    }
    
    // text-shadow-color-selected-highlighted (Color)
    func testTextShadowColorSelectedHighlighted() {
        XCTAssertEqual(sut.titleShadowColor(for: [.selected, .highlighted]), .red,
                       "NUI should set button text shadow selected and highlighted color")
    }
    
    // text-shadow-offset (Offset)
    func testTextShadowOffset() {
        let offset = CGSize(width: 2, height: 1)
        XCTAssertEqual(sut.titleLabel?.shadowOffset, offset, "NUI should set button text shadow offset")
    }
    
    // text-transform (TextTransform)
    func testTextTransform() {
        let labelText = sut.titleLabel?.text
        XCTAssertEqual(labelText, "BUTTON", "NUI should set button text transform")
    }
    
    // title-insets (Box)
    func testSetTitleEdgeInsets() {
        let insets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        XCTAssertEqual(sut.titleEdgeInsets, insets, "NUI should set button title insets")
    }
    
    // MARK: - Size
    
    // height (Number)
    func testSetHeight() {
        let height = sut.frame.height
        XCTAssertEqual(height, 37, "NUI should set button height")
    }
    
    // width (Number)
    func testSetWidth() {
        let width = sut.frame.width
        XCTAssertEqual(width, 80, "NUI should set button width")
    }
}
