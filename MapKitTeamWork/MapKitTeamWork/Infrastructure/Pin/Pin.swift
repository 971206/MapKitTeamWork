//
//  Pin.swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import UIKit
import MapKit


class Pin: NSObject, MKAnnotation {
    var title:String?
    var coordinate: CLLocationCoordinate2D
    init(title:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

