//
//  LocatiionModel.swift
//  Africa
//
//  Created by solinx on 10/06/2023.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id, name, image: String
    let latitude, longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
