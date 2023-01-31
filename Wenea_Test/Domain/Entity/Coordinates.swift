//
//  Coordinates.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import CoreLocation.CLLocation

struct Coordinates {
    var latitude: Double
    var longitude: Double
}

extension Coordinates {
    init(location: CLLocation) {
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
}

extension Coordinates {
    var toCLLocationCoordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}

extension Coordinates {
    var toCLLocation: CLLocation {
        CLLocation(
            latitude: latitude,
            longitude: longitude
        )
    }
}

extension CLLocationCoordinate2D {
    var toCoordinates: Coordinates {
        Coordinates(
            latitude: latitude,
            longitude: longitude
        )
    }
}
