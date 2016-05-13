//
//  DetailTableViewController.swift
//  Restaurants
//
//  Created by Alejocram on 7/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var nameTableViewCell: UITableViewCell!
    @IBOutlet weak var addressTableViewCell: UITableViewCell!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var categoryTableViewCell: UITableViewCell!
    @IBOutlet weak var scheduleTableViewCell: UITableViewCell!
    @IBOutlet weak var paymentMethodsTableViewCell: UITableViewCell!
    @IBOutlet weak var wifiTableViewCell: UITableViewCell!
    @IBOutlet weak var playgroundTableViewCell: UITableViewCell!
    @IBOutlet weak var webPageTableViewCell: UITableViewCell!
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    var restaurant:Restaurant?
//        = Restaurant(name: "Mis Carnes", address: "Av 43 # 56 - 32", category: "Asados", wifi: true, webPage: "www.miscarnes.com", image: "pizza-restaurant")

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.nameTableViewCell.textLabel?.text = restaurant!.name
        self.addressTableViewCell.textLabel?.text = restaurant!.address
        self.detailsTextView.text = restaurant!.details
        self.categoryTableViewCell.textLabel?.text = restaurant!.category
        self.scheduleTableViewCell.textLabel?.text = restaurant!.schedule
        self.paymentMethodsTableViewCell.detailTextLabel?.text = restaurant!.paymentMethods
        self.wifiTableViewCell.detailTextLabel?.text = (restaurant!.wifi == true) ? "Si" : "No"
        self.playgroundTableViewCell.detailTextLabel?.text = restaurant!.playground == true ? "Si" : "No"
        self.webPageTableViewCell.textLabel?.text = restaurant!.webPage
        self.rankingLabel.text = String(restaurant!.ranking!)
        self.imageImageView.image = UIImage(named: restaurant!.image!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("webpageRestaurant", sender: restaurant?.webPage)
    }

    // MARK: - Table view data source

/*    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        let destinationViewController = segue.destinationViewController as! WebpageViewController
        destinationViewController.url = sender as? String
    }
    

}
