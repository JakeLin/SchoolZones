//
//  ViewController.swift
//  SchoolZones
//
//  Created by Jake Lin on 10/02/2015.
//  Copyright (c) 2015 Jake Lin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let schoolLocation = CLLocationCoordinate2DMake(-37.776787, 145.272263)
        // Adds a polygon over school zone
        var coords: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2DMake(-37.771794, 145.260201),
            CLLocationCoordinate2DMake(-37.770844, 145.289512),
            CLLocationCoordinate2DMake(-37.780240, 145.291271),
            CLLocationCoordinate2DMake(-37.786888, 145.271873),
            CLLocationCoordinate2DMake(-37.784717, 145.264020),
            CLLocationCoordinate2DMake(-37.780545, 145.258141)]
        
        var polygon = MKPolygon(coordinates: &coords, count:coords.count)
        
        mapView.addOverlay(polygon)
        
        // Add school annotation
        var schoolAnnotation = SchoolAnnotation()
        schoolAnnotation.coordinate = schoolLocation
        schoolAnnotation.title = "Croydon Hills Primary School"
        mapView.addAnnotation(schoolAnnotation)
        
        // Center the school
        mapView.setCenterCoordinate(schoolLocation, animated: true)
        
        // Set zoom level
        let viewRegion = MKCoordinateRegionMakeWithDistance(schoolLocation, 3500, 3500)
        var adjustedRegion = mapView.regionThatFits(viewRegion)
        mapView.setRegion(adjustedRegion, animated:true)
        mapView.showsUserLocation = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        println("rendererForOverlay")
        
        if (overlay is MKPolygon) {
            var pr = MKPolygonRenderer(overlay: overlay)
            pr.fillColor = UIColor.magentaColor().colorWithAlphaComponent(0.2)
            pr.strokeColor = UIColor.magentaColor().colorWithAlphaComponent(0.5)
            pr.lineWidth = 5
            return pr
        }
        return nil
    }
}
