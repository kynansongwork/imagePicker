//
//  TextViewDelegate.swift
//  ImagePicker
//
//  Created by Kynan Song on 14/05/2018.
//  Copyright © 2018 Kynan Song. All rights reserved.
//

import Foundation
import UIKit

class TextViewDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
}
