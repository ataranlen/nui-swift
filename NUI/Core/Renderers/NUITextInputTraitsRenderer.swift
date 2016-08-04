//
//  NUITextInputTraitsRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/27/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUITextInputTraitsRenderer: NSObject {
    
    
    static func renderKeyboard(_ traits: UITextInputTraits, withClass className: String) {
        
        // FIXME: Swift doesn't let you set properties declared with an `optional` keyword, so downcast is needed.
        // Couldn't come up with any workaround yet.
        if NUISettings.hasProperty("keyboard-appearance", withClass: className) {
            
            let keyboardAppearance = NUISettings.getKeyboardAppearance("keyboard-appearance", withClass: className)
            
            if let traits = traits as? UITextField {
                traits.keyboardAppearance = keyboardAppearance
            } else if let traits = traits as? UITextView {
                traits.keyboardAppearance = keyboardAppearance
            }
        }
    }
}
