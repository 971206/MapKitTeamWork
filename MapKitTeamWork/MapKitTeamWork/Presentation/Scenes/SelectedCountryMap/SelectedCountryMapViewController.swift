//
//  SelectedCountryMapViewController.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import UIKit
import MapKit

class SelectedCountryMapViewController: BaseViewController {
    
    @IBOutlet weak var mapKit: MKMapView!
    var country = CountryModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
