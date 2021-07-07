//
//  MapViewController.swift
//  MapKitTeamWork
//
//  Created by Mac User on 07.06.21.
//


import UIKit
import MapKit

class MyMapViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    var country: String?
    var coordinates: [Double]?
    
    let pin: MKPointAnnotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let selectedCountryCoordinates = CLLocationCoordinate2D(latitude: coordinates![0], longitude: coordinates![1])
        
        let block = MKCoordinateRegion(
              center: selectedCountryCoordinates,
              latitudinalMeters: 1000000,
              longitudinalMeters: 1000000
            )

        myMap.setRegion(block, animated: true)
        
        pin.coordinate = selectedCountryCoordinates
              myMap.addAnnotation(pin)
    }
    


}

