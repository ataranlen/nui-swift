//
//  NUIControlRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/28/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIControlRendererTests: FBSnapshotTestCase {

    var sut: UIControl!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIControl(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sut.applyNUI()

        // Flip this to true to record images in the reference image directory.
        recordMode = false

        isDeviceAgnostic = true
    }

    // background-color (Color)
    func testSetBackgroundColor() {

        let color = UIColor.green

        XCTAssertEqual(sut.backgroundColor, color, "NUI should set control background color")
    }

    // background-image (Image)
    func testSetBackgroundImage() {

        sut.nuiClass = "ControlWithBackgroundImage"
        sut.applyNUI()

        FBSnapshotVerifyView(sut)
    }

    // border-color (Color)
    func testSetBorderColor() {
        let borderColor = UIColor(cgColor: sut.layer.borderColor!)
        XCTAssertEqual(borderColor, .red, "NUI should set control border color")
    }

    // border-width (Number)
    func testSetBorderWidth() {
        XCTAssertEqual(sut.layer.borderWidth, 2, "NUI should set control border width")
    }

    // corner-radius (Number)
    func testSetCornerRadius() {
        XCTAssertEqual(sut.layer.cornerRadius, 2, "NUI should set control corner radius")
    }

    // shadow-color (Color)
    func testSetShadowColor() {
        let shadowColor = UIColor(cgColor: sut.layer.shadowColor!)
        XCTAssertEqual(shadowColor, .black, "NUI should set control shadow color")
    }

    // shadow-offset (Offset)
    func testSetShadowOffset() {
        let offset = CGSize(width: 1, height: 2)
        XCTAssertEqual(sut.layer.shadowOffset, offset, "NUI should set control shadow offset")
    }

    // shadow-opacity (Number)
    func testSetShadowOpacity() {
        XCTAssertEqualWithAccuracy(sut.layer.shadowOpacity, 0.5, accuracy: 0.0001, "NUI should set control shadow opacity")
    }

    // shadow-radius (Number)
    func testSetShadowRadius() {
        XCTAssertEqual(sut.layer.shadowRadius, 2, "NUI should set control shadow radius")
    }
}
