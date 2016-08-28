//
//  NUILabelRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUILabelRendererTests: XCTestCase {

    var sut: UILabel!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UILabel(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        sut.text = "label"
        sut.applyNUI()
    }

    // background-color (Color)
    func testSetBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .red, "NUI should set label background color")
    }

    // border-color (Color)
    func testSetBorderColor() {
        let borderColor = UIColor(cgColor: sut.layer.borderColor!)
        XCTAssertEqual(borderColor, .green, "NUI should set label border color")
    }

    // border-width (Number)
    func testSetBorderWidth() {
        XCTAssertEqual(sut.layer.borderWidth, 2, "NUI should set label border width")
    }

    // corner-radius (Number)
    func testSetCornerRadius() {
        XCTAssertEqual(sut.layer.cornerRadius, 2, "NUI should set label border width")
    }

    // font-color (Color)
    func testSetFontColor() {
        XCTAssertEqual(sut.textColor,.blue, "NUI should set label font color")
    }

    // font-color-highlighted (Color)
    func testSetFontColorHighlighted() {
        XCTAssertEqual(sut.highlightedTextColor, .yellow, "NUI should set label font color when highlighted")
    }

    // font-name (FontName)
    func testSetFontName() {
        XCTAssertEqual(sut.font.familyName, "Avenir", "NUI should set label font name")
    }

    // font-size (Number)
    func testSetFontSize() {
        XCTAssertEqual(sut.font.pointSize, 15, "NUI should set label font size")
    }

    // height (Number)
    func testSetHeight() {
        XCTAssertEqual(sut.frame.height, 50, "NUI should set label height")
    }

    // shadow-color (Color)
    func testSetShadowColor() {
        let shadowColor = UIColor(cgColor: sut.layer.shadowColor!)
        XCTAssertEqual(shadowColor, .black, "NUI should set label shadow color")
    }

    // shadow-offset (Offset)
    func testSetShadowOffset() {
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(sut.layer.shadowOffset, offset, "NUI should set label shadow offset")
    }

    // shadow-opacity (Number)
    func testSetShadowOpacity() {
        XCTAssertEqualWithAccuracy(sut.layer.shadowOpacity, 0.5, accuracy: 0.0001, "NUI should set label shadow opacity")
    }

    // shadow-radius (Number)
    func testSetShadowRadius() {
        XCTAssertEqualWithAccuracy(sut.layer.shadowRadius, 2.0, accuracy: 0.0001, "NUI should set label shadow radius")
    }

    // text-align (TextAlign)
    func testSetTextAlign() {
        XCTAssertEqual(sut.textAlignment, .center, "NUI should set label text align")
    }

    // text-alpha (Number)
    func testSetTextAlpha() {
        XCTAssertEqualWithAccuracy(sut.alpha, 0.9, accuracy: 0.0001, "NUI should set label alpha")
    }

    // text-auto-fit (Boolean)
    func testSetTextAutoFit() {
        XCTAssertTrue(sut.adjustsFontSizeToFitWidth, "NUI should set label text auto fit")
    }

    // text-shadow-color (Color)
    func testTextShadowColor() {
        XCTAssertEqual(sut.shadowColor, .black, "NUI should set label text shadow color")
    }

    // text-shadow-offset (Offset)
    func testTextShadowOffset() {
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(sut.shadowOffset, offset, "NUI should set label text shadow offset")
    }

    // text-transform (TextTransform)
    func testTextTransform() {
        XCTAssertEqual(sut.text, "LABEL", "NUI should set label text transform")
    }

    // width (Number)
    func testSetWidth() {
        XCTAssertEqual(sut.frame.width, 100, "NUI should set label width")
    }

    // text-line-clamp (Integer)
    func testTextLineClamp() {
        XCTAssertEqual(sut.numberOfLines, 6, "NUI should set label numberOfLines")
    }
}
