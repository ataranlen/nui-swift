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
        sut = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        sut.applyNUI()
    }

    func testSetColor() {
        XCTAssertEqual(sut.color, .red, "NUI should set color activity indicator color")
    }
}
