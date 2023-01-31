//
//  MarkerInfo+GMSMarker.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import Foundation
import GoogleMaps.GMSMarker

extension MarkerInfo {
    var asGMSMarker: GMSMarker {
        let marker = GMSMarker(position: position.toCLLocationCoordinate2D)
        let icon = UIImage(systemName: type.imageType)?.withRenderingMode(.alwaysOriginal).withTintColor(type.colorType)
        let markerView = UIImageView(image: icon)
        markerView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        marker.iconView = markerView
        return marker
    }
}
