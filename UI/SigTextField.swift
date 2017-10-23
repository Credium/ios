//
//  SigTextField.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 15..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class SigTextField: UITextField {

    //MARK: PROPERTIES
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var inset: CGFloat = 0
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        setup()
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: Overrides
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
