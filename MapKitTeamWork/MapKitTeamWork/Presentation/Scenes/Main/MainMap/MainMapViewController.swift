//
//  MainMapViewController.swift
//  MapKitTeamWork
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import UIKit
import MapKit

class MainMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createAnnotation(locations : [[String : Any]] ) {
        for locations in locations {
            let annotations : MKPointAnnotation!
            annotations.title = locations["title"] as! String
            annotations.coordinate = CLLocationCoordinate2D(latitude: locations["latitude"] as! CLLocationDegrees,
                                                            longitude: locations["longitude"] as! CLLocationDegrees)
        }
    }
}
