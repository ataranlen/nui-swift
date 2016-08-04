//
//  ViewController.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/10/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
