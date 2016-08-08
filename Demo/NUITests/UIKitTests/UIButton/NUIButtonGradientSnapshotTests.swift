//
//  NUIButtonGradientSnapshotTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIButtonGradientSnapshotTests: FBSnapshotTestCase {
    
    var sut: UIButton!
    
    let NUIButtonGradientTestsStyleClass = "ButtonWithGradientColor"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        sut.nuiClass = NUIButtonGradientTestsStyleClass
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
