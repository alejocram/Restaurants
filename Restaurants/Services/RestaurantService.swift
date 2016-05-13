//
//  RestaurantService.swift
//  Restaurants
//
//  Created by Alejocram on 13/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit
import Alamofire

public typealias CompletionHandlerGET =  (success: Bool, response: [[String : AnyObject]]) ->()

let headers = [
    "Authorization": "Basic a2lkXy1rN0Qtblo1TWI6YjI1YzQ2MTkzMzQ5NGU5YTg3NTAwY2ZmNmFlODA0NjY=",
    "Content-Type": "application/x-www-form-urlencoded"
]

class RestaurantService: NSObject {
    let url = "https://baas.kinvey.com/appdata/kid_-k7D-nZ5Mb/restaurants"
    
    func getContacts(completion:CompletionHandlerGET){
        Alamofire.request(.GET, url, parameters: nil, headers: headers)
            .responseJSON(){response in
                
                switch response.result {
                case .Success(let JSON):
                    print("Llamado de GET \(JSON)")
                    completion(success: true, response: JSON as! [[String : AnyObject]])
                case .Failure(let error):
                    completion(success: false, response: [["error":error.localizedDescription]])
                }
        }
    }
    
}
