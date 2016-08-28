//
//  NUITabBarRendererGradientTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 29.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUITabBarRendererGradientTests: FBSnapshotTestCase {

    var sut: UITabBar!

    override func setUp() {
        super.setUp()

        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UITabBar(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        sut.nuiClass = "TabBarWithGradient"
        sut!.applyNUI()

        // Flip this to true to record images in the reference image directory.
        recordMode = false

        isDeviceAgnostic = true
    }

    // MARK: - Button Gradients

    // background-color-top/background-color-bottom (Gradient)
    func testTabBarWithGradient() {
        FBSnapshotVerifyView(sut)
    }
}
