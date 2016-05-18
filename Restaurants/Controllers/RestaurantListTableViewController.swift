//
//  RestaurantListTableViewController.swift
//  Restaurants
//
//  Created by Alejocram on 11/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {
    var model = RestaurantModel()
    let cellIdentifier = "restaurantCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRestaurants()
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(setUsername),
            name: "setUsername",
            object: nil)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func setUsername() {
        self.navigationItem.rightBarButtonItem?.title = (NSUserDefaults.standardUserDefaults().objectForKey("username") as! String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        let restaurant = model.restaurants[indexPath.row]
        // Configure the cell...
        cell.titleLabel.text = restaurant.name
        cell.detailsLabel.text = restaurant.details
        cell.rankingLabel.text = String(restaurant.ranking!)
        cell.iconImageView.image = UIImage(named: restaurant.image!)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let restaurant = model.restaurants[indexPath.row]
        performSegueWithIdentifier("detailRestaurant", sender: restaurant)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier! {
        case "detailRestaurant":
            let destinationViewController = segue.destinationViewController as! DetailTableViewController
            destinationViewController.restaurant = (sender as! Restaurant)
        case "login":
            let destinationViewController = segue.destinationViewController as! ViewController
        default:
            UIAlertController(title: "Error", message: "No se encontro el segue", preferredStyle: .Alert)
        }
    }
    
    func getRestaurants(){
        model.getRestaurantsFromServer { (success, response) in
            if success {
                do{
                    try self.model.fetchRestaurants()
                    self.tableView.reloadData()
                }catch let error as NSError{
                    let alertController = UIAlertController(title: "Persistencia", message: "No se pudo traer los datos desde la base de datos \(error.localizedDescription)", preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            } else {
                
                let alertController = UIAlertController(title: "Conexión", message: "No se pudo realizar la conexión", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                
                // Al no tener conexion, se prueba que puede guardar */
                /*do{
                    try self.model.saveRestaurant(Restaurant(name: "El cielo", address: "Calle 10 # 60 - 35 int 1305", category: "Gourmet", wifi: true, webPage: "https://www.amazon.com", image: "parrilla-restaurant"))
                }catch let error as NSError{
                    print(error.localizedDescription)
                }*/
                
                do{
                    try self.model.fetchRestaurants()
                    self.tableView.reloadData()
                }catch let error as NSError{
                    let alertController = UIAlertController(title: "Persistencia", message: "No se pudo traer los datos desde la base de datos \(error.localizedDescription)", preferredStyle: .Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

















