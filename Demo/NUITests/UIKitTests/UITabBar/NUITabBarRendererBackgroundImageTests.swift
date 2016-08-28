//
//  NUITabBarRendererBackgroundImageTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 29.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUITabBarRendererBackgroundImageTests: XCTestCase {

    var sut: UITabBar!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UITabBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        sut.nuiClass = "TabBarWithImages"
        sut.applyNUI()
    }

    // background-image (Image)
    func testSetBackgroundImage() {
        let backgroundImage = sut.backgroundImage
        XCTAssertTrue(backgroundImage!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set tab bar background image")
    }

    // background-image-insets (Box)
    func testSetBackgroundImageInsets() {
        let backgroundImage = sut.backgroundImage
        let insets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(backgroundImage?.capInsets, insets, "NUI should set tab bar background image insets")
    }

    // selected-image (Image)
    func testSetSelectedImage() {
        let selectedImage = sut.selectionIndicatorImage
        XCTAssertTrue(selectedImage!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0), "NUI should set tab bar selected image")
    }
}
