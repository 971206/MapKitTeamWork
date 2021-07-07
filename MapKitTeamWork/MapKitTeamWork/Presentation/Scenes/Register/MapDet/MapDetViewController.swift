//
//  MapDetViewController.swift
//  MapKitTeamWork
//
//  Created by Lizi Chichua on 7/7/21.
//

import UIKit
import MapKit

class MapDetViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var country: String?
    var coordinates: [Double]?
    
    let myPin: MKPointAnnotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myCoordinates = CLLocationCoordinate2D(latitude: coordinates![0], longitude: coordinates![1])
        
        let region = MKCoordinateRegion(
              center: myCoordinates,
              latitudinalMeters: 1000000,
              longitudinalMeters: 1000000
            )

        map.setRegion(region, animated: true)
        
        myPin.coordinate = myCoordinates
              map.addAnnotation(myPin)
    }
    


}
