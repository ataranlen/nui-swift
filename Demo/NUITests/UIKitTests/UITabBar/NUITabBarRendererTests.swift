//
//  NUITabBarRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 29.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUITabBarRendererTests: XCTestCase {

    var sut: UITabBar!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UITabBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        sut.nuiClass = "TabBar"
        sut.applyNUI()
    }

    // background-color (Color)
    func testSetBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .red, "NUI should set tab bar background color")
    }

    // background-tint-color (Color)
    func testSetBackgroundTintColor() {
        XCTAssertEqual(sut.tintColor, .yellow, "NUI should set tab bar tint color")
    }

    // bar-tint-color (Color)
    func testSetBarTintColor() {
        XCTAssertEqual(sut.barTintColor, .blue, "NUI should set tab bar bar-tint color")
    }
}
