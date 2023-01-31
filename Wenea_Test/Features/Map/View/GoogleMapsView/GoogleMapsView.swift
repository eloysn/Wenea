//
//  GoogleMapsView.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    @Binding var mapState: GoogleMapsViewState
    let changePosition: (Coordinates, Float) -> Void
    func makeUIView(context: Context) -> GMSMapView {
        let map = GMSMapView(frame: .zero)
        map.delegate = context.coordinator
        return map
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        uiView.userLocation(coordinates: mapState.mapCentre, zoom: mapState.zoom)
        uiView.clear()
        mapState.markers.map(\.asGMSMarker).forEach { $0.map = uiView }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(owner: self, changePosition: changePosition)
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        let owner: GoogleMapsView
        let changePosition: (Coordinates, Float) -> Void
        init(
            owner: GoogleMapsView,
            changePosition: @escaping (Coordinates, Float) -> Void
        ) {
            self.owner = owner
            self.changePosition = changePosition
        }
        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            changePosition(mapView.camera.target.toCoordinates, position.zoom)
        }
    }
}

extension GMSMapView {
    @discardableResult
    func userLocation(enable isMyLocationEnabled: Bool) -> Self {
        self.isMyLocationEnabled = isMyLocationEnabled
        return self
    }
    @discardableResult
    func userLocation(coordinates: Coordinates?, zoom: Float?) -> Self {
        let newPosition = GMSCameraPosition(
            target: coordinates?.toCLLocationCoordinate2D ?? camera.target,
            zoom: zoom ?? camera.zoom
        )
        animate(to: newPosition)
        return self
    }
}
