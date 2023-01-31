//
//  MarkerInfoType.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import UIKit

enum MarkerInfoType: String, CaseIterable {
    case car, bicycle, plane, train
    
    var imageType: String {
        switch self {
        case .car: return "car.circle"
        case .bicycle: return "bicycle.circle"
        case .plane: return "airplane.circle"
        case .train: return "tram.circle"
        }
    }
    var colorType: UIColor {
        switch self {
        case .car: return .systemTeal
        case .bicycle: return .systemCyan
        case .plane: return .systemIndigo
        case .train: return .systemPink
        }
    }
}

extension MarkerInfoType {
    init(type: MapElementType) {
        switch type {
        case .car: self = .car
        case .bicycle: self = .bicycle
        case .plane: self = .plane
        case .train: self = .train
        }
    }
}

extension MarkerInfoType {
    var asElementType: MapElementType {
        switch self {
        case .car: return .car
        case .bicycle: return .bicycle
        case .plane: return .plane
        case .train: return .train
        }
    }
}


