//
//  MapViewController.swift
//  Restaurants
//
//  Created by Alejocram on 18/05/16.
//  Copyright © 2016 Eafit. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    var mapView:GMSMapView!
    var restaurant:Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.cameraWithLatitude((restaurant?.lat)!,longitude:(restaurant?.lon)!, zoom: 15)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        self.view = mapView
        
        setMarker(restaurant!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMarker(place:Restaurant){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(place.lat!, place.lon!)
        marker.title = place.name
        marker.snippet = place.details
        marker.map = mapView
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
