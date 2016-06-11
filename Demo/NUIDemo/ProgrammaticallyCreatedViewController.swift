//
//  ProgrammaticallyCreatedViewController.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/10/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class ProgrammaticallyCreatedViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programmaticallyRenderControls()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func programmaticallyRenderControls() {

        let largeButton = UIButton(type: .System)
        largeButton.setTitle("Large Button", forState: .Normal)
        largeButton.nuiClass = "Button:LargeButton"
        largeButton.frame = CGRect(x: 20, y: 75, width: 133, height: 50)
        view.addSubview(largeButton)
        
        let button = UIButton(type: .System)
        button.setTitle("Button", forState: .Normal)
        button.frame = CGRect(x: 20, y: 144, width: 74, height: 37)
        view.addSubview(button)
        
        let smallButton = UIButton(type: .System)
        smallButton.setTitle("Small", forState: .Normal)
        smallButton.nuiClass = "Button:SmallButton"
        smallButton.frame = CGRect(x: 20, y: 200, width: 57, height: 27)
        view.addSubview(smallButton)
        
        let largeLabel = UILabel(frame: CGRect(x: 167, y: 75, width: 133, height: 40))
        largeLabel.text = "Large Label"
        largeLabel.nuiClass = "Label:LargeLabel"
        view.addSubview(largeLabel)

        let label = UILabel(frame: CGRect(x: 110, y: 147, width: 62, height: 32))
        label.text = "Label"
        view.addSubview(label)

        let smallLabel = UILabel(frame: CGRect(x: 92, y: 201, width: 52, height: 21))
        smallLabel.text = "Small"
        smallLabel.nuiClass = "Label:SmallLabel"
        view.addSubview(smallLabel)

        let largeTextField = UITextField(frame: CGRect(x: 20, y: 244, width: 159, height: 31))
        largeTextField.placeholder = "Large Field"
        largeTextField.nuiClass = "TextField:LargeTextField"
        largeTextField.returnKeyType = .Done
        largeTextField.delegate = self
        view.addSubview(largeTextField)

        let textField = UITextField(frame: CGRect(x: 20, y: 312, width: 93, height: 31))
        textField.placeholder = "Text Field"
        textField.returnKeyType = .Done
        textField.delegate = self
        view.addSubview(textField)

        let items = ["Segmented", "Control"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 20, y: 373, width: 190, height: 30)
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)

        let switchControl = UISwitch(frame: CGRect(x: 223, y: 374, width: 79, height: 27))
        switchControl.setOn(true, animated: false)
        view.addSubview(switchControl)
    }
}