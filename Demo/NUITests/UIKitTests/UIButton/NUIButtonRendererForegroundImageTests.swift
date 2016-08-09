//
//  NUIButtonRendererForegroundImageTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIButtonRendererForegroundImageTests: XCTestCase {
    
    var sut: UIButton!
    
    let NUIButtonForegroundImageTestsStyleClass = "ButtonWithImage"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton()
        sut.nuiClass = NUIButtonForegroundImageTestsStyleClass
        sut.applyNUI()
    }

    // MARK: - Test Helpers
    
    func equalImages(with state: UIControlState) -> Bool {
        let image = #imageLiteral(resourceName: "foreground_image.png")
        let buttonImage = sut.image(for: state)
        return buttonImage?.fb_compare(with: image, tolerance: 0) ?? false
    }
    
    func insets(for state: UIControlState) -> UIEdgeInsets? {
        let buttonImage = sut.image(for: state)
        return buttonImage?.capInsets
    }
    
    // MARK: - Image
    
    // image (Image)
    func testSetImage() {
        XCTAssertTrue(equalImages(with: .normal), "NUI should set button image")
    }
    
    // image-insets (Box)
    func testSetImageInsets() {
        let imageInsets = insets(for: .normal)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets")
    }
    
    // -image-disabled (Image)
    func testSetImageDisabled() {
        XCTAssertTrue(equalImages(with: .disabled), "NUI should set button image for disabled state")
    }
    
    // -image-disabled-insets (Box)
    func testSetImageInsetsDisabled() {
        let imageInsets = insets(for: .disabled)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets for disabled state")
    }
    
    // -image-highlighted (Image)
    func testSetImageHighlighted() {
        XCTAssertTrue(equalImages(with: .highlighted), "NUI should set button image for highlighted state")
    }
    
    // -image-highlighted-insets (Box)
    func testSetImageInsetsHighlighted() {
        let imageInsets = insets(for: .highlighted)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets for highlighted state")
    }
    
    // -image-selected (Image)
    func testSetImageSelected() {
        XCTAssertTrue(equalImages(with: .selected), "NUI should set button image for selected state")
    }
    
    // -image-selected-insets (Box)
    func testSetImageInsetsSelected() {
        let imageInsets = insets(for: .selected)
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets for selected state")
    }
    
    // -image-selected-disabled (Image)
    func testSetImageSelectedDisabled() {
        XCTAssertTrue(equalImages(with: [.selected, .disabled]), "NUI should set button image when selected and disabled")
    }
    
    // -image-selected-disabled-insets (Box)
    func testSetImageInsetsSelectedDisabled() {
        let imageInsets = insets(for: [.selected, .disabled])
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets when selected and disabled")
    }
    
    // -image-selected-highlighted (Image)
    func testSetImageSelectedHighlighted() {
        XCTAssertTrue(equalImages(with: [.selected, .highlighted]), "NUI should set button image when selected and highlighted")
    }
    
    // -image-selected-highlighted-insets (Box)
    func testSetImageInsetsSelectedHighlighted() {
        let imageInsets = insets(for: [.selected, .highlighted])
        let expectedInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        XCTAssertEqual(imageInsets, expectedInsets, "NUI should set button image insets when selected and highlighted")
    }
}
