//
//  RestaurantModel.swift
//  Restaurants
//
//  Created by Alejocram on 13/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class RestaurantModel: NSObject {
    var restaurants = [Restaurant]()
    
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
