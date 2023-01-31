//
//  MockLocations.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import CoreLocation.CLLocation

final class MockLocations {
    func getMockLocationsFor(location: CLLocation, itemCount: Int) -> [CLLocation] {
        
        func getBase(number: Double) -> Double {
            return round(number * 1000)/1000
        }
        func randomCoordinate() -> Double {
            return Double(arc4random_uniform(140)) * 0.0001
        }
        
        let baseLatitude = getBase(number: location.coordinate.latitude - 0.007)
        
        let baseLongitude = getBase(number: location.coordinate.longitude - 0.008)
        
        var items = [CLLocation]()
        for _ in 0..<itemCount {
            
            let randomLat = baseLatitude + randomCoordinate()
            let randomLong = baseLongitude + randomCoordinate()
            let location = CLLocation(latitude: randomLat, longitude: randomLong)
            
            items.append(location)
            
        }
        
        return items
    }

}
