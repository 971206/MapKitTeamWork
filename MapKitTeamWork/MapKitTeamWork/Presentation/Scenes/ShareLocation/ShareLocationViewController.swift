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
    private var regionInMeters: Double = 1000000
    private var lat: Double?
    private var lng: Double?
    
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate  = self
        setupLocationManager()
        mapView.showsUserLocation = true
        setupAnnotation()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLocationManager() {
        locationManager?.requestAlwaysAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

    //MARK: - Setup Annotation
    private func setupAnnotation() {
        let centerLocation = CLLocationCoordinate2D(latitude: 41.716667, longitude: 44.783333)
                let region = MKCoordinateRegion.init(center: centerLocation,
                                                     latitudinalMeters: regionInMeters,
                                                     longitudinalMeters: regionInMeters)
          mapView.setRegion(region, animated: true)
          let pin = Pin(title:" Location", coordinate: centerLocation)
          mapView.addAnnotation(pin)
    }
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
          if annotation is Pin {
              let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
              pinAnnotationView.pinTintColor = .red
              pinAnnotationView.isDraggable = true
              pinAnnotationView.canShowCallout = true
              pinAnnotationView.animatesDrop = true
              return pinAnnotationView
          }
          return nil
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

//MARK: - CLLocationManagerDelegate and MKMapViewDelegate Extension
extension ShareLocationViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.lat = location.coordinate.latitude
        self.lng = location.coordinate.longitude
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
          switch newState {
          case .starting:
              view.dragState = .dragging
          case .ending, .canceling:
              view.dragState = .none
          default: break
          }
      }
}
