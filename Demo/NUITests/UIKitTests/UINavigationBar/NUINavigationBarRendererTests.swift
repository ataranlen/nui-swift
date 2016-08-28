//
//  NUINavigationBarRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUINavigationBarRendererTests: XCTestCase {

    var sut: UINavigationBar!
    var textAttributes: [String : Any]?

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")

        // Have to set frame to avoid invalid context warnings
        sut = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        sut.applyNUI()
        textAttributes = sut.titleTextAttributes
    }

    // bar-tint-color (Color)
    func testSetBarTintColor() {
        XCTAssertEqual(sut.barTintColor, .orange, "NUI should set navigation bar bar tint color")
    }

    // background-color (Color)
    func testSetBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .yellow, "NUI should set navigation bar background color")
    }

    // background-image (Image)
    func testSetBackgroundImage() {

        sut.nuiClass = "NavigationBarWithBackgroundImage"
        sut.applyNUI()

        let barBackgroundImage = sut.backgroundImage(for: .default)!

        XCTAssertTrue(barBackgroundImage.fb_compare(with: #imageLiteral(resourceName: "background_image"), tolerance: 0),
                      "NUI should set navigation bar background image")
    }

    // background-image-insets (Box)
    func testSetBackgroundImageInsets() {

        sut.nuiClass = "NavigationBarWithBackgroundImage"
        sut.applyNUI()
        let barBackgroundImage = sut.backgroundImage(for: .default)!
        let insets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(barBackgroundImage.capInsets, insets,
                       "NUI should set navigation bar background image insets")
    }

    // background-tint-color (Color)
    func testSetBackgroundTintColor() {
        XCTAssertEqual(sut.tintColor, .red, "NUI should set navigation bar tint color")
    }

    // font-color (Color)
    func testSetFontColor() {
        XCTAssertEqual(textAttributes?[NSForegroundColorAttributeName] as? UIColor, .green,
                       "NUI should set navigation bar font color")
    }

    // font-name (FontName)
    func testSetFontName() {
        let font = textAttributes?[NSFontAttributeName] as? UIFont
        XCTAssertEqual(font?.familyName, "Avenir", "NUI should set navigation bar font name")
    }

    // font-size (Number)
    func testSetFontSize() {
        let font = textAttributes?[NSFontAttributeName] as? UIFont
        XCTAssertEqual(font?.pointSize, 13, "NUI should set navigation bar font size")
    }

    // shadow-image (Image)
    func testSetShadowImage() {
        XCTAssertTrue(sut.shadowImage!.fb_compare(with: #imageLiteral(resourceName: "shadow_image.png"), tolerance: 0),
                      "NUI should set navigation bar shadow image")
    }

    // text-shadow-color (Color)
    func testSetShadowColor() {
        let shadow = textAttributes?[NSShadowAttributeName] as? NSShadow
        XCTAssertEqual(shadow?.shadowColor as? UIColor, .darkGray, "NUI should set navigation bar shadow color")
    }

    // text-shadow-offset (Offset)
    func testSetShadowOffset() {
        let shadow = textAttributes?[NSShadowAttributeName] as? NSShadow
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(shadow?.shadowOffset, offset, "NUI should set navigation bar shadow offset")
    }
    
    // title-vertical-offset (Number)
    func testSetTitleVerticalOffset() {
        XCTAssertEqualWithAccuracy(sut.titleVerticalPositionAdjustment(for: .default), 2, accuracy: 0.0001,
                                   "NUI should set navigation bar title vertical offset")
    }
}
