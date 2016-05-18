//
//  RestaurantModel.swift
//  Restaurants
//
//  Created by Alejocram on 13/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit
import CoreData

typealias CompletionHandler = (success: Bool, response: [Restaurant]) ->()

class RestaurantModel: NSObject {
    var restaurants = [Restaurant]()
    
    var managedObjects = [NSManagedObject]()
    
    //MARK: CoreData
    
    func saveRestaurant(restaurant: Restaurant) throws {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Restaurants", inManagedObjectContext: managedContext)
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        managedObject.setValue(restaurant.name, forKey: "name")
        managedObject.setValue(restaurant.address , forKey: "address")
        managedObject.setValue(restaurant.details, forKey: "details")
        managedObject.setValue(restaurant.lat, forKey: "lat")
        managedObject.setValue(restaurant.lon, forKey: "lon")
        managedObject.setValue(restaurant.category, forKey: "category")
        managedObject.setValue(restaurant.schedule, forKey: "schedule")
        managedObject.setValue(restaurant.paymentMethods, forKey: "paymentMethods")
        managedObject.setValue(restaurant.wifi, forKey: "wifi")
        managedObject.setValue(restaurant.playground, forKey: "playground")
        managedObject.setValue(restaurant.webPage, forKey: "webPage")
        managedObject.setValue(restaurant.ranking, forKey: "ranking")
        managedObject.setValue(restaurant.image, forKey: "image")
        
        do {
            try managedContext.save()
            managedObjects.append(managedObject)
            manageObjectToRestauran()
//            return true
//            self.makeAlert("El restaurante ha sido guardado", type: .Default)
        } catch let error as NSError{
            print("No se pude guardar los datos, Error: \(error.localizedDescription)")
            throw error
//            self.makeAlert("Ha ocurrido un error al guardar el restaurante: \(error.description)", type: .Default)
        }
    }
    
    func fetchRestaurants() throws {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Restaurants")
        
        do {
            let result = try managedContext.executeFetchRequest(fetch)
            managedObjects = result as! [NSManagedObject]
            return manageObjectToRestauran()
        } catch let error as NSError {
            print("No pude recuperar datos, Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func manageObjectToRestauran(){
        
        restaurants.removeAll()
        for managedObject in managedObjects {
            let restaurantTmp = Restaurant(
                name: managedObject.valueForKey("name") as! String,
                address: managedObject.valueForKey("address") as! String,
                details: managedObject.valueForKey("details") as! String,
                lat: managedObject.valueForKey("lat") as! Double,
                lon: managedObject.valueForKey("lon") as! Double,
                category: managedObject.valueForKey("category") as! String,
                schedule: managedObject.valueForKey("schedule") as! String,
                paymentMethods: managedObject.valueForKey("paymentMethods") as! String,
                wifi: managedObject.valueForKey("wifi") as! Bool,
                playground: managedObject.valueForKey("playground") as! Bool,
                webPage: managedObject.valueForKey("webPage") as! String,
                ranking: managedObject.valueForKey("ranking") as! Float,
                image: managedObject.valueForKey("image") as! String)
            
            restaurants.append(restaurantTmp)
        }
    }
    
    //MARK: Services
    
    func getRestaurantsFromServer(completion: CompletionHandler){
        let request = RestaurantService()
        request.getRestaurants { (success, response) in
            if success {
                self.restaurants.removeAll()
                
                for item in response {
                    let restaurantTmp = Restaurant(name: item["name"] as! String, address: item["address"] as! String, details: item["details"] as! String, lat: item["lat"] as! Double, lon: item["lon"] as! Double, category: item["category"] as! String, schedule: item["schedule"] as! String, paymentMethods: item["paymentMethods"] as! String, wifi: item["wifi"] as! Bool, playground: item["playground"] as! Bool, webPage: item["webPage"] as! String, ranking: item["ranking"] as! Float, image: item["image"] as! String)
                    
                    self.restaurants.append(restaurantTmp)
                }
                
                for restaurantTmp in self.restaurants {
                    do{
                        try self.saveRestaurant(restaurantTmp)
                    } catch let error as NSError {
                        print(error.localizedDescription)
                        completion(success: false, response: self.restaurants)
                    }
                }
                
                completion(success: true, response: self.restaurants)
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
