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
        
        let position = CLLocationCoordinate2D(latitude: -33.8469759, longitude: 150.3715249)
        let marker = PlaceMarker(withPlaceName: "Sydney, aUSTRALIA", position: position)
        marker.map = mapView
        
        mapView.animate(to: GMSCameraPosition(target: position, zoom: 17.0))
    }

}

