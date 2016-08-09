//
//  NUIButtonRendererBackgroundImageTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIButtonRendererBackgroundImageTests: XCTestCase {
    
    var sut: UIButton!
    
    let NUIButtonBackgroundImageTestsStyleClass = "ButtonWithBackgroundImage"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton()
        sut.nuiClass = NUIButtonBackgroundImageTestsStyleClass
        sut.setTitle("button", for: .normal)
        sut.applyNUI()
    }

    // MARK: - Background Image
    
    func equalImages(with state: UIControlState) -> Bool {
        let image = #imageLiteral(resourceName: "background_image.png")
        let buttonImage = sut.backgroundImage(for: state)
        return buttonImage?.fb_compare(with: image, tolerance: 0) ?? false
    }
    
    func insets(for state: UIControlState) -> UIEdgeInsets? {
        let buttonImage = sut.backgroundImage(for: state)
        return buttonImage?.capInsets
    }
    
    // background-image (Image)
    func testSetBackgroundImage() {
        XCTAssertTrue(equalImages(with: .normal), "NUI should set button background image")
    }
    
    // background-image-insets (Box)
    func testSetBackgroundImageInsets() {
        let imageInsets = insets(for: .normal)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button background image insets")
    }
    
    // background-image-disabled (Image)

    func testSetBackgroundImageDisabled() {
        XCTAssertTrue(equalImages(with: .disabled), "NUI should set button background image for disabled state")
    }
    
    // background-image-disabled-insets (Box)
    func testSetBackgroundImageInsetsDisabled() {
        let imageInsets = insets(for: .disabled)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button background image insets for disabled state")
    }
    
    // background-image-highlighted (Image)
    func testSetBackgroundImageHighlighted() {
        XCTAssertTrue(equalImages(with: .highlighted), "NUI should set button background image for highlighted state")
    }
    
    // background-image-highlighted-insets (Box)
    func testSetBackgroundImageInsetsHighlighted() {
        let imageInsets = insets(for: .highlighted)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button background image insets for highlighted state")
    }
    
    // background-image-selected (Image)
    func testSetBackgroundImageSelected() {
        XCTAssertTrue(equalImages(with: .selected), "NUI should set button background image for selected state")
    }
    
    // background-image-selected-insets (Box)
    func testSetBackgroundImageInsetsSelected() {
        let imageInsets = insets(for: .selected)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button background image insets for selected state")
    }
    
    // background-image-selected-disabled (Image)
    func testSetBackgroundImageSelectedDisabled() {
        XCTAssertTrue(equalImages(with: [.selected, .disabled]),
                      "NUI should set button background image when selected and disabled")
    }
    
    // background-image-selected-disabled-insets (Box)
    func testSetBackgroundImageInsetsSelectedDisabled() {
        let imageInsets = insets(for: [.selected, .disabled])
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button background image insets when selected and disabled")
    }
    
    // background-image-selected-highlighted (Image)
    func testSetBackgroundImageSelectedHighlighted() {
        XCTAssertTrue(equalImages(with: [.selected, .highlighted]),
                      "NUI should set button background image when selected and highlighted")
    }
    
    // background-image-selected-highlighted-insets (Box)
    func testSetBackgroundImageInsetsSelectedHighlighted() {
        let imageInsets = insets(for: [.selected, .highlighted])
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets,
                       "NUI should set button background image insets when selected and highlighted")
    }
}
