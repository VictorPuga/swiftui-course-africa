//
//  LocationModel.swift
//  Africa
//
//  Created by Víctor Manuel Puga Ruiz on 03/12/20.
//

import Foundation
import MapKit

struct NationalParkLocation {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}

extension NationalParkLocation: Codable, Identifiable { }
