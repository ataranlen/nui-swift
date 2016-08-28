//
//  NUISliderRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 29.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUISliderRendererTests: XCTestCase {

    var sut: UISlider!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISlider()
        sut.applyNUI()
    }

    // MARK: - Track Color

    // minimum-track-tint-color (Color)
    func testSetMinimumTrackTintColor() {
        XCTAssertEqual(sut.minimumTrackTintColor, .orange, "NUI should set slider minimum track tint color")
    }

    // maximum-track-tint-color (Color)
    func testSetMaximumTrackTintColor() {
        XCTAssertEqual(sut.maximumTrackTintColor, .red, "NUI should set slider maximum track tint color")
    }

    // MARK: - Images

    // minimum-value-image (Image)
    func testSetMinimumValueImage() {
        XCTAssertTrue(sut.minimumValueImage!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set slider minimum value image")
    }

    // maximum-value-image (Image)
    func testSetMaximumValueImage() {
        XCTAssertTrue(sut.maximumValueImage!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0),
                      "NUI should set slider maximum value image")
    }

    // thumb-image (Image)
    func testSetThumbImage() {
        sut.nuiClass = "SliderWithImage"
        sut.applyNUI()
        XCTAssertTrue(sut.thumbImage(for: .normal)!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set slider thumb image")
    }

    // MARK: - Tint Color

    // thumb-tint-color (Color)
    func testSetThumbTintColor() {
        XCTAssertEqual(sut.thumbTintColor, .blue, "NUI should set slider thumb tint color")
    }
}
