//
//  NUIBarButtonSnapshotTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/05/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIBarButtonSnapshotTests: FBSnapshotTestCase {
    
    var sut: UIButton!
    
    let NUIBarButtonGradientTestsStyleClass: String = "BarButtonWithGradientColor"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 26))
        sut.nuiClass = NUIBarButtonGradientTestsStyleClass
        sut.applyNUI()
        
        // Flip this to true to record images in the reference image directory.
        recordMode = false
        
        isDeviceAgnostic = true
    }
    
    // background-color-top/background-color-bottom (Gradient)
    func testButtonWithGradient() {
        FBSnapshotVerifyView(sut, identifier: "")
    }
    
    // border-color (Color)
    // border-width (Number)
    // corner-radius (Number)
    func testButtonWithBorder() {
        sut.nuiClass = "BarButtonWithBorder"
        sut.applyNUI()
        FBSnapshotVerifyView(sut, identifier: "")
    }
}
