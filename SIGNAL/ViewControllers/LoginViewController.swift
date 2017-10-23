//
//  LoginViewController.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 15..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        doLogin(username: username, password: password)
    }
    
    func doLogin(username: String, password: String) {
        let apiUrl = "http://13.124.38.242:7504/account/login"
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(apiUrl, method: .post, parameters: parameters).responseJSON { response in
            guard let json = response.result.value as? [String:Any] else{
                print("Error: \(String(describing: response.result.error))")
                return
            }
            
            if let error = json["error"] as? String {
                self.alert(title: "오류", message: error)
            }
            
            if let name = json["full_name"] as? String {
                guard let id = json["id"] as? Int,
                let token = json["token"] as? String,
                let username = json["username"] as? String,
                let job = json["job"] as? String,
                let phone = json["phone_number"] as? String,
                let profileImagePath = json["profile_photo_path"] as? String else {
                    return
                }
                let signaler = Signaler(id: id, token: token, username: username, name: name, job: job, phone: phone, profileImagePath: profileImagePath)
                print(signaler)
//                self.alert(title: "로그인 성공", message: "\(name)님! Signal에 오신걸 환영합니다!")
                self.performSegue(withIdentifier: "LoginToMain", sender: self)
            }
        }
    }
}
