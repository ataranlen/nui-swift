//
//  NUINavigationBarRendererGradientTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 28.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUINavigationBarRendererGradientTests: FBSnapshotTestCase {

    var sut: UINavigationBar!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 20, height: 44))
        sut.nuiClass = "NavigationBarWithGradient"
        sut.applyNUI()

        // Flip this to true to record images in the reference image directory.
        recordMode = false

        isDeviceAgnostic = true
    }

    // MARK: - Button Gradients

    // background-color-top/background-color-bottom (Gradient)
    func testButtonWithGradient() {
        FBSnapshotVerifyView(sut)
    }
}
