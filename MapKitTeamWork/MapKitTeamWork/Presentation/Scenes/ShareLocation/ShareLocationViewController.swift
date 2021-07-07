//
//  ShareLocationViewController.swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import UIKit
import MapKit
import CoreLocation

class ShareLocationViewController: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Private Properties
    private var locationManager: CLLocationManager?
    private var lat: Double?
    private var lng: Double?
    private var globalLocations: CLLocationCoordinate2D?
    
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - IBActions
    @IBAction func onShare(_ sender: Any) {
        shareButtonTapped()
    }
    
    func shareButtonTapped() {
        let coordinate = CLLocationCoordinate2D(latitude: lat ?? 0, longitude: lng ?? 0)
        let url = self.createVCardURL(from: coordinate)
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    //MARK: - Create vCardURL
    func createVCardURL(from coordinate: CLLocationCoordinate2D) -> URL {
        let vCardFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("vCard.loc.vcf")
        let vCardString = [
            "BEGIN:VCARD",
            "VERSION:4.0",
            "item1.URL;type=pref:http://maps.apple.com/?ll=\(coordinate.latitude),\(coordinate.longitude)",
            "item1.X-ABLabel:map url",
            "END:VCARD"
        ].joined(separator: "\n")
        do {
            try vCardString.write(toFile: vCardFileURL.path, atomically: true, encoding: .utf8)
        } catch let error {
            print("Error, \(error.localizedDescription), saving vCard: \(vCardString) to file path: \(vCardFileURL.path).")
        }
        return vCardFileURL
    }
}

//MARK: - CLLocationManagerDelegate Extension
extension ShareLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
    }
}
