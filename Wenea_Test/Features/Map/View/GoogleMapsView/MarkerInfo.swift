//
//  MarkerInfo.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import Foundation
struct MarkerInfo {
    let position: Coordinates
    let type: MarkerInfoType
}

extension MarkerInfo {
    init(entity: MapElement) {
        self.init(
            position: entity.coordinates,
            type: .init(type: entity.type)
        )
    }
}

