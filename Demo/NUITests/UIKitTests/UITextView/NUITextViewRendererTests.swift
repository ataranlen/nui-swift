//
//  NUITextViewRendererTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 04.08.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUITextViewRendererTests: XCTestCase {
    
    var sut: UITextView!
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        let frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        sut = UITextView(frame: frame)
        sut.applyNUI()
    }
    
    func testSetKeyboardAppearance() {
        XCTAssertEqual(sut.keyboardAppearance, .dark, "NUI should set keyboardAppearance")
    }
}
