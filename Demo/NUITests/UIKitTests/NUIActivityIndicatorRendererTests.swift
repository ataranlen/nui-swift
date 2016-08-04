//
//  NUIActivityIndicatorRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/04/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUIActivityIndicatorRendererTests: XCTestCase {
    
    var sut: UIActivityIndicatorView!
    
    override func setUp() {
        super.setUp()
        NUISettings.initWithStylesheet("TestTheme.NUI")
        self.sut = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        sut.applyNUI()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    // color (Color)
    
    func testSetColor() {
        XCTAssertEqual(sut.color, .red, "NUI should set color activity indicator color")
    }
}
