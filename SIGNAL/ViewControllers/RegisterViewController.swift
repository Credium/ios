//
//  RegisterViewController.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit
import Alamofire
import AAPhotoCircleCrop

class RegisterViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCheckField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var jobField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:))))
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        let name = nameField.text ?? ""
        let job = jobField.text ?? ""
        let phone = phoneField.text ?? ""
        let photo = profileImageView.image!
            
        doValidation()
        doRegister(username: username, password: password, name: name, job: job, phone: phone, photo: photo)
    }
    func doValidation() {
        
    }
    
    func doRegister(username: String, password: String, name: String, job: String, phone: String, photo: UIImage) {
        let apiUrl = "http://13.124.38.242:7504/account/register"
        
        let parameters: Parameters = [
            "username": username,
            "password": password,
            "full_name": name,
            "job": job,
            "phone_number": phone
        ]
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            multipartFormData.append(UIImagePNGRepresentation(photo)!,
                                     withName: "profile_photo",
                                     mimeType: "image/png")
        },
        usingThreshold: UInt64.init(),
        to: apiUrl,
        method: .post,
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if (sender.state == .ended) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }
    }
}

extension RegisterViewController: AACircleCropViewControllerDelegate {
    func circleCropDidCropImage(_ image: UIImage) {
        profileImageView.image = image
        addPhotoImageView.alpha = 0
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let circleCropController = AACircleCropViewController()
            circleCropController.image = image
            circleCropController.delegate = self
            self.present(circleCropController, animated: true)
            
        } else{
            print("Something went wrong")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
