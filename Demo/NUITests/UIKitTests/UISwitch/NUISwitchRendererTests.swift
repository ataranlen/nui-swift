//
//  NUISwitchRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 29.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUISwitchRendererTests: XCTestCase {

    var sut: UISwitch!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISwitch()
        sut.applyNUI()
    }

    // MARK: - Background Color

    // background-color (Color)
    func testSetBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .orange, "NUI should set switch background color")
    }

    // MARK: - Tint Color

    // on-tint-color (Color)
    func testSetOnTintColor() {
        XCTAssertEqual(sut.onTintColor, .red, "NUI should set switch on tint color")
    }

    // thumb-tint-color (Color)
    func testSetThumbTintColor() {
        XCTAssertEqual(sut.thumbTintColor, .yellow, "NUI should set switch thumb tint color")
    }

    // tint-color (Color)
    func testSetTintColor() {
        XCTAssertEqual(sut.tintColor, .green, "NUI should set switch thumb tint color")
    }
}
