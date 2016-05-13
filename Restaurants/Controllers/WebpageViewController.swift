//
//  WebpageViewController.swift
//  Restaurants
//
//  Created by Alejocram on 13/05/16.
//  Copyright © 2016 EAFIT. All rights reserved.
//

import UIKit

class WebpageViewController: UIViewController {
    @IBOutlet weak var browserWebView: UIWebView!
    
    var url:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURL(string:url!)
        let request = NSURLRequest(URL: requestURL!)
        browserWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
