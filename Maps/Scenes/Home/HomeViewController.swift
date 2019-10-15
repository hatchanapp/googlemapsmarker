//
//  ViewController.swift
//  Maps
//
//  Created by hatchanapp on 08/10/19.
//  Copyright © 2019 hatchanapp. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    
    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMarker()
    }
    
    func addMarker() {
        
        let position = CLLocationCoordinate2D(latitude: 40.689477, longitude: -74.044779)
        let marker = PlaceMarker(withPlaceName: "Statue of Liberty", position: position)
        marker.map = mapView
        
        mapView.animate(to: GMSCameraPosition(target: position, zoom: 18.0))
    }

}

