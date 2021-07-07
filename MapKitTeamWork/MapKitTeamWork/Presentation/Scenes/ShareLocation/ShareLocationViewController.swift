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

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    var lat: Double?
    var lng: Double?
//    private var globalLocations: [CLLocationCoordinate2D] = []
    private var globalLocations: CLLocationCoordinate2D?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        self.navigationController?.isNavigationBarHidden = true


    }
    
    
    
    @IBAction func onShare(_ sender: Any) {
        didTapShareButton()
    }
    
    
    
}

extension ShareLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("User agreed to request")
            locationManager?.startUpdatingLocation()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
        print("Lat: \(lat) :: Lng: \(lng)")
        
        print("http://maps.apple.com/?ll=\(lat!),\(lng!)")
//        globalLocations.append(location.coordinate)
        self.globalLocations = location.coordinate
        guard let globalLocations = globalLocations else {return}
//        locationVCardURLFromCoordinate(coordinate: globalLocations)

    }
    
    
    func vCardURL(from coordinate: CLLocationCoordinate2D) -> URL {
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

    func didTapShareButton() {
        if let url = URL(string: "https://maps.apple.com?ll=\(lat!),\(lng!)") {
          var activity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        }
        
    }
    
    

}


