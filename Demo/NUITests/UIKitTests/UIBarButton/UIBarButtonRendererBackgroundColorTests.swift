//
//  UIBarButtonRendererBackgroundColorTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/04/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class UIBarButtonRendererBackgroundColorTests: XCTestCase {
    
    var sut: UIBarButtonItem!
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        sut = UIBarButtonItem()
        sut.title = "button"
        sut.nuiClass = "BarButtonWithBackgroundColor"
        sut.applyNUI()
    }

    // MARK: Test Helpers
    func backgroundImage(for state: UIControlState) -> UIImage? {
        return sut.backgroundImage(for: state, barMetrics: .default)
    }
    
    // background-color (Color)
    func testSetBackgroundColor() {
        
        let backgroundImage = self.backgroundImage(for: .normal)!
        XCTAssertEqual(backgroundImage.uiColor, .green, "NUI should set button background color")
    }
    
    // background-color-highlighted (Color)
    func testSetBackgroundColorHighlighted() {
        
        let backgroundImage = self.backgroundImage(for: .highlighted)!
        XCTAssertEqual(backgroundImage.uiColor, .yellow, "NUI should set button background color for highlighted state")
    }
}
