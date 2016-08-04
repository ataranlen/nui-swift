//
//  NUITextFieldRendererTextInputTraitsTests.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 08/04/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import XCTest
@testable import NUIDemo

class NUITextFieldRendererTextInputTraitsTests: XCTestCase {
    
    var sut: UITextField!
    
    override func setUp() {
        super.setUp()
        
        NUISettings.initWithStylesheet("TestTheme.NUI")
        let frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        sut = UITextField(frame: frame)
        sut.applyNUI()
    }
    
    func testSetKeyboardAppearance() {
        XCTAssertEqual(sut.keyboardAppearance, .dark, "NUI should set keyboardAppearance")
    }
    
    func testSetTintColor() {
        XCTAssertEqual(sut.tintColor, .red, "NUI should set textfield tint-color")
    }
}
