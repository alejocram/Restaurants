//
//  User.swift
//  Restaurants
//
//  Created by Alejocram on 14/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class User: NSObject {

    var username:String?
    var password:String?
    var gener:String?
    
    init(username:String, password:String, gener:String) {
        self.username = username
        self.password = password
        self.gener = gener
    }
}
