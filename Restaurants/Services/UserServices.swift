//
//  UserServices.swift
//  Restaurants
//
//  Created by Alejocram on 14/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit
import Alamofire

public typealias CompletionHandlerPOST =  (success: Bool, response: [String : AnyObject]) ->()

class UserServices: NSObject {

    let url = "https://baas.kinvey.com/appdata/kid_-k7D-nZ5Mb/users"
    
    func register(parameters:[String: AnyObject], completion:CompletionHandlerPOST){
        Alamofire.request(.POST, url, parameters:parameters, headers:headers)
            .responseJSON(){response in
                switch response.result {
                case .Success(let JSON):
                    completion(success: true, response: JSON as! [String : AnyObject])
                case .Failure(let error):
                    completion(success: false, response: ["error":error.localizedDescription])
                }
        }
    }

    
    
}
