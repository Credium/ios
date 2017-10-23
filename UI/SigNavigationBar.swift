//
//  SigNavigationBar.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

@IBDesignable class SigNavigationBar: UINavigationBar {
    
    ///The height you want your navigation bar to be of
    @IBInspectable var navigationBarHeight: CGFloat = 300
    
    ///The difference between new height and default height
//    @IBInspectable let heightIncrease:CGFloat = navigationBarHeight - 44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        let frame = layer.frame
        layer.frame = CGRect(x: 0, y: 0, width: frame.width, height: navigationBarHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let frame = layer.frame
        layer.frame = CGRect(x: 0, y: 0, width: frame.width, height: navigationBarHeight)
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let screenRect = UIScreen.main.bounds
        return CGSize(width: screenRect.size.width, height: navigationBarHeight)
    }
}
