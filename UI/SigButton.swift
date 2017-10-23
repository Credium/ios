//
//  SigButton.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 15..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class SigButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 2.0
    @IBInspectable var shadowColor: UIColor? = .black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    
    @IBInspectable var shadowOpacity: Float = 0.1
    @IBInspectable var shadowRadius: CGFloat = 8.0
    
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
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowRadius = shadowRadius
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
