//
//  NUIButtonRendererSubdirectoryImageTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/09/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import NUIDemo

class NUIButtonRendererSubdirectoryImageTests: XCTestCase {
    
    var sut: UIButton!
    
    let NUIButtonSubdirectoryImageTestsStyleClass = "ButtonWithImageFromSubdirectory"
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIButton()
        sut.nuiClass = NUIButtonSubdirectoryImageTestsStyleClass
        sut.setTitle("button", for: .normal)
        sut.applyNUI()
    }
    
    // MARK: - Background Image
    
    func equalBackgroundImages(with state: UIControlState) -> Bool {
        let image = #imageLiteral(resourceName: "Assets/subdirectory_image.png")
        let buttonImage = sut.backgroundImage(for: state)
        return buttonImage?.fb_compare(with: image, tolerance: 0) ?? false
    }
    
    func equalForegroundImages(with state: UIControlState) -> Bool {
        let image = #imageLiteral(resourceName: "Assets/subdirectory_image.png")
        let buttonImage = sut.image(for: state)
        return buttonImage?.fb_compare(with: image, tolerance: 0) ?? false
    }
    
    // background-image (Image)
    func testSetBackgroundImage() {
        XCTAssertTrue(equalBackgroundImages(with: .normal), "NUI should set button background image")
    }
    
    // background-image-disabled (Image)
    func testSetBackgroundImageDisabled() {
        XCTAssertTrue(equalBackgroundImages(with: .disabled), "NUI should set button background image for disabled state")
    }
    
    // background-image-highlighted (Image)
    func testSetBackgroundImageHighlighted() {
        XCTAssertTrue(equalBackgroundImages(with: .highlighted), "NUI should set button background image for highlighted state")
    }
    
    // background-image-selected (Image)
    func testSetBackgroundImageSelected() {
        XCTAssertTrue(equalBackgroundImages(with: .selected), "NUI should set button background image for selected state")
    }
    
    // background-image-selected-disabled (Image)
    func testSetBackgroundImageSelectedDisabled() {
        XCTAssertTrue(equalBackgroundImages(with: [.selected, .disabled]),
                      "NUI should set button background image when selected and disabled")
    }
    
    // background-image-selected-highlighted (Image)
    func testSetBackgroundImageSelectedHighlighted() {
        XCTAssertTrue(equalBackgroundImages(with: [.selected, .highlighted]),
                      "NUI should set button background image when selected and highlighted")
    }
    
    // MARK: - Foreground Image
    
    // image (Image)
    func testSetImage() {
        XCTAssertTrue(equalForegroundImages(with: .normal), "NUI should set button image")
    }
    
    // -image-disabled (Image)
    func testSetImageDisabled() {
        XCTAssertTrue(equalForegroundImages(with: .disabled), "NUI should set button image for disabled state")
    }
    
    // -image-highlighted (Image)
    func testSetImageHighlighted() {
        XCTAssertTrue(equalForegroundImages(with: .highlighted), "NUI should set button image for highlighted state")
    }
    
    // -image-selected (Image)
    func testSetImageSelected() {
        XCTAssertTrue(equalForegroundImages(with: .selected), "NUI should set button image for selected state")
    }
    
    // -image-selected-disabled (Image)
    func testSetImageSelectedDisabled() {
        XCTAssertTrue(equalForegroundImages(with: [.selected, .disabled]),
                      "NUI should set button image when selected and disabled")
    }
    
    // -image-selected-highlighted (Image)
    func testSetImageSelectedHighlighted() {
        XCTAssertTrue(equalForegroundImages(with: [.selected, .highlighted]),
                      "NUI should set button image when selected and highlighted")
    }
}
