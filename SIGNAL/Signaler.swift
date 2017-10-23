//
//  Signaler.swift
//  SIGNAL
//
//  Created by Truth on 2017. 10. 16..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import Foundation

class Signaler {
    var id: Int
    var token: String
    var username: String
    var name: String
    var job: String
    var phone: String
    var profileImagePath: String
    
    init(id: Int, token: String, username: String,
         name: String, job: String, phone: String, profileImagePath: String) {
        self.id = id
        self.token = token
        self.username = username
        self.name = name
        self.job = job
        self.phone = phone
        self.profileImagePath = profileImagePath
    }
}
