//
//  SchoolAnnotation.swift
//  SchoolZones
//
//  Created by Jake Lin on 10/02/2015.
//  Copyright (c) 2015 Jake Lin. All rights reserved.
//

import UIKit
import MapKit

class SchoolAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    
    override init() {
        coordinate = CLLocationCoordinate2DMake(0, 0)
        title = ""
        subtitle = ""
    }
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        coordinate = newCoordinate
    }
}
