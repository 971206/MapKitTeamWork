//
//  PinAnnotation.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import MapKit

class PinAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
        var title: String?
        var subtitle: String?

        init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
            self.coordinate = coordinate
            self.title = title
            self.subtitle = subtitle
            super.init()
        }
}
