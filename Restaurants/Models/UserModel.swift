//
//  UserModel.swift
//  Restaurants
//
//  Created by Alejocram on 14/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    typealias CompletionHandlerGET = (success: Bool, response: User) ->()
    
    let request = UserServices()

    func saveUser(user: User, completion:CompletionHandlerGET){
        let parameters : [String: AnyObject] = ["username": user.username!, "password": user.password!, "gener":user.gener!]
        
        request.register(parameters) { (success, response) -> () in
            if success{
                completion(success: true, response: user)
            }else{
                completion(success: false, response: user)
            }
            
        }
    }
}
