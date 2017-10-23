//
//  CardView.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = 1.0
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowColor: UIColor? = .black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    
    @IBInspectable var shadowOpacity: Float = 0.1
    @IBInspectable var shadowRadius: CGFloat = 8.0
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowRadius = shadowRadius
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }

}
