//
//  NUISegmentedControlRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUISegmentedControlRendererTests: XCTestCase {

    var sut: UISegmentedControl!

    var textAttributes: [AnyHashable : Any]?
    var textAttributesSelected: [AnyHashable : Any]?

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISegmentedControl(items: ["one", "two"])
        sut.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        sut.applyNUI()

        textAttributes = sut.titleTextAttributes(for: .normal)
        textAttributesSelected = sut.titleTextAttributes(for: .selected)
    }

    // MARK: - Tint Color

    // background-tint-color (Color)
    func testSetBackgroundTintColor() {
        XCTAssertEqual(sut.tintColor, .yellow, "NUI should set segmented control background tint color")
    }

    // MARK: - Font Attributes

    // font-color (Color)
    func testSetFontColor() {
        XCTAssertEqual(textAttributes?[NSForegroundColorAttributeName] as? UIColor, .black,
                       "NUI should set segmented control font color")
    }

    // font-color-selected (Color)
    func testSetFontColorSelected() {
        XCTAssertEqual(textAttributesSelected?[NSForegroundColorAttributeName] as? UIColor, .gray,
                              "NUI should set segmented control font color when selected")
    }

    // font-name (FontName)
    func testSetFontName() {
        let font = textAttributes?[NSFontAttributeName] as? UIFont
        XCTAssertEqual(font?.familyName, "Avenir", "NUI should set segmented control font name")
    }

    // font-size (Number)
    func testSetFontSize() {
        let font = textAttributes?[NSFontAttributeName] as? UIFont
        XCTAssertEqual(font?.pointSize, 12, "NUI should set segmented control font size")
    }

    // text-shadow-color (Color)
    func testSetShadowColor() {
        let shadow = textAttributes?[NSShadowAttributeName] as? NSShadow
        XCTAssertEqual(shadow?.shadowColor as? UIColor, .darkGray, "NUI should set segmented control shadow color")
    }

    // text-shadow-color-selected (Color)
    func testSetShadowColorSelected() {
        let shadow = textAttributesSelected?[NSShadowAttributeName] as? NSShadow
        XCTAssertEqual(shadow?.shadowColor as? UIColor, .lightGray,
                       "NUI should set segmented control shadow color when selected")
    }

    // text-shadow-offset (Offset)
    func testSetShadowOffset() {
        let shadow = textAttributes?[NSShadowAttributeName] as? NSShadow
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(shadow?.shadowOffset, offset, "NUI should set segmented control shadow offset")
    }

    // text-shadow-offset-selected (Offset)
    func testSetShadowOffsetSelected() {
        let shadow = textAttributesSelected?[NSShadowAttributeName] as? NSShadow
        let offset = CGSize(width: 2, height: 3)
        XCTAssertEqual(shadow?.shadowOffset, offset, "NUI should set segmented control shadow offset when selected")
    }
}
