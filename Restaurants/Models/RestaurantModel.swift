//
//  RestaurantModel.swift
//  Restaurants
//
//  Created by Alejocram on 13/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

typealias CompletionHandler = (success: Bool, response: [Restaurant]) ->()

class RestaurantModel: NSObject {
    var restaurants = [Restaurant]()
    
    //MARK: Services
    
    func getRestaurantsFromServer(completion: CompletionHandler){
        let request = RestaurantService()
        request.getRestaurants { (success, response) in
            if success {
                self.restaurants.removeAll()
                
                for item in response {
                    let restaurantTmp = Restaurant(name: item["name"] as! String, address: item["address"] as! String, details: item["details"] as! String, lat: item["lat"] as! Double, lon: item["lon"] as! Double, category: item["category"] as! String, schedule: item["schedule"] as! String, paymentMethods: item["paymentMethods"] as! String, wifi: item["wifi"] as! Bool, playground: item["playground"] as! Bool, webPage: item["webPage"] as! String, ranking: item["ranking"] as! Float, image: item["image"] as! String)
                    
                    self.restaurants.append(restaurantTmp)
                    
                    completion(success: true, response: self.restaurants)
                }
            } else {
                completion(success: false, response: self.restaurants)
            }
        }
    }
    
    //MARK: Mocks
    
    static func restaurantsMock() -> [Restaurant]{
        let restaurants:[Restaurant] = [
            Restaurant(name: "French Bread", address: "Calle 34 # 23-43", category: "Francesa", wifi: true, webPage: "https://www.google.com", image: "french-bread-restaurant"),
            Restaurant(name: "Breakfast", address: "Calle 34 # 23-43", category: "Tipica", wifi: true, webPage: "https://www.apple.com", image: "breakfast-restaurant"),
            Restaurant(name: "Pizza", address: "Calle 34 # 23-43", category: "Italiana", wifi: true, webPage: "https://www.yahoo.com", image: "pizza-restaurant"),
            Restaurant(name: "Mexican", address: "Calle 34 # 23-43", category: "Mexicana", wifi: true, webPage: "https://www.microsoft.com", image: "mexican-restaurant"),
            Restaurant(name: "Parrilla", address: "Calle 34 # 23-43", category: "Asados", wifi: true, webPage: "https://www.gmail.com", image: "parrilla-restaurant")
        ]
        return restaurants
    }
}
