//
//  SelectedCountryMapViewController.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import UIKit
import MapKit

class SelectedCountryMapViewController: BaseViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var country = CountryModel()
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var countryLocation: CLLocationCoordinate2D!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        latitude = country.coordinates?[0]
        longitude = country.coordinates?[1]
        
        if UserDefaults.standard.value(forKey: "latitude") != nil {
            latitude = (UserDefaults.standard.value(forKey: "latitude") as! CLLocationDegrees)
        }
        
        if UserDefaults.standard.value(forKey: "longitude") != nil {
            longitude = (UserDefaults.standard.value(forKey: "longitude") as! CLLocationDegrees)
        }
        setupMapView()
    }
    
    private func setupMapView() {
        
        mapView.delegate  = self
        let centerLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let pin = PinAnnotation(coordinate: centerLocation, title:"Dragable Pin", subtitle:"")
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: centerLocation, latitudinalMeters: 100_000, longitudinalMeters: 100_00)
        
        self.mapView.setRegion(region, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is PinAnnotation {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            pinAnnotationView.pinTintColor = .purple
            pinAnnotationView.isDraggable = true
            pinAnnotationView.canShowCallout = true
            pinAnnotationView.animatesDrop = true
            return pinAnnotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let lat = view.annotation?.coordinate.latitude
        let long = view.annotation?.coordinate.longitude

        print("Clic pin lat \(String(describing: lat)) long \(String(describing: long))")
        saveLongLatToUserDefaults(latitude: lat, longitude: long)
    }
    
    private func saveLongLatToUserDefaults(latitude: CLLocationDegrees?, longitude: CLLocationDegrees? ) {
        guard let lat = latitude else {return}
        guard let long = longitude else {return}
        UserDefaults.standard.set(lat, forKey: "latitude")
        UserDefaults.standard.set(long, forKey: "longitude")
    }
        
}
