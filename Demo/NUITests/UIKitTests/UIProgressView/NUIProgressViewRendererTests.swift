//
//  NUIProgressViewRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIProgressViewRendererTests: XCTestCase {

    var sut: UIProgressView!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIProgressView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        sut.applyNUI()
    }

    // progress-image (Image)
    func testSetProgressImage() {

        sut.nuiClass = "ProgressViewWithImages"
        sut.applyNUI()

        XCTAssertTrue(sut.progressImage!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set progress view progress image")
    }

    // progress-tint-color (Color)
    func testSetProgressTintColor() {
        XCTAssertEqual(sut.progressTintColor, .orange, "NUI should set progress view progress tint color")
    }

    // track-image (Image)
    func testSetTrackImage() {
        sut.nuiClass = "ProgressViewWithImages"
        sut.applyNUI()
        XCTAssertTrue(sut.trackImage!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0),
                      "NUI should set progress view track image")
    }

    // track-tint-color (Color)
    func testSetTrackTintColor() {
        XCTAssertEqual(sut.trackTintColor, .yellow, "NUI should set progress view tint tint color")
    }

    // width (Number)
    func testSetWidth() {
        XCTAssertEqualWithAccuracy(sut.frame.width, 80, accuracy: 0.0001,
                                   "NUI should set progress view width")
    }
}
