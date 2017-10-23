//
//  SigSearchBar.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class SigSearchBar: UISearchBar {
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            
            let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
            let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
            textFieldInsideSearchBarLabel?.textColor = placeholderColor
        }
    }
    
    @IBInspectable var textColor: UIColor? {
        didSet {
            let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
            textFieldInsideSearchBar?.textColor = textColor
        }
    }
    
    @IBInspectable var magnifyingGlassColor: UIColor? {
        
        didSet {
            
            if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField,
                let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
                
                //Magnifying glass
                glassIconView.image = glassIconView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
                glassIconView.tintColor = magnifyingGlassColor
                
            }
        }
    }
}
