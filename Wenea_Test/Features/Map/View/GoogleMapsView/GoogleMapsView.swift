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

    func makeUIView(context: Context) -> GMSMapView {
        GMSMapView(frame: .zero)
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        uiView
            .userLocation(enable: mapState.userLocationEnable)
            //.userLocation(coordinates: mapState.userLocation, zoom: mapState.zoom)

//        mapState.markers.map(\.asGMSMarker).forEach { $0.map = uiView }
    }
 }

extension GMSMapView {
    @discardableResult
    func userLocation(enable isMyLocationEnabled: Bool) -> Self {
        self.isMyLocationEnabled = isMyLocationEnabled
        return self
    }
//    @discardableResult
//    func userLocation(coordinates: CustomMapCoordinates?, zoom: Float?) -> Self {
//        let newPosition = GMSCameraPosition(
//            target: coordinates?.toCLLocationCoordinate2D ?? camera.target,
//            zoom: zoom ?? camera.zoom
//        )
//        animate(to: newPosition)
//        return self
//    }
}

struct GoogleMapsViewPreview: PreviewProvider {
    static var previews: some View {
        GoogleMapsView(mapState: .constant(.init()))
    }
}
