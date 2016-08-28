//
//  NUISearchBarRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUISearchBarRendererTests: XCTestCase {

    var sut: UISearchBar!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISearchBar()
        sut.applyNUI()
    }

    // background-color (Color)
    func testSetBackgroundColor() {
        XCTAssertEqual(sut.backgroundColor, .red, "NUI should set search bar background color")
    }

    // background-image (Image)
    func testSetBackgroundImage() {
        sut.nuiClass = "SearchBarWithImages"
        sut.applyNUI()
        XCTAssertTrue(sut.backgroundImage!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set search bar background image")
    }

    // background-tint-color (Color)
    func testSetBackgroundTintColor() {
        XCTAssertEqual(sut.tintColor, .orange, "NUI should set search bar background tint color")
    }

    // scope-background-color (Color)
    func testSetScopeBackgroundColor() {
        XCTAssertEqual(sut.scopeBarBackgroundImage?.uiColor, .blue,
                       "NUI should set search bar scope background color")
    }

    // scope-background-image (Image)
    func testSetScopeBackgroundImage() {
        sut.nuiClass = "SearchBarWithImages"
        sut.applyNUI()
        XCTAssertTrue(sut.scopeBarBackgroundImage!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0),
                      "NUI should set search bar scope background image")
    }
}
