//
//  MapElements.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

typealias MapElements = [MapElement]

extension MapElements {
    init(response: MapResponse) {
        let elements = response.elements.map { MapElement(coordinates: .init(location: $0.coodinates), type: MapElementType($0.type.rawValue)) }
        self.init(elements)
    }
}

struct MapElement {
    var coordinates: Coordinates
    var type: MapElementType
}

enum MapElementType: String {
    case car, bicycle, plane, train
    init(_ fromRawValue: String) {
        self = MapElementType(rawValue: fromRawValue) ?? .car
    }
}


