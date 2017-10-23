//
//  HomeViewController.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove 1px bottom line
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        initTitle()
        
//        scrollView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        var frame : CGRect?
//        for i in 0..<7 {
//            let button = UIButton(type: .custom)
//            if i == 0 {
//                frame = CGRect(x: 10, y: 5, width: 80, height: 20)
//            }else{
//                frame = CGRect(x: CGFloat(i * 120), y: 5, width: 80, height: 20)
//            }
//            
//            button.frame = frame!
//            button.tag = i
//            button.backgroundColor = .black
//            scrollView.addSubview(button)
//        }
//        scrollView.contentSize = CGSize(width: 840, height: scrollView.frame.size.height)
//        self.view.addSubview(scrollView)
    }
    
    func initTitle() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 142))
        
        let image = UIImage(named: "pic_navbar_logotype")
        let imageView = UIImageView(image: image)
        
        let textfield = UITextField(frame: CGRect(x: 0, y: 39.7, width: view.bounds.width, height: 36))
        
        containerView.addSubview(imageView)
        containerView.addSubview(textfield)
        
        self.navigationItem.titleView = imageView
    }
}
