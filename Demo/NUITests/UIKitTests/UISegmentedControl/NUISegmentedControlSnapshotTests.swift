//
//  NUISegmentedControlSnapshotTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUISegmentedControlSnapshotTests: FBSnapshotTestCase {

    var sut: UISegmentedControl!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UISegmentedControl(items: ["one", "two"])
        sut.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        sut.nuiClass = "SegmentedControlColors"
        sut.applyNUI()
        sut.selectedSegmentIndex = 0

        // Flip this to true to record images in the reference image directory.
        recordMode = false

        isDeviceAgnostic = true
    }

    // background-color (Color)
    // background-color-selected (Color)
    // border-color (Color)
    // border-width (Number)
    // corner-radius (Number)
    // divider-color (Color)
    func testSegmentedControlColorsRenderCorrectly() {
        FBSnapshotVerifyView(sut)
    }
}
