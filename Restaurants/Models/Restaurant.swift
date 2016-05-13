//
//  Restaurant.swift
//  Restaurants
//
//  Created by Alejocram on 7/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    var name:String?
    var address:String?
    var details:String?
    var lat:Double?
    var lon:Double?
    var category:String?
    var schedule:String?
    var paymentMethods:String?
    var wifi:Bool?
    var playground:Bool?
    var webPage:String?
    var ranking:Float?
    var image:String?
    
    //Inicializador designado
    init(name:String, address:String, details:String, lat:Double, lon:Double, category:String, schedule:String, paymentMethods:String, wifi:Bool, playground:Bool, webPage:String, ranking:Float, image:String){
        self.name = name
        self.address = address
        self.details = details
        self.lat = lat
        self.lon = lon
        self.category = category
        self.schedule = schedule
        self.paymentMethods = paymentMethods
        self.wifi = wifi
        self.playground = playground
        self.webPage = webPage
        self.ranking = ranking
        self.image = image
    }
    
    //Inicializadores por conveniencia
    convenience init(name:String, address:String, category:String, wifi:Bool, webPage:String, image:String){
        self.init(name: name, address: address, details: "dsi jfdishflshdigfhdsgdfis g h dghoidshg idsg dosgd", lat: 65.5545454, lon: -7.343434, category: category, schedule: "L-V 8-18", paymentMethods: "Efectivo, Mastercard, Visa", wifi: wifi, playground: false, webPage: webPage, ranking: 3, image: image)
    }
    
    static func restaurants() -> [Restaurant]{
        let restaurants:[Restaurant] = [
            Restaurant(name: "French Bread", address: "Calle 34 # 23-43", category: "Francesa", wifi: true, webPage: "www.french-bread-restaurant.com", image: "french-bread-restaurant"),
            Restaurant(name: "Breakfast", address: "Calle 34 # 23-43", category: "Tipica", wifi: true, webPage: "www.breakfast-restaurant.com", image: "breakfast-restaurant"),
            Restaurant(name: "Pizza", address: "Calle 34 # 23-43", category: "Italiana", wifi: true, webPage: "www.pizza-restaurant.com", image: "pizza-restaurant"),
            Restaurant(name: "Mexican", address: "Calle 34 # 23-43", category: "Mexicana", wifi: true, webPage: "www.mexican-restaurant.com", image: "mexican-restaurant"),
            Restaurant(name: "Parrilla", address: "Calle 34 # 23-43", category: "Asados", wifi: true, webPage: "www.parrilla-restaurant.com", image: "parrilla-restaurant")
        ]
        return restaurants
    }
}






















