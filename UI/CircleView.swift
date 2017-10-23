//
//  CircleImageView.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 15..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class CircleImageView: UIImageView {
    
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
        layer.masksToBounds = true
        layer.cornerRadius = self.bounds.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
