//
//  MapView.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Foundation
import SwiftUI
import Combine

struct MapView: View {
    @ObservedObject var store: MapStore

    var body: some View {
        LoadingView(isShowing: $store.state.mapState.loading) {
            ZStack(alignment: .topTrailing) {
                GoogleMapsView(mapState: $store.state.mapState) {
                    store.dispatch(action: .setCoordinates($0, zoom: $1))
                }.edgesIgnoringSafeArea(.all)
                Menu {
                    Section {
                        Button("all filter".uppercased(), action: {
                            store.dispatch(action: .setFilter(type: nil))
                        })
                        ForEach(MarkerInfoType.allCases, id: \.hashValue) { type in
                            Button("\(type.rawValue.uppercased())", action: {
                                store.dispatch(action: .setFilter(type: type))
                            })
                        }
                    }
                } label: {
                    Button(""){}.buttonStyle(FilterButtonStyle())
                }
            }
        }.onAppear(perform: { store.dispatch(action: .onAppear) })
    }
}



