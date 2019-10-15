//
//  PlaceMarker.swift
//  Maps
//
//  Created by hatchanapp on 08/10/19.
//  Copyright © 2019 hatchanapp. All rights reserved.
//

import UIKit
import GoogleMaps

class PlaceMarker: GMSMarker {
    
    var placeName: String
    
    init(withPlaceName placeName: String, position pos: CLLocationCoordinate2D) {
        self.placeName = placeName
        super.init()
        
        let label = PointingLabel(withText: placeName, font: UIFont.liberationSans(size: 18.0))
        self.iconView = label
        self.position = pos
    }
}
