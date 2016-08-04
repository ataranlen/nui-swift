//
//  UIBarButtonRendererBackgroundImageTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/04/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class UIBarButtonRendererBackgroundImageTests: XCTestCase {
    
    var sut: UIBarButtonItem!
    
    let NUIBarButtonBackgroundImageTestsStyleClass = "BarButtonWithBackgroundImage"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIBarButtonItem()
        sut.title = "button"
        sut.nuiClass = NUIBarButtonBackgroundImageTestsStyleClass
        sut.applyNUI()
    }

    // MARK: - Test Helpers

    func insets(for state: UIControlState) -> UIEdgeInsets? {
        return sut.backgroundImage(for: state, barMetrics: .default)?.capInsets
    }
    
    // MARK: - Background Image Tests
    
    // background-image (Image)
    func testSetBackgroundImage() {
        let image = #imageLiteral(resourceName: "background_image.png")
        let buttonImage = sut.backgroundImage(for: .normal, barMetrics: .default)
        
        XCTAssertTrue(buttonImage!.fb_compare(with: image, tolerance: 0), "NUI should set bar button background image")
    }
    
    // background-image-insets (Box)
    func testSetBackgroundImageInsets() {
        
        let imageInsets = insets(for: .normal)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        XCTAssertEqual(expectedInsets, imageInsets, "NUI should set bar button background image insets")
    }
}
