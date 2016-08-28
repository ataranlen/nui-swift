//
//  NUISegmentedControlRendererBackgroundImagesTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUISegmentedControlRendererBackgroundImagesTests: XCTestCase {

    var sut: UISegmentedControl!
    var textAttributes: [AnyHashable : Any]?

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISegmentedControl(items: ["one", "two"])
        sut.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        sut.nuiClass = "SegmentedControlWithImages"
        sut.applyNUI()
        textAttributes = sut.titleTextAttributes(for: .normal)
    }

    // MARK: - Background Images
    
    // background-image (Image)
    func testSetBackgroundImage() {
        sut.nuiClass = "SegmentedControlWithImages"
        sut.applyNUI()
        let backgroundImage = sut.backgroundImage(for: .normal, barMetrics: .default)
        XCTAssertTrue(backgroundImage!.fb_compare(with: #imageLiteral(resourceName: "background_image.png"), tolerance: 0),
                      "NUI should set segmented control background image")
    }

    // background-image-insets (Box)
    func testSetBackgroundImageInsets() {
        let backgroundImage = sut.backgroundImage(for: .normal, barMetrics: .default)
        let insets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(backgroundImage?.capInsets, insets,
                       "NUI should set segmented control background image insets")
    }

    // background-image-selected (Image)
    func testSetBackgroundImageSelected() {
        sut.nuiClass = "SegmentedControlWithImages"
        sut.applyNUI()
        let backgroundImage = sut.backgroundImage(for: .selected, barMetrics: .default)
        XCTAssertTrue(backgroundImage!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0),
                      "NUI should set segmented control background image when selected")
    }

    // background-image-selected-insets (Box)
    func testSetBackgroundImageInsetsSelected() {
        let backgroundImage = sut.backgroundImage(for: .selected, barMetrics: .default)
        let insets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(backgroundImage?.capInsets, insets,
                       "NUI should set segmented control background image insets when selected")
    }

    // divider-image (Image)
    func testSetDividerImage() {
        let divider = sut.dividerImage(forLeftSegmentState: .normal,
                                       rightSegmentState: .normal,
                                       barMetrics: .default)
        XCTAssertTrue(divider!.fb_compare(with: #imageLiteral(resourceName: "foreground_image.png"), tolerance: 0), "NUI should set segmented control divider image")
    }
}
